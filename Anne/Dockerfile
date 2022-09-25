FROM hoshinorei/l4d2server:v2225
USER root
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
USER steam
RUN git clone -b nomysql https://github.com/fantasylidong/AnneZonemod.git && \
    cp -fr AnneZonemod/left4dead2 /home/steam/l4d2server/ && \
    cp -fr AnneZonemod/update /home/steam/l4d2server/ && \
    rm -rf ./AnneZonemod
CMD ["-secure", "+exec server.cfg", "+map c1m1_hotel", "-port 27015", "-tickrate 100"]