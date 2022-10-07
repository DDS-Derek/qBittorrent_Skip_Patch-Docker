FROM ubuntu:20.04 AS build

ENV qbitorrent_tag=4.3.9
ENV libtorrent_tag=LPE_v0.4

RUN apt-get update -y && \
    apt-get install wget bash -y && \
    mkdir /build && \
    cd /build && \
    wget https://raw.githubusercontent.com/ChisBread/qbittorrent_skip_patch/main/qbittorrent-nox-static.sh && \
    bash /build/qbittorrent-nox-static.sh all -i && \
    qbitorrent_github_tag=release-${qbitorrent_tag} \
    libtorrent_github_tag=${libtorrent_tag} \
    bash qbittorrent-nox-static.sh qbittorrent

FROM lsiobase/alpine:3.12

ENV TZ=Asia/Shanghai \
	WEBUIPORT=8080 \
	PUID=1000 \
	PGID=1000 \
	UMASK_SET=022 \
    TL=https://githubraw.sleele.workers.dev/XIU2/TrackersListCollection/master/best.txt \
    UT=true

COPY root /
COPY --from=build --chmod=777 /build/qbt-build/bin/qbittorrent-nox   /usr/local/bin/qbittorrent-nox

RUN  apk add --no-cache python3 \
&&   rm -rf /var/cache/apk/*   \
&&   chmod a+x  /usr/local/bin/qbittorrent-nox  

VOLUME /config

EXPOSE 8080