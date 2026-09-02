# syntax=docker/dockerfile:1.27.0@sha256:bde3983e9c939224420ddaf6b784cc30e09b035a4dea01f581230c50809f372e
# check=error=true

# BusyBox command help: https://www.busybox.net/downloads/BusyBox.html
FROM docker.io/python:3.14.3-alpine@sha256:faee120f7885a06fcc9677922331391fa690d911c020abb9e8025ff3d908e510

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
