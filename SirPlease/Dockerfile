FROM hoshinorei/l4d2server:v2225
USER root
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
USER steam
RUN git clone https://github.com/SirPlease/L4D2-Competitive-Rework.git && \
    cp -fr L4D2-Competitive-Rework/addons /home/steam/l4d2server/left4dead2/ && \
    cp -fr L4D2-Competitive-Rework/cfg /home/steam/l4d2server/left4dead2/ && \
    cp -fr L4D2-Competitive-Rework/scripts /home/steam/l4d2server/left4dead2/ && \
    rm -rf ./L4D2-Competitive-Rework
CMD ["-secure", "+exec server.cfg", "+map c1m1_hotel", "-port 27015", "-tickrate 100"]
