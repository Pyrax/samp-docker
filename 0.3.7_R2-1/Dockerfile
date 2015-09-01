FROM debian:wheezy

MAINTAINER Pyrax <piranhadev@gmail.com>

RUN dpkg --add-architecture i386

RUN apt-get update && apt-get install -y \
 lib32stdc++6 \
 wget

ENV SAMP_VERSION samp037svr_R2-1

RUN wget http://files.sa-mp.com/$SAMP_VERSION.tar.gz \
 && tar xzf $SAMP_VERSION.tar.gz \
 && mv /samp03 /samp-srv

WORKDIR /samp-srv

EXPOSE 7777/udp

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]