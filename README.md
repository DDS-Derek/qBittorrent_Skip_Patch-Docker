# qBittorrent_Skip_Patch

qBittorrent快速校验版本

根据 https://github.com/ChisBread/qbittorrent_skip_patch 大佬的 qbittorrent_skip_patch 源码制作

目前提供 qBittorrent 4.3.9 | 4.4.0 | 4.4.5 版本镜像

## 特性
1. 更加快速(但相对而言不安全)的hash校验
2. 快速校验失败后自动暂停，下次开始种子时进行完整校验

## 安装
```
version: "2"
services:
  qbittorrent:
    image: ddsderek/qbittorrent_skip_patch
    container_name: qbittorrent_skip_patch
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Shanghai
      - UMASK_SET=022
      - TL=https://githubraw.sleele.workers.dev/XIU2/TrackersListCollection/master/best.txt
      - UT=true
    volumes:
      - /path/to/appdata/config:/config
      - /path/to/downloads:/downloads
    ports:
      - 6881:6881
      - 6881:6881/udp
      - 8080:8080
    restart: unless-stopped
```
