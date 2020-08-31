prefix         ?= 
curr_dir       ?= $(shell pwd)
kernel_release ?= $(shell uname -r)
arch           ?= $(shell uname -m | sed -e s/arm.*/arm/ -e s/aarch64.*/arm64/)
lib_dir        ?= $(prefix)/lib/modules/$(kernel_release)/kernel/drivers/fpga
kernel_src_dir ?= /lib/modules/$(kernel_release)/build

kmod_objects   += drivers/fpga/zynq-afi.ko

.PHONY: all install

all:
	cd ./drivers/fpga ; $(MAKE) ARCH=$(arch) KERNEL_SRC_DIR=$(kernel_src_dir) all   ; cd $(curr_dir)

clean:
	cd ./drivers/fpga ; $(MAKE) ARCH=$(arch) KERNEL_SRC_DIR=$(kernel_src_dir) clean ; cd $(curr_dir)

install: all
	install -d $(lib_dir)
	for ko in $(kmod_objects); do install -m 0644 $$ko $(lib_dir) ; done

