#!/usr/bin/env bash

# Upgrade Alpine from 3.18 to 3.22
sudo sed -i -e 's/v3.18/v3.22/g' /etc/apk/repositories

sudo apk upgrade -U -a --ignore linux-headers linux-virt
sudo apk add bison build-base clang20 elfutils-dev flex git htop libressl-dev linux-headers llvm perl rsyslog strace wget xz

sudo service rsyslog start
sudo rc-update add rsyslog default
