#!/usr/bin/env bash

sudo dnf remove virtualBox-guest-additions
sudo dnf update -y
sudo dnf install @development-tools -y
sudo dnf install @c-development -y

sudo dnf install bc rsyslog -y
sudo systemctl enable --now rsyslog
