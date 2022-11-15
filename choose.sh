#!/bin/sh

ARCH=$(uname -m)

echo -e "${INFO} Check CPU architecture ..."

if [[ ${ARCH} == "x86_64" ]]; then
    export ARCH="x86_64"
elif [[ ${ARCH} == "aarch64" ]]; then
    export ARCH="aarch64"
elif [[ ${ARCH} == "armv7l" ]]; then
    export ARCH="armv7"
else
    echo -e "${ERROR} This architecture is not supported."
    exit 1
fi

cp /qb/${Qbittorrent}_${Libtorrent}/${ARCH}-qt5-qbittorrent-nox /qbittorrent-nox