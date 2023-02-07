FROM fedora:36

RUN dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN dnf -y install mopidy mopidy-spotify python3-devel && \
    pip install Mopidy-Jellyfin && \
    pip install Mopidy-SomaFM && \
    pip install Mopidy-YouTube	&& \
    pip install Mopidy-MPD && \
    pip install Mopidy-Iris && \
    dnf -y install https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/14/Fedora/x86_64/os/Packages/libshout-2.2.2-5.fc12.x86_64.rpm


ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
