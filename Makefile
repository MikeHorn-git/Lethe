VM_DIR   := vagrant
VMs      := $(notdir $(wildcard $(VM_DIR)/*))

.DEFAULT_GOAL := help
.DELETE_ON_ERROR:
.ONESHELL:
.SILENT:
.SUFFIXES:

help:
	echo "Usage: make <target>"
	echo "Targets:"
	printf "  %-10s %s\n" "help"   "Display this help message"
	$(foreach vm,$(VMs), printf "  %-10s %s\n" "$(vm)" "Deploy $(vm)";)
	printf "  %-10s %s\n" "clean"  "Destroy all VMs"

$(VMs):
	cd $(VM_DIR)/$@
	vagrant up

clean:
	for vm in $(VMs); do \
		status=$$(cd $(VM_DIR)/$$vm && vagrant status --machine-readable 2>/dev/null | grep ',state,' | cut -d',' -f4); \
		case "$$status" in \
			running|poweroff|saved) \
				echo "$$vm: $$status"; \
				(cd $(VM_DIR)/$$vm && vagrant destroy -f); \
				;; \
			*) \
				echo "$$vm: $$status"; \
				;; \
		esac; \
	done

.PHONY: help $(VMs) clean all test
