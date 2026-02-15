# syntax=docker/dockerfile:1.17.1@sha256:38387523653efa0039f8e1c89bb74a30504e76ee9f565e25c9a09841f9427b05
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
