FROM debian:wheezy

MAINTAINER Pyrax <piranhadev@gmail.com>

RUN dpkg --add-architecture i386

RUN apt-get update && apt-get install -y \
 lib32stdc++6 \
 wget

RUN wget http://files.sa-mp.com/samp037svr_R2-1.tar.gz \
 && tar xzf samp037svr_R2-1.tar.gz \
 && mv /samp03 /samp-srv

WORKDIR /samp-srv

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 7777/udp
