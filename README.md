# qBittorrent_Skip_Patch

qBittorrent快速校验版本

根据 https://github.com/ChisBread/qbittorrent_skip_patch 大佬的 qbittorrent_skip_patch 源码制作
qbittorrent-nox 文件由 https://github.com/Ghost-chu/qbittorrent-nox-static 大佬编译

## 镜像Tag简介

```latest_nevinee``` 最新根据 ```nevinee/qbittorrent``` 制作的qBittorrent快速校验版本镜像
```latest``` 最新镜像（作者自用，建议选择Tag为```latest_nevinee```镜像）

```4_3_x_RC_1_2-2022-11-14_nevinee``` 根据 ```nevinee/qbittorrent``` 制作的qBittorrent快速校验版本镜像 | ```4_3_x``` Qbittorrent 版本 | ```RC_1_2``` Libtorrent 版本 | 2022-11-14 更新日期
```4_3_x_RC_1_2-2022-11-14``` ```4_3_x``` Qbittorrent 版本 | ```RC_1_2``` Libtorrent 版本 | 2022-11-14 更新日期

## 特性
1. 更加快速(但相对而言不安全)的hash校验
2. 快速校验失败后自动暂停，下次开始种子时进行完整校验

