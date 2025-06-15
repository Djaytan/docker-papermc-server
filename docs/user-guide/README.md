# 🧭 User Guide

This user guide is built using [MkDocs Material](https://squidfunk.github.io/mkdocs-material/), a modern static site generator designed for project
documentation.

## ⚙️ Prerequisites

Before getting started, make sure the following tools are installed and properly configured:

* 🐳 [Docker](https://www.docker.com/)<br/>
  Used to run the local development environment and build the documentation without installing Python or MkDocs directly on your machine.
* 🧑‍💻 [GitHub CLI](https://cli.github.com/)<br/>
  Required to authenticate with your GitHub account and generate a personal access token when needed. This is necessary because the `git-committers` MkDocs
  plugin may hit the GitHub API's unauthenticated rate limit or require access to private repositories.<br/>
  To authenticate, run:
  ```bash
  gh auth login
  ```
  Once authenticated, the GitHub CLI will provide the required token via `gh auth token`, which is used by the local development script when starting the
  container.

## 🚀 Local Development

To start the local development server, run:

```bash
./localdev.sh
```

### ⚠️ Important Note

The logs might suggest accessing the preview at `http://0.0.0.0:8000/docker-papermc-server/`, but this will not work.

Instead, open the site using one of the following URLs:

* `http://localhost:8000/docker-papermc-server/`
* `http://127.0.0.1:8000/docker-papermc-server/`

### 🛠️ Building the Site

If you want to generate the site files without starting the local development server, you can run:

```bash
./build.sh
```

## ➕ Adding Dependencies

### 🐍 Python Packages

Python dependencies are declared in `requirements/requirements.in`.
After editing this file to include the new packages, run the `requirements/requirements.sh` script.
This will regenerate `requirements/requirements.txt`, which is the file actually used by both the localdev and CI environments to install dependencies in a consistent and reproducible way.

### 🐧 Alpine Linux Packages

To add Alpine system packages, modify the `Dockerfile` directly.
