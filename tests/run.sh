#!/bin/sh
set -eu

ROOT="$(cd "$(dirname "$0")/.." >/dev/null 2>&1 && pwd)"
SCRIPT="${ROOT}/sidestorevpn/scripts/sidestorevpn_config.sh"
TMP="${TMPDIR:-/tmp}/sidestorevpn-test.$$"
BIN="${TMP}/bin"
DB="${TMP}/db"
LOG="${TMP}/iptables.log"

cleanup() {
	rm -rf "$TMP"
}
trap cleanup EXIT

mkdir -p "$BIN" "$DB"

cat >"${BIN}/dbus" <<'EOF'
#!/bin/sh
DBDIR="${SIDESTORE_TEST_DB}"
cmd="$1"
key="${2%%=*}"
val="${2#*=}"
case "$cmd" in
	get)
		[ -f "${DBDIR}/${2}" ] && cat "${DBDIR}/${2}"
		;;
	set)
		mkdir -p "$DBDIR"
		printf '%s' "$val" >"${DBDIR}/${key}"
		;;
	remove)
		prefix="$2"
		find "$DBDIR" -type f -name "${prefix}*" -delete 2>/dev/null || true
		;;
esac
EOF

cat >"${BIN}/iptables" <<'EOF'
#!/bin/sh
printf '%s\n' "$*" >>"${SIDESTORE_TEST_LOG}"
if [ "$1" = "-S" ] || { [ "$1" = "-t" ] && [ "$3" = "-S" ]; }; then
	exit 1
fi
if [ "$1" = "-D" ] || { [ "$1" = "-t" ] && [ "$3" = "-D" ]; }; then
	exit 1
fi
exit 0
EOF

cat >"${BIN}/nvram" <<'EOF'
#!/bin/sh
exit 0
EOF

cat >"${BIN}/ifconfig" <<'EOF'
#!/bin/sh
exit 0
EOF

cat >"${BIN}/flock" <<'EOF'
#!/bin/sh
exit 0
EOF

chmod 755 "${BIN}/dbus" "${BIN}/iptables" "${BIN}/nvram" "${BIN}/ifconfig" "${BIN}/flock"

PATH="${BIN}:$PATH"
export PATH SIDESTORE_TEST_DB="$DB" SIDESTORE_TEST_LOG="$LOG" DBUS="${BIN}/dbus" KS_DIR="$TMP" LOCK_FILE="${TMP}/sidestorevpn.lock"

printf '1\n' >"${DB}/sidestorevpn_enable"
printf '10.7.0.1\n' >"${DB}/sidestorevpn_virtual_ip"
printf '192.168.50.23 James-iPhone\n192.168.50.88\n# comment\n999.1.1.1 bad\n192.168.50.23 duplicate\n' >"${DB}/sidestorevpn_clients"
sh -n "${ROOT}/sidestorevpn/install.sh"
sh -n "${ROOT}/sidestorevpn/uninstall.sh"
sh -n "$SCRIPT"

: >"$LOG"
sh "$SCRIPT" start >/dev/null
grep -q -- '-t nat -N SIDESTORE_CHAIN' "$LOG"
grep -q -- '-t nat -A SIDESTORE_CHAIN -s 192.168.50.23 -d 10.7.0.1 -j DNAT --to-destination 192.168.50.23' "$LOG"
grep -q -- '-t nat -A POSTROUTING -s 192.168.50.88 -d 192.168.50.88 -j SNAT --to-source 10.7.0.1' "$LOG"
grep -q -- '-t nat -I PREROUTING -j SIDESTORE_CHAIN' "$LOG"
if grep -q '999.1.1.1' "$LOG"; then
	echo "invalid IP was not filtered" >&2
	exit 1
fi

: >"$LOG"
sh "$SCRIPT" boot_up >/dev/null
grep -q -- '-t nat -I PREROUTING -j SIDESTORE_CHAIN' "$LOG"

printf '1\n' >"${DB}/sidestorevpn_enable"
: >"$LOG"
sh "$SCRIPT" 123456 web_submit >/dev/null
grep -q -- '-t nat -I PREROUTING -j SIDESTORE_CHAIN' "$LOG"
grep -q '^1$' "${DB}/sidestorevpn_enable"

printf '0\n' >"${DB}/sidestorevpn_enable"
: >"$LOG"
sh "$SCRIPT" 123456 web_submit >/dev/null
if grep -q -- '-t nat -I PREROUTING -j SIDESTORE_CHAIN' "$LOG"; then
	echo "disabled web_submit should not start rules" >&2
	exit 1
fi

printf 'All tests passed.\n'
