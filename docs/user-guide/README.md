# User Guide

The user guide is made with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/).

## Prerequisites

The only prerequisite is to have [Docker](https://www.docker.com/) installed on your system.

## Localdev

Run this command:

```bash
./localdev.sh
```

### ⚠️ Caveat

Don't try to access the preview at `http://0.0.0.0:8000/docker-papermc-server/` as opposed to what may indicate logs.
Doing so will result in a failure.

Instead, use `http://localhost:8000/docker-papermc-server/` or `http://127.0.1:8000/docker-papermc-server/`.

## Wrapper Script

To run `mkdocs` commands, use the `mkdocs.sh` script. For example:

```bash
./mkdocs.sh build
```

But it is recommended to use the `localdev.sh` script instead unless you know what you are doing.
