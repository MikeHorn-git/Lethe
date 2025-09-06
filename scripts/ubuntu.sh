#!/usr/bin/env bash

sudo apt update -y
sudo apt install build-essential bison elfutils flex git htop libelf-dev libssl-dev linux-headers-"$(uname -r)" perl rsyslog strace wget -y

sudo systemctl enable --now rsyslog
