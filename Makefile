.PHONY: install build version

include .env
export

SHELL_NAME ?= bash
RC_FILE := $(HOME)/.$(SHELL_NAME)rc
INSTALL_LINE := . $(HOME)/.shell/scripts/all.sh
DEPLOY_SCRIPT = @echo "Undefined deploy script for this project."

include $(HOME)/.make/git.mk

install:
	@grep -qxF '$(INSTALL_LINE)' $(RC_FILE) || echo '\n$(INSTALL_LINE)' >> $(RC_FILE)

build:
	@echo "Undefined goal 'build' for this project."

version:
	@echo "Undefined goal 'version' for this project."
