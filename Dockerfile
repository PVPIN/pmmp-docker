# Version 0.0.1
FROM ubuntu:16.04
MAINTAINER wolfg1969 "wolfg1969@gmail.com"
ENV REFRESHED_AT 201612231318
RUN sed -i.bak s/archive/cn.archive/g /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y install git curl wget

RUN mkdir /pmmp
RUN cd /pmmp && wget -q -O - https://get.pmmp.io | bash -s - -r -v development

VOLUME /pmmp
WORKDIR /pmmp

EXPOSE 19132

CMD ["./start.sh", "--no-wizard", "--enable-rcon=on"]
