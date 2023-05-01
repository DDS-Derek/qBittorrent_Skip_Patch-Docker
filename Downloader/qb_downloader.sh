#!/bin/bash

mkdir -p /qb/${Qbittorrent}_${Libtorrent}

architectures=("aarch64" "armhf" "armv7" "x86_64")
versions=("qbittorrent-nox" "qt5-qbittorrent-nox")

for arch in "${architectures[@]}"; do
    for ver in "${versions[@]}"; do
        wget -P /qb/${Qbittorrent}_${Libtorrent} "https://github.com/Ghost-chu/qbittorrent-nox-static/releases/download/manual-${Qbittorrent}_${Libtorrent}-fasthash/${arch}-${ver}"
    done
done