FROM phusion/baseimage
MAINTAINER Scott Jacobsen <jacobsenscott@yahoo.com>
RUN curl --silent https://code.bitlbee.org/debian/release.key | apt-key add - && \
echo "deb http://code.bitlbee.org/debian/master/trusty/amd64/ ./" >> /etc/apt/sources.list.d/bitlbee.list && \
apt-get update && \
apt-get install -y bitlbee bitlbee-plugin-otr unattended-upgrades znc && \
adduser --disabled-login --gecos "" znc && \
mkdir -p /home/znc/.znc && \
mkdir -p /etc/service/bitlbee && \
mkdir -p /etc/service/znc
COPY bitlbee.sh /etc/service/bitlbee/run
COPY znc.sh /etc/service/znc/run
COPY znc-conf /home/znc/.znc/
RUN chmod -R go-rwx /home/znc/.znc && chown -R znc:znc /home/znc
RUN unattended-upgrade && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
