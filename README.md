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
  - [Lkm](https://github.com/MikeHorn-git/Lethe#lkm)
  - [Bpf](https://github.com/MikeHorn-git/Lethe#bpf)

## Requirements

- Provider
- Vagrant

## Providers

- Libvirt
- Virtualbox

## Plugins

- [vagrant-libvirt](https://github.com/vagrant-libvirt/vagrant-libvirt) (Optionnal)
- vagrant-reload

## Images

- Alpine
- Arch
- Debian
- Fedora
- Ubuntu

## Installation

```bash
git clone https://github.com/MikeHorn-git/Lethe.git
cd Lethe
make help
```

## Makefile

```Makefile
Usage: make <target>
Targets:
  help       Display this help message
  alpine     Deploy alpine
  arch       Deploy arch
  debian     Deploy debian
  fedora     Deploy fedora
  ubuntu     Deploy ubuntu
  clean      Destroy VMs
```

## Tree

### **Src**

> [!Note]
> In-tree kernel samples.

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

### **Bpf**

> [!Note]
> Libbpf and BPF CO-RE eBPF samples.

- **kprobe**
