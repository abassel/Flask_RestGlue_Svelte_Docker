# https://gist.github.com/rsperl/d2dfe88a520968fbc1f49db0a29345b9

SHELL=/bin/bash

.DEFAULT_GOAL := help


# https://swcarpentry.github.io/make-novice/08-self-doc/index.html
## ❓  help												: This help
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<


## 🛠  node_dev_box_setup									: setup node environment
.PHONY: node_dev_box_setup
node_dev_box_setup: node_modules

node_modules: package.json yarn.lock
	@yarn install --production=false
	@touch node_modules


yarn.lock:
	@echo "Building"


build-docker:
	@docker build -t frontend .
