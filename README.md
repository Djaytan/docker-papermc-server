<h1 align="center">Docker PaperMC Server</h1>

<div align="center">

![Compatibility](https://img.shields.io/badge/PaperMC_Support-v1.21.4-blue)
[![CI](https://github.com/Djaytan/docker-papermc-server/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/Djaytan/docker-papermc-server/actions/workflows/ci.yml)
[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/10360/badge)](https://www.bestpractices.dev/projects/10360)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/Djaytan/docker-papermc-server/badge)](https://securityscorecards.dev/viewer/?uri=github.com/Djaytan/docker-papermc-server)<br/>
[![Docker Pulls](https://img.shields.io/docker/pulls/djaytan/papermc-server.svg?logo=docker)](https://hub.docker.com/r/djaytan/papermc-server/)
[![Docker Stars](https://img.shields.io/docker/stars/djaytan/papermc-server.svg?logo=docker)](https://hub.docker.com/r/djaytan/papermc-server/)

General-purpose, OCI-compliant PaperMC server with fine-grained customization capabilities.

Available in [Docker Hub](https://hub.docker.com/r/djaytan/papermc-server).

</div>

## ✨ Features

* **[Alpine](https://hub.docker.com/_/alpine)-based image**
* **Lightweight**: ~360 MB
* **Minimalist**: Includes only essential dependencies to reduce image size and surface area
* **UID-agnostic**: Supports running the server with a custom/arbitrary UID (typically required when running container
  in [OpenShift](https://www.redhat.com/fr/technologies/cloud-computing/openshift))
* **Rootless**: Runs as a non-root user by default if no UID is specified
* **Multi-architecture support**: Built for `amd64` & `arm64` _(additional architectures available on request)_
* **JRE 21**, based on [Eclipse Temurin](https://hub.docker.com/_/eclipse-temurin)
  * Custom-built using `jlink` to minimize size
  * Includes all standard Java modules to ensure broad compatibility with plugins
* **Frequent security scans**: By relying on [Trivy](https://trivy.dev/latest/) and [Docker Scout](https://docs.docker.com/scout/)

### 🛠️ Planned Features

The image is under active development, with the following enhancements planned:

* **Healthcheck integration**: Built-in Docker `HEALTHCHECK` instruction for better container observability.
* **Unified configuration interface**: Centralized PaperMC tuning via a config file, with optional environment variable overrides (which will be the main difference with [itzg's solution](https://docker-minecraft-server.readthedocs.io/en/latest/configuration/interpolating/)).
* **Customizable server startup options**: Ability to set JVM options and server properties via environment variables.
* **Enable/Disable Aikar's flags**: Aikar's researches ([link](https://aikar.co/2018/07/02/tuning-the-jvm-g1gc-garbage-collector-flags-for-minecraft/)) and [PaperMC recommendations](https://docs.papermc.io/paper/aikars-flags/)
* **Configurable TimeZone**
* **Auto-updating builds**: Scheduled rebuilds for including upstream JDK/PaperMC updates and security patches.
* **Compliancy with [OWASP Docker rules](https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html)**
* **GraalVM variant**

The below features may be implemented too, but are not a priority:

* **Configurable Java module set**: Option to build smaller JREs by selecting only required Java modules.
* **Support JMX**: Java Management Extensions enabling for remote management and monitoring (e.g., with [VisualVM](https://visualvm.github.io/), [JMC](https://openjdk.org/projects/jmc/), ...) => [spark](https://docs.papermc.io/paper/profiling/) may be preferred.
* **Documentation**: Comprehensive documentation for all features and configurations with [AsciiDoc](https://asciidoc.org/).
* **Share examples**
* **OpenJ9 variant**

## 🌍 Contributing

If you want to help us improve the project, you can learn more about ways to do so [here](docs/CONTRIBUTING.md).

Have a feature request? Don't hesitate to [fill an issue](https://github.com/Djaytan/docker-papermc-server/issues)!

## 🏷️ Versioning

This project follows [Semantic Versioning](https://semver.org/).

The Docker tagging scheme is `<mc-version>-v<image-version>-<timestamp-YYYYMMDD>` (e.g. `1.21.4-v1.2.1-20250406`)

## 🔒 Security Policy

In case you think having found a security vulnerability, please consult
our [Security Policy](docs/SECURITY.md).

## 📄 Licence

This project inherits its licensing from the included upstream projects. As such, it is licensed under
the [GNU GPL v3.0](https://www.gnu.org/licenses/gpl-3.0.html) license, as it inherits from PaperMC, which in turn inherits it from the original Bukkit and
CraftBukkit projects.

The distributed OCI image is based on [the Alpine one](https://hub.docker.com/_/alpine).
As with all Docker images, these likely also contain other software which may be under other licenses. Details about Alpine packages can be
found [here](https://pkgs.alpinelinux.org/packages).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with
any relevant licenses for all software contained within.
