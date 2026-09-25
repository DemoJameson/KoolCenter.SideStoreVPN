#!/bin/sh

[ -f /koolshare/scripts/base.sh ] && source /koolshare/scripts/base.sh
alias echo_date='echo 【$(TZ=UTC-8 date -R +%Y年%m月%d日\ %X)】:'

TITLE="SideStoreVPN"
DESCR="SideStore 内网免 LocalDevVPN，使用 iptables 模拟 StosVPN 地址交换逻辑"
DIR=$(cd "$(dirname "$0")"; pwd)
module=${DIR##*/}

exit_install() {
	local state=$1
	rm -rf "/tmp/${module}" "/tmp/${module}.tar.gz" >/dev/null 2>&1
	exit "${state:-0}"
}

dbus_nset() {
	local ret
	ret=$(dbus get "$1" 2>/dev/null)
	if [ -z "$ret" ]; then
		dbus set "$1=$2" >/dev/null 2>&1
	fi
}

get_model() {
	local odmpid productid
	odmpid=$(nvram get odmpid 2>/dev/null)
	productid=$(nvram get productid 2>/dev/null)
	if [ -n "${odmpid}" ]; then
		MODEL="${odmpid}"
	else
		MODEL="${productid}"
	fi
}

get_platform() {
	# 平台判定与软件中心对机型的平台划分保持一致
	case "${MODEL}" in
		TX-AX6000|TUF-AX4200Q|RT-AX57_Go|GS7|ZenWiFi_BT8P|GS7_Air|GS-BE7200X)
			echo "mtk"
			;;
		ZenWiFi_BD4)
			echo "ipq32"
			;;
		TUF_6500)
			echo "ipq64"
			;;
		RT-AX89X)
			echo "qca"
			;;
		*)
			echo "hnd"
			;;
	esac
}

platform_test() {
	local linux_ver platform
	linux_ver=$(uname -r | awk -F"." '{print $1$2}')
	if [ ! -d "/koolshare" ] || [ ! -f "/usr/bin/skipd" ] || [ "${linux_ver}" -lt "41" ]; then
		echo_date "未检测到软件中心环境，退出安装！"
		exit_install 1
	fi

	get_model
	platform=$(get_platform)
	# .valid 由软件中心在离线安装时校验，这里再校验一次，防止安装包被手工装到不支持的平台
	if [ -f "${DIR}/.valid" ] && ! grep -q "${platform}" "${DIR}/.valid" 2>/dev/null; then
		echo_date "机型 ${MODEL} 属于 ${platform} 平台，本安装包不支持该平台，退出安装！"
		echo_date "本插件支持平台/机型详见：https://github.com/koolshare/rogsoft"
		exit_install 1
	fi
	echo_date "机型 ${MODEL}（${platform} 平台）符合安装要求，开始安装插件！"
}

install_now() {
	local PLVER
	local sidestorevpn_enable
	PLVER=$(cat "${DIR}/version" 2>/dev/null || echo 0.1)
	sidestorevpn_enable=$(dbus get ${module}_enable 2>/dev/null)

	if [ "$sidestorevpn_enable" = "1" ] && [ -x "/koolshare/scripts/${module}_config.sh" ]; then
		echo_date "先关闭 ${TITLE} 插件，以保证更新成功！"
		sh "/koolshare/scripts/${module}_config.sh" stop >/dev/null 2>&1
	fi

	find /koolshare/init.d/ -name "*${module}*" | xargs rm -rf 2>/dev/null
	rm -rf /koolshare/scripts/${module}*.sh 2>/dev/null
	rm -rf /koolshare/webs/Module_${module}.asp 2>/dev/null
	rm -rf /koolshare/res/icon-${module}.png 2>/dev/null

	echo_date "安装插件相关文件..."
	mkdir -p /koolshare/scripts /koolshare/webs /koolshare/res /koolshare/init.d
	cp -rf "/tmp/${module}/scripts/"* /koolshare/scripts/
	cp -rf "/tmp/${module}/webs/"* /koolshare/webs/
	cp -rf "/tmp/${module}/res/"* /koolshare/res/ 2>/dev/null
	cp -rf "/tmp/${module}/uninstall.sh" "/koolshare/scripts/uninstall_${module}.sh"

	[ ! -L "/koolshare/init.d/S110${module}.sh" ] && ln -sf "/koolshare/scripts/${module}_config.sh" "/koolshare/init.d/S110${module}.sh"
	[ ! -L "/koolshare/init.d/N110${module}.sh" ] && ln -sf "/koolshare/scripts/${module}_config.sh" "/koolshare/init.d/N110${module}.sh"

	chmod +x /koolshare/scripts/${module}*.sh >/dev/null 2>&1
	chmod +x /koolshare/scripts/uninstall_${module}.sh >/dev/null 2>&1

	echo_date "设置插件默认参数..."
	dbus set ${module}_version="${PLVER}"
	dbus set softcenter_module_${module}_version="${PLVER}"
	dbus set softcenter_module_${module}_install="1"
	dbus set softcenter_module_${module}_name="${module}"
	dbus set softcenter_module_${module}_title="${TITLE}"
	dbus set softcenter_module_${module}_description="${DESCR}"

	dbus_nset ${module}_enable "0"
	dbus_nset ${module}_virtual_ip "10.7.0.1"

	if [ "$sidestorevpn_enable" = "1" ]; then
		dbus set ${module}_enable="1"
		echo_date "重新启动 ${TITLE} 插件！"
		sh "/koolshare/scripts/${module}_config.sh" boot_up >/dev/null 2>&1
	fi

	echo_date "${TITLE} 插件安装完毕！"
	exit_install 0
}

platform_test
install_now
