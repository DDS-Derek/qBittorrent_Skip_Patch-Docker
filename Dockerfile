############### Time ###############
ARG Build_Time
####################################

FROM ddsderek/qbittorrent_skip_patch:downloader-${Build_Time} AS Build

############### Version ###############
ARG Qbittorrent
ARG Libtorrent
#######################################

COPY choose.sh .

RUN bash choose.sh

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
COPY --from=Build --chmod=755 /qbittorrent-nox   /usr/local/bin/qbittorrent-nox

VOLUME /config

EXPOSE 8080
