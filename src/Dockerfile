# syntax=docker/dockerfile:1.17.1@sha256:38387523653efa0039f8e1c89bb74a30504e76ee9f565e25c9a09841f9427b05
# check=error=true

# Docker PaperMC Server
# Copyright (C) 2025 Djaytan
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# See https://docs.docker.com/build/metadata/attestations/sbom/#arguments
ARG BUILDKIT_SBOM_SCAN_STAGE=true



# Create a custom Java runtime.
#
# All modules are included (ALL-MODULE-PATH) since we are unable to know which ones
# are required by plugins.
FROM docker.io/eclipse-temurin:21-jdk-alpine@sha256:2f2f553ce09d25e2d2f0f521ab94cd73f70c9b21327a29149c23a2b63b8e29a0 AS jre-build

RUN ${JAVA_HOME}/bin/jlink \
    --add-modules ALL-MODULE-PATH \
    --strip-debug \
    --no-man-pages \
    --no-header-files \
    --output /jre



# Download the PaperMC server JAR file corresponding to the specified Minecraft version.
FROM docker.io/alpine:3.22.0@sha256:8a1f59ffb675680d47db6337b49d22281a139e9d709335b492be023728e11715 AS papermc-server-build

ARG MINECRAFT_VERSION

RUN if [ -z "$MINECRAFT_VERSION" ]; then \
        echo "Error: MINECRAFT_VERSION argument is not set." >&2; \
        exit 1; \
    fi

RUN echo "Building PaperMC server for Minecraft version: $MINECRAFT_VERSION"

WORKDIR /build

RUN apk add --no-cache ca-certificates curl jq

COPY --chmod=500 get-papermc-server.sh .
RUN ./get-papermc-server.sh "$MINECRAFT_VERSION"



# Use the official itzg/mc-monitor OCI image as a source for the mc-monitor binary.
# This approach ensures:
# - Compatibility with multi-arch builds (amd64, arm64) since the image is multi-platform.
# - Simplified setup: avoids manual download/extraction logic and dependency handling.
# - Automatic updates via Renovate (based on the image tag and digest).
# The image is pinned by digest for reproducibility and supply-chain security,
# while still allowing Renovate to track and update it as needed.
#
# The mc-monitor CLI is used for monitoring and health-checks purposes.
# See https://github.com/itzg/mc-monitor
FROM docker.io/itzg/mc-monitor:0.15.6@sha256:2710423b1ca953b842ad99b50af0d38796df403faa0d7d0ead6aa52179426b5a AS mc-monitor-build



# Use the CUE lang to handle configuration validation and generation.
FROM docker.io/cuelang/cue:0.13.2@sha256:3296cdefb31c57c8e09da34a19f2f80308cfa60e1f88d5762034654001f265a2 AS cuelang-build



# ===================================
#        >>> FINAL STAGE <<<
# ===================================
FROM docker.io/alpine:3.22.0@sha256:8a1f59ffb675680d47db6337b49d22281a139e9d709335b492be023728e11715

# ===================================
#             JRE setup
# ===================================

ENV JAVA_HOME=/opt/java
ENV PATH="${JAVA_HOME}/bin:${PATH}"

COPY --from=jre-build /jre ${JAVA_HOME}

# ===================================
#           PaperMC setup
# ===================================

# Need to be turned to "true" manually to confirm agreement with Minecraft EULA (https://aka.ms/MinecraftEULA).
ENV EULA=false

WORKDIR /opt/papermc

# Copy license file.
ADD --chmod=440 https://raw.githubusercontent.com/Djaytan/docker-papermc-server/refs/heads/main/LICENSE.md .

# Copy the PaperMC server JAR file.
COPY --from=papermc-server-build --chmod=550 /build/papermc-server-*.jar ./

# Keep dependencies up-to-date, and install:
# - gettext: is required for envsubst: https://pkgs.alpinelinux.org/package/edge/main/x86_64/gettext
# - libudev-zero: is the Alpine-equivalent of libudev, which is required by PaperMC: https://pkgs.alpinelinux.org/package/edge/community/x86/libudev-zero
RUN apk add --no-cache gettext libudev-zero

# Copy the configuration files and startup script.
# PaperMC attempts to update the config files at runtime, which requires write access.
# While not strictly necessary, making them writable prevents annoying warnings in the logs.
# Ideally, configs would be read-only to enforce immutability, but this is a trade-off for cleaner logs.
COPY --chmod=770 runtime/ ./

# Adjust permissions.
RUN chmod 770 /opt/papermc && \
    chmod 550 /opt/papermc/start.sh

# Minecraft port.
EXPOSE 25565

# mc-monitor setup for health-checks.
COPY --from=mc-monitor-build --chmod=550 /mc-monitor /usr/local/bin/mc-monitor

# CUE setup for configuration validation and generation.
COPY --from=cuelang-build --chmod=550 /usr/bin/cue /usr/local/bin/cue

# Switch to rooless mode by default.
#
# Rely on the predefined "daemon" user.
# Enforce "root" group to retain read and write access to files and directories
# owned by group "root" with group-level permissions (e.g., 770, 550).
# This avoids world-readable or writable permissions while remaining compatible with platforms
# that assign arbitrary UIDs at runtime, such as OpenShift.
# For more on OpenShift-compatible image design, see:
# https://docs.redhat.com/en/documentation/openshift_container_platform/4.18/html/images/creating-images#use-uid_create-images
# TODO: fix for Kubernetes (custom GID seems to be enforced, thus leading to permission issues)
USER daemon:root

# TODO: explicitly declare volume mount points with VOLUME (e.g., /opt/papermc/worlds, /opt/papermc/plugins/my-plugin, etc)

ENTRYPOINT ["./start.sh"]

HEALTHCHECK --interval=5s --timeout=3s --start-period=30s \
  CMD ["mc-monitor", "status"]
