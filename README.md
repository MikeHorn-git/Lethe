# Lethe

![image](https://www.poetryintranslation.com/pics/Italian/interior_dante_divinecomedy_pur_31_100.jpg)

## Table of content

- [Requirements](https://github.com/MikeHorn-git/Lethe#requirements)
- [Providers](https://github.com/MikeHorn-git/Lethe#providers)
- [Plugins](https://github.com/MikeHorn-git/Lethe#plugins)
- [Images](https://github.com/MikeHorn-git/Lethe#images)
- [Installation](https://github.com/MikeHorn-git/Lethe#installation)
- [Makefile](https://github.com/MikeHorn-git/Lethe#makefile)
- [Tree](https://github.com/MikeHorn-git/Lethe#tree)
  - [Src](https://github.com/MikeHorn-git/Lethe#src)
  - [Modules](https://github.com/MikeHorn-git/Lethe#modules)

## Requirements

- One Provider
- Vagrant

## Providers

- Libvirt
- Virtualbox

## Plugins

- vagrant-libvirt
- vagrant-reload

## Images

- Alpine
- Arch
- Debian
- Gentoo
- Ubuntu

## Installation

```bash
git clone https://github.com/MikeHorn-git/Lethe.git
cd Lethe
make help
```

## Makefile

```Makefile
Usage: make <target> IMAGE=<image>
Targets:
  help         Display this help message
  base         Deploy base VM for specified image. Default is Alpine
  build        Deploy VM and build kernel with defconfig for specified image
  custom       Deploy VM with misc tools for specified image
  all          Execute base, build, and custom for specified image
Example:
  make build IMAGE=alpine
```

## Tree

### **Src**

> [!Note]
> In-tree kernel code.

- **hello syscall**
- **jiffy syscall**
- **Userland test**

### **Modules**

> [!Important]
> These out-of-tree samples are for educational and research purposes only.

- **file_hide**
- **hello**
- **lkm_hide**
- **persistence**
- **pid_hide**
- **port_hide**
- **revshell**
