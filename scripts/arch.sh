#!/usr/bin/env bash

sudo pacman -Sy archlinux-keyring --noconfirm
sudo pacman -Syyu --noconfirm
sudo pacman -Syyu base-devel bc bison elfutils flex git htop libressl linux-headers perl strace wget xz --needed --noconfirm

sudo -u vagrant git clone https://aur.archlinux.org/yay-bin.git /home/vagrant/yay-bin
cd /home/vagrant/yay-bin || exit
sudo -u vagrant makepkg -si --noconfirm
rm -rf /home/vagrant/yay-bin

yay -Syyu syslog-ng --noconfirm
