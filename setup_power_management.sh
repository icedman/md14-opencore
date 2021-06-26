#!/bin/sh
set -x

pmset -a hibernatemode 0
pmset -a autopoweroff 0
pmset -a powernap 0
pmset -a standby 0
pmset -a proximitywake 0
pmset -a tcpkeepalive 0

rm /var/vm/sleepimage
mkdir /var/vm/sleepimage

rm /private/var/vm/sleepimage
mkdir /private/var/vm/sleepimage

