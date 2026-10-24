FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    kali-desktop-xfce \
    xfce4-terminal \
    dbus-x11 \
    xvfb \
    x11vnc \
    novnc \
    websockify \
    sudo \
    curl \
    wget \
    git \
    ca-certificates \
    net-tools \
    iproute2 \
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash kali \
    && echo 'kali:kali' | chpasswd \
    && usermod -aG sudo kali \
    && echo 'kali ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/kali

COPY start-gui.sh /usr/local/bin/start-cwu-kali-gui
RUN chmod +x /usr/local/bin/start-cwu-kali-gui

USER kali
WORKDIR /home/kali

EXPOSE 6080
CMD ["/usr/local/bin/start-cwu-kali-gui"]
