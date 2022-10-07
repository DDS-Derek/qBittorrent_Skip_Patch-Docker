apt-get update -y && \
apt-get install wget -y && \
mkdir /build && \
cd /build && \
wget https://raw.githubusercontent.com/ChisBread/qbittorrent_skip_patch/main/qbittorrent-nox-static.sh && \
bash /build/qbittorrent-nox-static.sh all -i && \
qbitorrent_github_tag=release-4.3.9 \
libtorrent_github_tag=LPE_v0.4 \
bash qbittorrent-nox-static.sh qbittorrent