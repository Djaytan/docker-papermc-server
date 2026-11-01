# syntax=docker/dockerfile:1.28.0@sha256:bb22d9815c728170f72750f4e5b0d672e06176142e1d602c7e66c050100b7e5b
# check=error=true

# BusyBox command help: https://www.busybox.net/downloads/BusyBox.html
# Note: impossible to rely on v3.13.14 (missing 'cache_clear' function error)
FROM docker.io/python:3.14.3-alpine@sha256:faee120f7885a06fcc9677922331391fa690d911c020abb9e8025ff3d908e510

# New user and group for pip
RUN addgroup -S -g 1000 pip && \
    adduser -S -u 1000 -G pip pip

USER 1000:1000

ENV HOME=/home/pip
ENV PATH="${PATH}:${HOME}/.local/bin"
ENV PIP_TOOLS_CACHE_DIR='/tmp/.cache/pip-tools'

WORKDIR ${HOME}

RUN pip install --user pip-tools

VOLUME ["/run"]

WORKDIR /run
