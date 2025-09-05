FILES   := '*.c' '*.h'
IMAGE    = alpine
VM_DIR   = vagrant
VM_NAME := Kernel

.DEFAULT_GOAL := help
.ONESHELL:

help:
	@echo "Usage: make <target> IMAGE=<image>"
	@echo "Targets:"
	@echo "  help         Display this help message"
	@echo "  base         Deploy base VM for specified image. Default is Alpine"
	@echo "  build        Deploy VM and build kernel with defconfig for specified image"
	@echo "  custom       Deploy VM with misc tools for specified image"
	@echo "  all          Execute base, build, and custom for specified image"
	@echo "Example:"
	@echo "  make build IMAGE=alpine"

base:
	@cd $(VM_DIR)/$(IMAGE)
	@vagrant up
	@vagrant halt

build:
	@cd $(VM_DIR)/$(IMAGE)
	@export VAGRANT_KERNEL=true && vagrant up --provision
	@vagrant halt

custom:
	@cd $(VM_DIR)/$(IMAGE)
	@export VAGRANT_CUSTOM=true && vagrant up --provision
	@vagrant halt

all: base build custom

.PHONY: help base build custom all clean test
