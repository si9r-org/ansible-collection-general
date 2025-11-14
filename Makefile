SHELL := /bin/bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c

.PHONY: mlc-custom mlc-test mlc-clean mlc-destroy

help:
	@echo "Available targets:"
	@echo "  mlc-help        - List available molecule targets"

# //////////////////////
# Molecule targets
# //////////////////////

# Role configuration
ROLE_NAME := sops_role
MOLECULE_SCENARIO := sops_role

# Help target
mlc-help:
	@echo "Available targets:"
	@echo "  mlc-custom        - Create, converge, and cleanup environment"
	@echo "  mlc-create        - Create molecule environment"
	@echo "  mlc-converge      - Run converge phase"
	@echo "  mlc-cleanup       - Run cleanup phase"
	@echo "  mlc-test          - Run full molecule test suite"
	@echo "  mlc-lint          - Lint molecule configuration"
	@echo "  mlc-verify        - Run verification tests"
	@echo "  mlc-destroy       - Destroy molecule environment"
	@echo "  mlc-clean         - Remove temporary files"
	@echo "  mlc-help          - Show this help message"

# Main target to create, test, and cleanup the role environment
mlc-custom: mlc-create mlc-converge mlc-cleanup

# Individual molecule commands as separate targets
mlc-create:
	@echo "Creating molecule environment for $(ROLE_NAME)..."
	molecule create -s $(MOLECULE_SCENARIO)

mlc-converge:
	@echo "Converging molecule scenario for $(ROLE_NAME)..."
	molecule converge -s $(MOLECULE_SCENARIO)

mlc-cleanup:
	@echo "Cleaning up molecule environment for $(ROLE_NAME)..."
	molecule cleanup -s $(MOLECULE_SCENARIO)

# Additional useful molecule targets
mlc-test:
	@echo "Running full molecule test suite for $(ROLE_NAME)..."
	molecule test -s $(MOLECULE_SCENARIO)

mlc-lint:
	@echo "Linting molecule configuration for $(ROLE_NAME)..."
	molecule lint -s $(MOLECULE_SCENARIO)

mlc-verify:
	@echo "Running molecule verification for $(ROLE_NAME)..."
	molecule verify -s $(MOLECULE_SCENARIO)

mlc-destroy:
	@echo "Destroying molecule environment for $(ROLE_NAME)..."
	molecule destroy -s $(MOLECULE_SCENARIO)

# Clean target to remove any temporary files
mlc-clean:
	@echo "Cleaning up temporary files..."
	rm -rf .molecule .cache
