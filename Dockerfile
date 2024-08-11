FROM ubuntu:22.04

WORKDIR /opt/FutuOpenD

VOLUME ["/futuData"] 

RUN apt-get update \
    && apt-get install -y wget procps telnet jq gzip
RUN wget https://softwaredownload.futunn.com/Futu_OpenD_8.5.4518_Ubuntu16.04.tar.gz -O FutuOpenD.tar.gz
RUN tar --strip-components 2 --exclude '*.AppImage' -xvf FutuOpenD.tar.gz 
RUN rm FutuOpenD.tar.gz

ENTRYPOINT [ "/opt/FutuOpenD/FutuOpenD" ,"-cfg_file" ,"/futuData/config/futuOpenDConfig.xml"]

EXPOSE 11111
