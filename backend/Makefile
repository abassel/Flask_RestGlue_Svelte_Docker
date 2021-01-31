# https://gist.github.com/rsperl/d2dfe88a520968fbc1f49db0a29345b9

SHELL=/bin/bash

VENV_NAME?=.venv3

.DEFAULT_GOAL := help


# https://swcarpentry.github.io/make-novice/08-self-doc/index.html
## ❓  help											: This help
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<


## 🛠  python_dev_box_setup									: setup python environment
.PHONY: python_dev_box_setup
python_dev_box_setup: $(VENV_NAME)
$(VENV_NAME): requirements.*
	@test -d ${VENV_NAME} || python3 -m venv ${VENV_NAME};
	@. ${VENV_NAME}/bin/activate; pip install -r requirements.dev.in --upgrade
	@. ${VENV_NAME}/bin/activate; pip freeze | sort > requirements.dev.lock.txt
	@. ${VENV_NAME}/bin/activate; pip freeze | grep "restglue" > requirements.lock.txt
	@touch ${VENV_NAME} # Otherwise requirements.dev.lock.txt is newer
	@echo "Type ${YELLOW}source backend/.venv3/bin/activate${RESET} to activate python virtual environment"


build-docker:
	@docker build -t backend .