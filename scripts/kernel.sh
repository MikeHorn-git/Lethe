#!/usr/bin/env bash

# Download Kernel
KERNEL_VERSION="6.16.5"
wget --no-verbose https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${KERNEL_VERSION}.tar.xz
tar -xf linux-${KERNEL_VERSION}.tar.xz
cd linux-${KERNEL_VERSION} || exit

# Configure & Install Kernel
make defconfig
make -j"$(nproc)"
sudo make modules_install
sudo make install
