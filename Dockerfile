FROM phusion/baseimage
MAINTAINER Scott Jacobsen <jacobsenscott@yahoo.com>
RUN apt-get update && apt-get install -y bitlbee znc
RUN apt-get install -y unattended-upgrades && unattended-upgrade
RUN adduser --disabled-login --gecos "" znc && \
mkdir -p /home/znc/.znc && \
mkdir -p /etc/service/bitlbee && \
mkdir -p /etc/service/znc
COPY bitlbee.sh /etc/service/bitlbee/run
COPY znc.sh /etc/service/znc/run
COPY znc-conf /home/znc/.znc/
RUN chmod -R go-rwx /home/znc/.znc && chown -R znc:znc /home/znc
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
