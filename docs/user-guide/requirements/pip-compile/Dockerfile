# syntax=docker/dockerfile:1.16.0@sha256:e2dd261f92e4b763d789984f6eab84be66ab4f5f08052316d8eb8f173593acf7
# check=error=true

# Note: impossible to rely on v3.13.14 (missing 'cache_clear' function error)
FROM docker.io/python:3.12.11-alpine@sha256:c610e4a94a0e8b888b4b225bfc0e6b59dee607b1e61fb63ff3926083ff617216

RUN addgroup -S pip && \
    adduser --system --disabled-password --shell /sbin/nologin pip

ENV PATH="${PATH}:/home/pip/.local/bin"

USER pip

RUN pip install --user pip-tools
