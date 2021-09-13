# https://gist.github.com/rsperl/d2dfe88a520968fbc1f49db0a29345b9

SHELL=/bin/bash

VENV_NAME?=.venv3

# to see all colors, run
# bash -c 'for c in {0..255}; do tput setaf $c; tput setaf $c | cat -v; echo =$c; done'
# the first 15 entries are the 8-bit colors

# define standard colors
ifneq (,$(findstring xterm,${TERM}))
	BLACK        := $(shell tput -Txterm setaf 0)
	RED          := $(shell tput -Txterm setaf 1)
	GREEN        := $(shell tput -Txterm setaf 2)
	YELLOW       := $(shell tput -Txterm setaf 3)
	LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
	PURPLE       := $(shell tput -Txterm setaf 5)
	BLUE         := $(shell tput -Txterm setaf 6)
	WHITE        := $(shell tput -Txterm setaf 7)
	RESET := $(shell tput -Txterm sgr0)
else
	BLACK        := ""
	RED          := ""
	GREEN        := ""
	YELLOW       := ""
	LIGHTPURPLE  := ""
	PURPLE       := ""
	BLUE         := ""
	WHITE        := ""
	RESET        := ""
endif


.DEFAULT_GOAL := help


# https://swcarpentry.github.io/make-novice/08-self-doc/index.html
# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
## ❓  help											: This help
.PHONY : help
help : Makefile
	@echo "${YELLOW}Available rules:${RESET}"
	@echo
	@ #sed -n 's/^##//p' $<
	@#grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: colors
colors: ## show all the colors
	@echo "${BLACK}BLACK${RESET}"
	@echo "${RED}RED${RESET}"
	@echo "${GREEN}GREEN${RESET}"
	@echo "${YELLOW}YELLOW${RESET}"
	@echo "${LIGHTPURPLE}LIGHTPURPLE${RESET}"
	@echo "${PURPLE}PURPLE${RESET}"
	@echo "${BLUE}BLUE${RESET}"
	@echo "${WHITE}WHITE${RESET}"



## 🛠  dev_box_setup										: setup python environment and node environment
.PHONY: dev_box_setup
dev_box_setup:
	@#brew install docker docker-composer node
	@(cd backend; make python_dev_box_setup)
	@(cd frontend; make node_dev_box_setup)



.PHONY: build-docker
build-docker: ## 🌊 Build images so composer can use them
	@(cd backend; make build-docker)
	@(cd frontend; make build-docker)



.PHONY: run-composer
run-composer: ## 🌊 Build images so composer can use them
	@docker-compose up -d


#.PHONY: check-safety
#check-safety:
#	$(POETRY_COMMAND_FLAG)poetry check
#	$(PIP_COMMAND_FLAG)poetry run pip check
#	$(SAFETY_COMMAND_FLAG)poetry run safety check --full-report
#	$(BANDIT_COMMAND_FLAG)poetry run bandit -ll -r flask_rest_glue/
#
#.PHONY: check-style
#check-style:
#	#$(BLACK_COMMAND_FLAG)poetry run black --config pyproject.toml --diff --check ./
#	$(DARGLINT_COMMAND_FLAG)poetry run darglint -v 2 **/*.py
#	$(ISORT_COMMAND_FLAG)poetry run isort --settings-path pyproject.toml --check-only **/*.py
#	$(MYPY_COMMAND_FLAG)poetry run mypy --config-file setup.cfg flask_rest_glue tests/**.py
#
#.PHONY: codestyle
#codestyle:
#	poetry run pyupgrade --py37-plus **/*.py
#	poetry run isort --settings-path pyproject.toml **/*.py
#	#poetry run black --config pyproject.toml ./
#
#.PHONY: test
#test:
#	poetry run pytest
#
#.PHONY: lint
#lint: test check-safety check-style

# Example: make docker VERSION=latest
# Example: make docker IMAGE=some_name VERSION=0.0.1
#.PHONY: docker
#docker_backend:
#	@echo Building docker $(IMAGE):$(VERSION) ...
#	docker build \
#		-t $(IMAGE):$(VERSION) . \
#		-f ./backend/Dockerfile --no-cache




# Example: make clean_docker VERSION=latest
# Example: make clean_docker IMAGE=some_name VERSION=0.0.1
#.PHONY: clean_docker
#clean_docker:
#	@echo Removing docker $(IMAGE):$(VERSION) ...
#	docker rmi -f $(IMAGE):$(VERSION)

.PHONY: clean
clean: ## 🗑  Remove auto-generated files.
	@echo "> 💥 ${RED}Cleaning related folders/files...${RESET}"
#	@echo \> Cleaning ....
	@find ./ -type f -name '*.pyc' -delete
	@find . -type d -name '__pycache__' | xargs rm -rf
	@find . -name '*.pyc' -exec rm -f {} +
	@find . -name '*.pyo' -exec rm -f {} +
	@find . -name '*~' -exec rm -f {} +
	@rm -rf ./src/trader.egg-info/
	@rm -rf .pytest_cache/
	@rm -rf .tox/
	@rm -f .coverage
	@rm -f coverage.xml
	@rm -rf htmlcov/
	@rm -rf *.html
	@rm -rf build/
	@rm -rf dist/
	@rm -rf sdist/
	@echo \> "${GREEN}... Done!${RESET}"

