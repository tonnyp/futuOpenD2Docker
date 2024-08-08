FROM ubuntu:22.04

ENV OPEND_VERSION 8.5.4518
WORKDIR /opt/FutuOpenD


RUN apt-get update \
    && apt-get install -y wget procps telnet jq
# https://softwaredownload.futunn.com/Futu_OpenD_8.5.4518_Ubuntu16.04.tar.gz
RUN wget https://softwaredownload.futunn.com/Futu_OpenD_${VERSION}_Ubuntu16.04.tar.gz -O FutuOpenD.tar.gz
RUN tar --strip-components 2 --exclude '*.AppImage' -xvf FutuOpenD.tar.gz 
RUN rm FutuOpenD.tar.gz
RUN ls /opt/FutuOpenD/FutuOpenD

ENTRYPOINT [ "ls", "/opt/FutuOpenD/FutuOpenD" ]

# EXPOSE 11111
