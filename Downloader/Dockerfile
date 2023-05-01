FROM alpine:3.17

############### Version ###############
ARG Qbittorrent
ARG Libtorrent
#######################################

RUN apk add bash wget

WORKDIR /qb

COPY . .

RUN bash qb_downloader.sh