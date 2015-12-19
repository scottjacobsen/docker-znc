#!/bin/sh
[ -f /home/znc/.znc/znc.pem ] || /sbin/setuser znc /usr/bin/znc -p
exec /sbin/setuser znc /usr/bin/znc -f
