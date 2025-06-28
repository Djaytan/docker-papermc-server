# syntax=docker/dockerfile:1.17.1@sha256:38387523653efa0039f8e1c89bb74a30504e76ee9f565e25c9a09841f9427b05
# check=error=true

# BusyBox command help: https://www.busybox.net/downloads/BusyBox.html
FROM docker.io/python:3.13.5-alpine@sha256:9b4929a72599b6c6389ece4ecbf415fd1355129f22bb92bb137eea098f05e975

# Setup prerequisites for MkDocs Git-related features (e.g. revisions, collaborators, ...)
RUN apk add --no-cache git

# Trust mounted host files in container at runtime
RUN git config --system --add safe.directory /run

# New user and group for MkDocs
RUN addgroup -S -g 1000 mkdocs && \
    adduser -S -u 1000 -G mkdocs mkdocs

USER 1000:1000

ENV HOME=/home/mkdocs
ENV PATH="${PATH}:${HOME}/.local/bin"

WORKDIR ${HOME}

COPY requirements/requirements.txt .

# Install MkDocs and its dependencies
RUN pip install --user --require-hashes --requirement requirements.txt && rm requirements.txt

VOLUME ["/run"]

WORKDIR /run

EXPOSE 8000

ENTRYPOINT ["mkdocs"]
