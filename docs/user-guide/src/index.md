# 🐳 Docker PaperMC Server</h1>

A general-purpose, OCI-compliant PaperMC server with streamlined and fine-grained customization options.

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
* ☸️ **Helm Chart** – Easily deploy the server to Kubernetes using [the reference Helm Chart](https://github.com/Djaytan/helm-papermc-server).
