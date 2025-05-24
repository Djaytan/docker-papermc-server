# syntax=docker/dockerfile:1.15.1@sha256:9857836c9ee4268391bb5b09f9f157f3c91bb15821bb77969642813b0d00518d
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
FROM docker.io/alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c AS papermc-server-build

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
FROM docker.io/itzg/mc-monitor:0.15.5@sha256:301d416d2636be3461046f783853a45e095d974014751fea9b9c875ba782e1bf AS mc-monitor-build



# Use the CUE lang to handle configuration validation and generation.
FROM docker.io/cuelang/cue:0.12.1@sha256:1c68bd10c1a09fad8431330c7375603dd8c5d7904251f21604b397b21de91259 AS cuelang-build



# ===================================
#        >>> FINAL STAGE <<<
# ===================================
FROM docker.io/alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c

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

# Copy the configuration files.
# PaperMC attempts to update these files at runtime, which requires write access.
# While not strictly necessary, making them writable prevents annoying warnings in the logs.
# Ideally, configs would be read-only to enforce immutability, but this is a trade-off for cleaner logs.
COPY --chmod=770 runtime/config/eula.txt ./
COPY --chmod=770 runtime/config/server.properties ./
COPY --chmod=770 runtime/config/bukkit.cue cue/
COPY --chmod=770 runtime/config/commands.cue cue/
COPY --chmod=770 runtime/config/permissions.cue cue/
COPY --chmod=770 runtime/config/spigot.cue cue/
COPY --chmod=770 runtime/config/paper-global.cue cue/
COPY --chmod=770 runtime/config/paper-world-defaults.cue cue/

# Copy the server startup script.
COPY --chmod=550 runtime/start.sh ./

# Adjust permissions.
RUN chmod 770 /opt/papermc /opt/papermc/cue/

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
