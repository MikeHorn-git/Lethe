#!/usr/bin/env bash

sudo apt update -y
sudo apt install build-essential bison clang elfutils flex git htop libelf-dev libssl-dev linux-headers-"$(uname -r)" llvm perl rsyslog strace wget -y

sudo systemctl enable --now rsyslog
