# syntax=docker/dockerfile:1.21.0@sha256:27f9262d43452075f3c410287a2c43f5ef1bf7ec2bb06e8c9eeb1b8d453087bc
# check=error=true

# BusyBox command help: https://www.busybox.net/downloads/BusyBox.html
FROM docker.io/python:3.14.7-alpine@sha256:9e9fde4d32eedce0b661d9ab91e826b62dddf28e928c230ec55f1866cac66b01

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
