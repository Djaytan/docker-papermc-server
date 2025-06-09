# syntax=docker/dockerfile:1.16.0@sha256:e2dd261f92e4b763d789984f6eab84be66ab4f5f08052316d8eb8f173593acf7
# check=error=true

FROM docker.io/squidfunk/mkdocs-material:9.6.14@sha256:eb04b60c566a8862be6b553157c16a92fbbfc45d71b7e4e8593526aecca63f52

RUN apk add --no-cache git && \
    pip install \
      mkdocs-git-revision-date-localized-plugin \
      mkdocs-git-committers-plugin-2
