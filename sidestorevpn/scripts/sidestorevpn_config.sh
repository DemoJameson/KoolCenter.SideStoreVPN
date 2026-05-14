#!/bin/sh

[ -f /koolshare/scripts/base.sh ] && source /koolshare/scripts/base.sh
alias echo_date='echo 【$(TZ=UTC-8 date -R +%Y年%m月%d日\ %X)】:'

module="sidestorevpn"
CHAIN="SIDESTORE_CHAIN"
LOG_FILE="/tmp/upload/${module}_log.txt"
LOCK_FILE="${LOCK_FILE:-/var/lock/${module}.lock}"
PATH="${PATH}:/usr/sbin:/usr/bin:/sbin:/bin"

if ! type http_response >/dev/null 2>&1; then
	http_response() {
		printf '%s\n' "$*"
	}
fi

get() {
	dbus get "$1" 2>/dev/null
}

dbus_set() {
	dbus set "$1=$2" >/dev/null 2>&1
}

set_lock() {
	mkdir -p "$(dirname "${LOCK_FILE}")" >/dev/null 2>&1
	exec 9>"${LOCK_FILE}"
	flock -n 9 || {
		http_response "$1"
		exit 1
	}
}

unset_lock() {
	flock -u 9
	rm -rf "${LOCK_FILE}"
}

get_virtual_ip() {
	local vip
	vip="$(get ${module}_virtual_ip)"
	[ -z "$vip" ] && vip="10.7.0.1"
	echo "$vip"
}

valid_ipv4() {
	echo "$1" | awk -F. '
		NF != 4 { exit 1 }
		{
			for (i = 1; i <= 4; i++) {
				if ($i !~ /^[0-9]+$/ || $i < 0 || $i > 255) {
					exit 1
				}
			}
		}
	'
}

client_ips() {
	get ${module}_clients | awk '
		BEGIN { FS = "[ \t]+" }
		/^[ \t]*$/ { next }
		/^[ \t]*#/ { next }
		{
			ip = $1
			if (ip in seen) {
				next
			}
			split(ip, o, ".")
			if (length(o) == 4) {
				ok = 1
				for (i = 1; i <= 4; i++) {
					if (o[i] !~ /^[0-9]+$/ || o[i] < 0 || o[i] > 255) {
						ok = 0
					}
				}
				if (ok) {
					seen[ip] = 1
					print ip
				}
			}
		}
	'
}

delete_rule_loop() {
	while iptables "$@" >/dev/null 2>&1; do
		:
	done
}

chain_rule_count() {
	local count
	count="$(iptables -t nat -S "$CHAIN" 2>/dev/null | grep -c -- '--to-destination')"
	echo "$count"
}

clean_snat_rules() {
	local vip rule
	vip="$(get_virtual_ip)"
	iptables -t nat -S POSTROUTING 2>/dev/null | grep -- "--to-source ${vip}" | while read -r rule; do
		rule="$(echo "$rule" | sed 's/^-A /-D /')"
		# shellcheck disable=SC2086
		iptables -t nat $rule >/dev/null 2>&1
	done
}

close_sidestorevpn() {
	delete_rule_loop -t nat -D PREROUTING -j "$CHAIN"
	clean_snat_rules
	iptables -t nat -F "$CHAIN" >/dev/null 2>&1
	iptables -t nat -X "$CHAIN" >/dev/null 2>&1
}

start_sidestorevpn() {
	local vip ips ip count
	vip="$(get_virtual_ip)"
	ips="$(client_ips)"
	count=0

	echo_date "当前虚拟 iTunes 设备 IP：${vip}"
	if ! valid_ipv4 "$vip"; then
		echo_date "虚拟 iTunes 设备 IP 无效：${vip}"
		return 1
	fi
	if [ -z "$ips" ]; then
		echo_date "未读取到有效设备 IP，请先在页面添加设备！"
		return 1
	fi

	close_sidestorevpn
	[ -w /proc/sys/net/ipv4/ip_forward ] && echo 1 >/proc/sys/net/ipv4/ip_forward
	iptables -t nat -N "$CHAIN" || {
		echo_date "创建 ${CHAIN} 链失败！"
		return 1
	}

	for ip in $ips; do
		echo_date "添加设备规则：${ip}"
		iptables -t nat -A "$CHAIN" -s "$ip" -d "$vip" -j DNAT --to-destination "$ip" || {
			echo_date "添加 ${ip} DNAT 规则失败！"
			return 1
		}
		iptables -t nat -A POSTROUTING -s "$ip" -d "$ip" -j SNAT --to-source "$vip" || {
			echo_date "添加 ${ip} SNAT 规则失败！"
			return 1
		}
		count=$((count + 1))
	done

	iptables -t nat -I PREROUTING -j "$CHAIN" || {
		echo_date "添加 PREROUTING 入口规则失败！"
		return 1
	}
	echo_date "SideStoreVPN 已启动，已配置 ${count} 个设备。"
}

restart_sidestorevpn() {
	if [ "$(get ${module}_enable)" = "1" ]; then
		start_sidestorevpn
	else
		close_sidestorevpn
		echo_date "SideStoreVPN 未启用。"
	fi
}

check_status() {
	local count
	count="$(chain_rule_count)"
	if [ "$count" -gt 0 ] 2>/dev/null; then
		http_response "运行中"
	elif [ "$(get ${module}_enable)" = "1" ]; then
		http_response "未运行"
	else
		http_response "未启用"
	fi
}

case "$1" in
start)
	if [ "$(get ${module}_enable)" = "1" ]; then
		logger "[软件中心-开机自启]: SideStoreVPN 开始自动启动！"
		sleep 10
		start_sidestorevpn
	else
		logger "[软件中心-开机自启]: SideStoreVPN 未开启，不自动启动！"
	fi
	;;
boot_up)
	if [ "$(get ${module}_enable)" = "1" ]; then
		mkdir -p /tmp/upload
		start_sidestorevpn | tee -a "${LOG_FILE}"
	fi
	;;
start_nat)
	if [ "$(get ${module}_enable)" = "1" ]; then
		logger "[软件中心-NAT重启]: 恢复 SideStoreVPN 防火墙规则！"
		sleep 5
		start_sidestorevpn >/dev/null 2>&1
	fi
	;;
stop)
	close_sidestorevpn
	;;
restart)
	restart_sidestorevpn
	;;
status)
	count="$(chain_rule_count)"
	if [ "$count" -gt 0 ] 2>/dev/null; then
		echo "运行中"
	elif [ "$(get ${module}_enable)" = "1" ]; then
		echo "未运行"
	else
		echo "未启用"
	fi
	;;
esac

case "$2" in
web_submit)
	set_lock "$1"
	mkdir -p /tmp/upload
	true >"${LOG_FILE}"
	http_response "$1"
	if [ "$(get ${module}_enable)" = "1" ] || [ "$(get ${module}_enable)" = "2" ]; then
		dbus_set ${module}_enable "1"
		echo_date "开启 SideStoreVPN！" | tee -a "${LOG_FILE}"
		start_sidestorevpn | tee -a "${LOG_FILE}"
	else
		dbus_set ${module}_enable "0"
		echo_date "停止 SideStoreVPN！" | tee -a "${LOG_FILE}"
		close_sidestorevpn | tee -a "${LOG_FILE}"
	fi
	echo XU6J03M16 | tee -a "${LOG_FILE}"
	unset_lock
	;;
status)
	check_status
	;;
esac
