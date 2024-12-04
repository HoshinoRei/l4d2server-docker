FROM debian:12-slim
LABEL org.opencontainers.image.source=https://github.com/HoshinoRei/l4d2server-docker
LABEL L4D2_VERSION=2243
RUN apt-get update && \
    apt-get install -y wget lib32gcc-s1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    adduser --home /home/steam --disabled-password --shell /bin/bash --gecos "user for running steam" --quiet steam
USER steam
WORKDIR /home/steam
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xzf steamcmd_linux.tar.gz && \
    rm -rf steamcmd_linux.tar.gz && \
    ./steamcmd.sh +force_install_dir /home/steam/l4d2server +login anonymous +@sSteamCmdForcePlatformType windows +app_update 222860 validate +quit && \
    ./steamcmd.sh +force_install_dir /home/steam/l4d2server +login anonymous +@sSteamCmdForcePlatformType linux  +app_update 222860 validate +quit && \
    rm -rf /home/steam/l4d2server/left4dead2/host.txt \
        /home/steam/l4d2server/left4dead2/motd.txt
EXPOSE 27015 27015/udp
VOLUME /home/steam/l4d2server/left4dead2/addons \
    /home/steam/l4d2server/left4dead2/cfg/server.cfg \
    /home/steam/l4d2server/left4dead2/motd.txt \
    /home/steam/l4d2server/left4dead2/host.txt
ENTRYPOINT ["/home/steam/l4d2server/srcds_run", "-game left4dead2"]
CMD ["-secure", "+exec server.cfg", "+map c1m1_hotel", "-port 27015"]
