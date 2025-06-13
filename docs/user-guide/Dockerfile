# syntax=docker/dockerfile:1.16.0@sha256:e2dd261f92e4b763d789984f6eab84be66ab4f5f08052316d8eb8f173593acf7
# check=error=true

FROM docker.io/python:3.13.14-alpine@sha256:b4d299311845147e7e47c970566906caf8378a1f04e5d3de65b5f2e834f8e3bf

WORKDIR /run

COPY requirements/requirements.txt .

RUN \
  ## Install MkDocs and its dependencies
    pip install --no-cache-dir --require-hashes --requirement requirements.txt \
  && \
    rm requirements.txt \
  ## Setup prerequisites for MkDocs Git-related features (e.g. revisions, collaborators, ...)
  && \
    apk add --no-cache git \
  && \
    git config --system --add safe.directory /run

USER daemon

EXPOSE 8000

ENTRYPOINT ["mkdocs"]
