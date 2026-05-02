#!/usr/bin/env bash

git clone https://github.com/libbpf/libbpf-bootstrap
cd libbpf-bootstrap/ || exit
git submodule update --init --recursive
