zynq afi kernel module debian package
====================================================================================

Overview
------------------------------------------------------------------------------------

### Introduction

This is a repository for making zynq afi kernel module debian package.

### Note

This repository provides script files to create Debian Package for using the xlnx,zynq-afi kernel module provided by linux-xlnx on the linux mainline.

Build Debian Package
------------------------------------------------------------------------------------

### Download this repository

```console
shell$ git clone --recursive --depth=1 -b v0.0.1 git://github.com/ikwzm/zynq-afi-kmod-dpkg
shell$ cd zynq-afi-kmod-dpkg
```

### Cross Compile

#### Parameters

| Parameter Name | Description              | Default Value                                                    |
|----------------|--------------------------|------------------------------------------------------------------|
| kernel_release | Kernel Release Name      | $(shell uname -r)                                                |
| arch           | Architecture Name        | $(shell uname -m \| sed -e s/arm.\*/arm/ -e s/aarch64.\*/arm64/) |
| deb_arch       | Debian Architecture Name | $(shell dpkg --print-architecture)                               |
| kernel_src_dir | Kernel Source Directory  | /lib/modules/$(kernel_release)/build                             |


```console
shell$ sudo debian/rules arch=arm deb_arch=armhf kernel_release=5.4.59-armv7-fpga kernel_src_dir=/usr/src/linux-5.4.59-armv7-fpga binary
    :
    :
    :
shell$ file ../zynq-afi-5.4.59-armv7-fpga_0.0.1-0_armhf.deb
../zynq-afi-5.4.59-armv7-fpga_0.0.1-0_armhf.deb: Debian binary package (format 2.0)
```

### Self Compile

```console
shell$ sudo debian/rules binary
    :
    :
    :
shell$ file ../zynq-afi-5.4.59-armv7-fpga_0.0.1-0_armhf.deb
../zynq-afi-5.4.59-armv7-fpga_0.0.1-0_armhf.deb: Debian binary package (format 2.0)
```

