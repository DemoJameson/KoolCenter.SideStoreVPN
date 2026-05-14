#!/bin/sh

[ -f /koolshare/scripts/base.sh ] && source /koolshare/scripts/base.sh

module="sidestorevpn"

if [ "$(dbus get ${module}_enable 2>/dev/null)" = "1" ]; then
	echo_date "先关闭 SideStoreVPN 插件！"
	sh "/koolshare/scripts/${module}_config.sh" stop >/dev/null 2>&1
fi

find /koolshare/init.d/ -name "*${module}*" | xargs rm -rf 2>/dev/null
rm -rf "/koolshare/res/icon-${module}.png" 2>/dev/null
rm -rf "/koolshare/scripts/${module}_config.sh" 2>/dev/null
rm -rf "/koolshare/scripts/uninstall_${module}.sh" 2>/dev/null
rm -rf "/koolshare/webs/Module_${module}.asp" 2>/dev/null
rm -rf "/tmp/upload/${module}_log.txt" 2>/dev/null

dbus remove ${module}_version
dbus remove ${module}_enable
dbus remove ${module}_clients
dbus remove ${module}_virtual_ip
dbus remove softcenter_module_${module}_name
dbus remove softcenter_module_${module}_install
dbus remove softcenter_module_${module}_version
dbus remove softcenter_module_${module}_title
dbus remove softcenter_module_${module}_description
