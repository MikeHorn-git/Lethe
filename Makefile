VM_DIR   := vagrant
VMs      := alpine arch debian fedora ubuntu

.DEFAULT_GOAL := help
.ONESHELL:

help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@printf "  %-10s %s\n" "help"   "Display this help message"
	@$(foreach vm,$(VMs), printf "  %-10s %s\n" "$(vm)" "Deploy $(vm)";)
	@printf "  %-10s %s\n" "clean"  "Destroy all VMs"

$(VMs):
	@cd $(VM_DIR)/$@
	@vagrant up

clean:
	@for vm in $(VMs); do \
		(cd $(VM_DIR)/$$vm && vagrant destroy -f); \
	done

.PHONY: help $(VMs) clean all test
