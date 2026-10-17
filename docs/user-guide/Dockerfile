# syntax=docker/dockerfile:1.21.0@sha256:27f9262d43452075f3c410287a2c43f5ef1bf7ec2bb06e8c9eeb1b8d453087bc
# check=error=true

# BusyBox command help: https://www.busybox.net/downloads/BusyBox.html
FROM docker.io/python:3.15.0-alpine@sha256:e7044ccc46c44b6174e0051dbdcb84c79e19d0f2c398d28d5d45521ea42b01e2

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
