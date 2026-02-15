# syntax=docker/dockerfile:1.21.0@sha256:27f9262d43452075f3c410287a2c43f5ef1bf7ec2bb06e8c9eeb1b8d453087bc
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
