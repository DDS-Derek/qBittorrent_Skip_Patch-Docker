# qBittorrent_Skip_Patch

qBittorrent快速校验版本

根据 https://github.com/ChisBread/qbittorrent_skip_patch 大佬的 qbittorrent_skip_patch 源码制作

qbittorrent-nox 文件由 https://github.com/Ghost-chu/qbittorrent-nox-static 大佬编译

## 特性

1. 更加快速(但相对而言不安全)的hash校验
2. 快速校验失败后自动暂停，下次开始种子时进行完整校验

## CPU 架构支持

| Architecture | Tag            |
| :----------: | :------------: |
| x86-64       | latest   |
| arm64        | latest |
| arm32        | latest |

## 镜像Tag解释

### 最新标签
- ```latest_nevinee``` 最新根据 [```nevinee/qbittorrent```](https://hub.docker.com/r/nevinee/qbittorrent) 制作的qBittorrent快速校验版本镜像

- ```latest_nevinee-iyuu``` 最新根据 [```nevinee/qbittorrent```](https://hub.docker.com/r/nevinee/qbittorrent) 制作的qBittorrent快速校验版本镜像 内置IYUU

- ```latest``` 最新镜像（作者自用，建议选择Tag带```nevinee```后缀的镜像）

### 指定版本标签
- ```4_3_x_RC_1_2-2022-11-14_nevinee``` 根据 [```nevinee/qbittorrent```](https://hub.docker.com/r/nevinee/qbittorrent) 制作的qBittorrent快速校验版本镜像

```4_3_x``` Qbittorrent 版本 | ```RC_1_2``` Libtorrent 版本 | 2022-11-14 更新日期

- ```4_3_x_RC_1_2-2022-11-14_nevinee-iyuu``` 根据 [```nevinee/qbittorrent```](https://hub.docker.com/r/nevinee/qbittorrent) 制作的qBittorrent快速校验版本镜像 内置IYUU

```4_3_x``` Qbittorrent 版本 | ```RC_1_2``` Libtorrent 版本 | 2022-11-14 更新日期

- ```4_3_x_RC_1_2-2022-11-14``` （作者自用，建议选择Tag带```nevinee```后缀的镜像） 

```4_3_x```  Qbittorrent 版本 | ```RC_1_2``` Libtorrent 版本 | 2022-11-14 更新日期

## 部署

**latest_nevinee**
```
version: "2.0"
services:
  qbittorrent:
    image: ddsderek/qbittorrent_skip_patch:latest_nevinee
    container_name: qbittorrent
    restart: always
    tty: true
    network_mode: bridge
    hostname: qbitorrent
    volumes:
      - ./data:/data      # 配置保存目录
    tmpfs:
      - /tmp
    environment:          # 下面未列出的其他环境变量请根据环境变量清单自行添加
      - WEBUI_PORT=8080   # WEBUI控制端口，可自定义
      - BT_PORT=34567     # BT监听端口，可自定义
      - PUID=1000         # 输入id -u可查询，群晖必须改
      - PGID=100          # 输入id -g可查询，群晖必须改
    ports:
      - 8080:8080        # 冒号左右一致，必须同WEBUI_PORT一样，本文件中的3个8080要改一起改
      - 34567:34567      # 冒号左右一致，必须同BT_PORT一样，本文件中的5个34567要改一起改
      - 34567:34567/udp  # 冒号左右一致，必须同BT_PORT一样，本文件中的5个34567要改一起改
      #- 8787:8787       # 如使用的是nevinee/qbittorrent:iyuu标签，请解除本行注释
    #security_opt:       # armv7设备请解除本行和下一行的注释
      #- seccomp=unconfined
```

**latest_nevinee-iyuu**
```
version: "2.0"
services:
  qbittorrent:
    image: ddsderek/qbittorrent_skip_patch:latest_nevinee-iyuu
    container_name: qbittorrent
    restart: always
    tty: true
    network_mode: bridge
    hostname: qbitorrent
    volumes:
      - ./data:/data      # 配置保存目录
    tmpfs:
      - /tmp
    environment:          # 下面未列出的其他环境变量请根据环境变量清单自行添加
      - WEBUI_PORT=8080   # WEBUI控制端口，可自定义
      - BT_PORT=34567     # BT监听端口，可自定义
      - PUID=1000         # 输入id -u可查询，群晖必须改
      - PGID=100          # 输入id -g可查询，群晖必须改
    ports:
      - 8080:8080        # 冒号左右一致，必须同WEBUI_PORT一样，本文件中的3个8080要改一起改
      - 34567:34567      # 冒号左右一致，必须同BT_PORT一样，本文件中的5个34567要改一起改
      - 34567:34567/udp  # 冒号左右一致，必须同BT_PORT一样，本文件中的5个34567要改一起改
      #- 8787:8787       # 如使用的是nevinee/qbittorrent:iyuu标签，请解除本行注释
    #security_opt:       # armv7设备请解除本行和下一行的注释
      #- seccomp=unconfined
```

**latest**
```
version: "2"
services:
  qbittorrentee:
    image: ddsderek/qbittorrent_skip_patch:latest
    container_name: qbittorrentee
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Shanghai
      - UMASK_SET=022
      - TL=https://githubraw.sleele.workers.dev/XIU2/TrackersListCollection/master/best.txt
      - UT=true
      - QB_EE_BIN=false
    volumes:
      - /path/to/appdata/config:/config
      - /path/to/downloads:/downloads
    ports:
      - 6881:6881
      - 6881:6881/udp
      - 8080:8080
    restart: unless-stopped
```