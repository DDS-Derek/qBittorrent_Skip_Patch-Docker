FROM ddsderek/qbittorrent_skip_patch:build_base AS build

##################################
ENV qbitorrent_tag=4.4.5
ENV libtorrent_tag=LPE_v0.4
##################################

WORKDIR /build

RUN qbitorrent_github_tag=release-${qbitorrent_tag} \
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

RUN apk add --no-cache python3 && \
    rm -rf /var/cache/apk/*

COPY --chmod=755 root /
COPY --from=build --chmod=a+x /build/qbt-build/completed/qbittorrent-nox   /usr/local/bin/qbittorrent-nox

VOLUME /config

EXPOSE 8080
