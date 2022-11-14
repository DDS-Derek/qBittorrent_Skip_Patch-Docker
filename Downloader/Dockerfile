FROM alpine:3.16

RUN apk add bash wget

WORKDIR /qb

COPY . .

RUN bash qb_downloader.sh