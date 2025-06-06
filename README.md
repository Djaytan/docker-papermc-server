<h1 align="center">🐳 Docker PaperMC Server</h1>

<div align="center">

![Compatibility](https://img.shields.io/badge/PaperMC_Support-v1.21.4-blue)
[![CI](https://github.com/Djaytan/docker-papermc-server/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/Djaytan/docker-papermc-server/actions/workflows/ci.yml)
[![semantic-release: conventional-commits](https://img.shields.io/badge/semantic--release-conventional--commits-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)<br/>
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=Djaytan_docker-papermc-server&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=Djaytan_docker-papermc-server)
[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/10360/badge)](https://www.bestpractices.dev/projects/10360)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/Djaytan/docker-papermc-server/badge)](https://securityscorecards.dev/viewer/?uri=github.com/Djaytan/docker-papermc-server)<br/>
[![Docker Pulls](https://img.shields.io/docker/pulls/djaytan/papermc-server.svg?logo=docker)](https://hub.docker.com/r/djaytan/papermc-server/)
[![Docker Stars](https://img.shields.io/docker/stars/djaytan/papermc-server.svg?logo=docker)](https://hub.docker.com/r/djaytan/papermc-server/)

A general-purpose, OCI-compliant PaperMC server with streamlined and fine-grained customization options.

Available in [Docker Hub](https://hub.docker.com/r/djaytan/papermc-server).

</div>

## 📘 Usage

For a quick start, you can run the following command:

```bash
$ docker run -d -it \
    --name papermc-server \
    --restart=always \
    -p 25565:25565 \
    -e EULA=true \
    'djaytan/papermc-server:latest'
```

> [!NOTE]
> Available tags can be found [here](https://hub.docker.com/r/djaytan/papermc-server/tags).

> [!IMPORTANT]
> Setting the `EULA` environment variable to `true` implies that you have read and accepted the [Minecraft EULA](https://www.minecraft.net/en-us/eula).

> [!TIP]
> You can customize the server using **environment variables** or **configuration files**.
> Learn more in the [configuration guide](docs/user-guide/configuration.md).
>
> For production-grade deployments, we recommend following
> [our dedicated setup guide](docs/user-guide/production-grade-deployment.md).

## ✨ Highlights

* 🏔️ **[Alpine](https://hub.docker.com/_/alpine)-based image**
* 🪶 **Lightweight** – ~125 MB
* 🧘 **Minimalist** – Includes only essential dependencies to reduce image size and surface area
* 🧩 **Customizable** – Streamlined and fine-grained configuration options **_(WIP)_**
* 👤 **UID-agnostic** – Supports running the server with a custom/arbitrary UID (typically required when running container
  in [OpenShift](https://www.redhat.com/en/technologies/cloud-computing/openshift))
* 🔐 **Rootless by default** – Runs as a non-root user when no custom UID is specified
* 🧬 **Multi-architecture support** – Built for `linux/amd64` & `linux/arm64` _(additional OSs/architectures available on request)_
* ☕ **JRE 21** – Based on [Eclipse Temurin](https://hub.docker.com/_/eclipse-temurin)
  * Custom-built using `jlink` to minimize size
  * Includes standard Java modules for broad plugin compatibility
* 🩺 **Healthcheck integration** – Enhances resilience and high availability by continuously monitoring server health
* 🔍 **Frequent quality & security scans** – Powered by [SonarQube Cloud](https://sonarcloud.io/summary/new_code?id=Djaytan_docker-papermc-server)
  and [Docker Scout](https://docs.docker.com/scout/)
* 🔄 **Scheduled auto-updates** – Bi-monthly rebuilds to incorporate upstream security patches and new PaperMC builds. Other updates are tracked and
  semi-automatically managed via Renovate.

A list of additional planned features can be found [here](docs/planned-features.md).

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
