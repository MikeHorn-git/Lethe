#!/usr/bin/env bash

echo 'bind -x ""\C-l":clear"' >>~/.bashrc
echo "TERM=xterm-256color" >>~/.bashrc
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
