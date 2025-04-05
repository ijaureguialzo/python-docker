ARG PYTHON_VERSION=3.13

FROM python:${PYTHON_VERSION}

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y \
    nano

RUN pip install poetry

WORKDIR /proyectos

EXPOSE 8000
