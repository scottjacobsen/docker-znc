FROM phusion/baseimage:0.9.18
MAINTAINER Scott Jacobsen <jacobsenscott@yahoo.com>
ENV SYSTEM_UPDATE=3
RUN curl --silent https://code.bitlbee.org/debian/release.key | apt-key add - && \
echo "deb http://code.bitlbee.org/debian/master/trusty/amd64/ ./" >> /etc/apt/sources.list.d/bitlbee.list && \
apt-get update && \
apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
apt-get install -y \
bitlbee \
bitlbee-plugin-otr \
znc && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
adduser --disabled-login --gecos "" znc && \
mkdir -p /home/znc/.znc && \
mkdir -p /etc/service/bitlbee && \
mkdir -p /etc/service/znc
COPY bitlbee.sh /etc/service/bitlbee/run
COPY znc.sh /etc/service/znc/run
COPY znc-conf /home/znc/.znc/
RUN chmod -R go-rwx /home/znc/.znc && chown -R znc:znc /home/znc
