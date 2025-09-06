#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

sudo apt update
sudo apt upgrade -y
sudo apt install bc build-essential bison curl elfutils flex git htop libelf-dev libssl-dev perl strace wget -y
