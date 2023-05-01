FROM alpine:3.16

############### Version ###############
ARG Qbittorrent
ARG Libtorrent
#######################################

RUN apk add bash wget

WORKDIR /qb

COPY . .

RUN bash qb_downloader.sh