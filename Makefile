#!make

help: _header
	${info }
	@echo Opciones:
	@echo ----------------------
	@echo build
	@echo workspace
	@echo clean
	@echo ----------------------

_header:
	@echo ----------------
	@echo Python en Docker
	@echo ----------------

build:
	@docker compose build --pull

workspace:
	@docker compose run --service-ports --rm python-docker /bin/bash

clean:
	@docker compose down -v --remove-orphans
