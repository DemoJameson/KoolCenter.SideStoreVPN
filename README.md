# SideStoreVPN for rogsoft

SideStoreVPN 是一个面向 koolshare/rogsoft 软件中心的离线插件。它通过 `iptables` 在路由器上模拟 StosVPN/LocalDevVPN 的地址交换逻辑，让指定的内网苹果设备无需开启 StosVPN/LocalDevVPN 即可使用 SideStore。

## 功能

- 支持从路由器已连接设备列表中选择苹果设备。
- 支持编辑设备名和 IP，建议为苹果设备绑定固定 DHCP/IP。
- 支持配置虚拟 iTunes 设备 IP，默认 `10.7.0.1`。
- 支持开机启动和 NAT/网络重载后自动恢复规则。
- 使用 `iptables` 创建 DNAT/SNAT 规则，不依赖 StosVPN 或 LocalDevVPN。

## 打包

```sh
./build.sh
```

构建完成后会在仓库根目录生成：

```text
SideStoreVPN_v1.0.0.tar.gz
```

实际版本号来自 `config.json.js` 中的 `version` 字段。

## 使用说明

1. 在 rogsoft 软件中心离线安装 `SideStoreVPN_v版本.tar.gz`。
2. 打开 SideStoreVPN 插件页面。
3. 在设备列表中选择或手动添加需要使用 SideStore 的苹果设备。
4. 如无特殊情况，不要修改虚拟 iTunes 设备 IP。
5. 点击开启，插件会写入对应的 `iptables` 规则。

如果苹果设备默认网关不是本路由，需要在上级网关添加到 iTunes 虚拟设备的静态路由。

## 参考

- MerlinLucky 仓库：[https://github.com/vj23456/MerlinLucky](https://github.com/vj23456/MerlinLucky)
- 文章《在内网中免 StosVPN 使用 SideStore》：[https://lantian.pub/article/modify-computer/sidestore-without-stosvpn-across-lan.lantian/](https://lantian.pub/article/modify-computer/sidestore-without-stosvpn-across-lan.lantian/)

## License

本项目使用 MIT License，详见 [LICENSE](LICENSE)。
