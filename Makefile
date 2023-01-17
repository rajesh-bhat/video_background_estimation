.PHONY: help install clean black flake all test

PROJECT_SOURCE=video_background_estimation

install: ## Install the package locally
	@poetry install
	@poetry run pre-commit install

black: ## Format the code
	@echo "Running black"
	@poetry run black $(PROJECT_SOURCE) tests

flake: ## run flake8 linter
	@echo "Running flake8"
	@poetry run flake8 $(PROJECT_SOURCE) tests --config .flake8

isort: ## sort the imports
	@echo "Sorting imports using isort"
	@poetry run isort $(PROJECT_SOURCE) tests

test: ## run test suites
	@echo "Running unit and integration tests"
	@poetry run pytest --disable-pytest-warnings

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: black isort flake test ## All at once