FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y gnupg2 wget && \
    wget -qO- https://archive.neon.kde.org/public.key | apt-key add - && \
    echo 'deb http://archive.neon.kde.org/unstable/ focal main' > /etc/apt/sources.list.d/neon.list && \
    echo 'deb-src http://archive.neon.kde.org/unstable/ focal main' >> /etc/apt/sources.list.d/neon.list && \
    echo keyboard-configuration keyboard-configuration/layout select 'English (US)' | debconf-set-selections && \
    echo keyboard-configuration keyboard-configuration/layoutcode select 'us' | debconf-set-selections && \
    echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections && \
    apt-get update && \
    apt-get full-upgrade -y && \
    apt-get install -y cmake build-essential devscripts vim xbuilder && \
    mkdir -p usr/share/locale && \
    touch usr/share/locale/stub
    
ENTRYPOINT ["bash"]
