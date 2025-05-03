<h1 align="center">Docker PaperMC Server</h1>

<div align="center">

![Compatibility](https://img.shields.io/badge/PaperMC_Support-v1.21.4-blue)
[![CI](https://github.com/Djaytan/docker-papermc-server/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/Djaytan/docker-papermc-server/actions/workflows/ci.yml)
[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/10360/badge)](https://www.bestpractices.dev/projects/10360)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/Djaytan/docker-papermc-server/badge)](https://securityscorecards.dev/viewer/?uri=github.com/Djaytan/docker-papermc-server)<br/>
[![Docker Pulls](https://img.shields.io/docker/pulls/djaytan/papermc-server.svg?logo=docker)](https://hub.docker.com/r/djaytan/papermc-server/)
[![Docker Stars](https://img.shields.io/docker/stars/djaytan/papermc-server.svg?logo=docker)](https://hub.docker.com/r/djaytan/papermc-server/)

Dockerized and fine-grained customizable PaperMC server.

</div>

## Features

* Alpine-based image
* Lightweight (~360 MB)
* Multi-architecture support (amd64 & arm64)

TODO

## Contributing

If you want to help us improve the project, you can learn more about ways to do so [here](docs/CONTRIBUTING.md).

## Versioning

This project follows [Semantic Versioning](https://semver.org/).

The Docker tagging scheme is `<mc-version>-v<image-version>-<timestamp-YYYYMMDD>` (e.g. `1.21.4-v1.2.1-20250406`)

## Security Policy

In case you think having found a security vulnerability, please consult
our [Security Policy](docs/SECURITY.md).

## Licence

This project inherits its licensing from the included upstream projects. As such, it is licensed under
the [GNU GPL v3.0](https://www.gnu.org/licenses/gpl-3.0.html) license, as it inherits from PaperMC, which in turn inherits it from the original Bukkit and
CraftBukkit projects.

The distributed OCI image is based on [the Alpine one](https://hub.docker.com/_/alpine).
As with all Docker images, these likely also contain other software which may be under other licenses. Details about Alpine packages can be
found [here](https://pkgs.alpinelinux.org/packages).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with
any relevant licenses for all software contained within.
