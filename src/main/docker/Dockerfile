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
FROM docker.io/eclipse-temurin:21-jdk-alpine@sha256:2f2f553ce09d25e2d2f0f521ab94cd73f70c9b21327a29149c23a2b63b8e29a0 AS jre-build

# Create a custom Java runtime
#
# All modules are included (ALL-MODULE-PATH) since we are unable to know which ones
# are required by plugins
RUN ${JAVA_HOME}/bin/jlink \
    --add-modules ALL-MODULE-PATH \
    --strip-debug \
    --no-man-pages \
    --no-header-files \
    --output /jre

FROM docker.io/alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c AS papermc-server-build

ARG MINECRAFT_VERSION

RUN if [ -z "$MINECRAFT_VERSION" ]; then \
        echo "Error: MINECRAFT_VERSION argument is not set." >&2; \
        exit 1; \
    fi

RUN echo "Building PaperMC server for Minecraft version: $MINECRAFT_VERSION"

WORKDIR /build

# Install required dependencies
RUN apk add --no-cache ca-certificates curl jq

# Retrieve latest Paper server for the given version
COPY --chmod=500 get-papermc-server.sh .
RUN ./get-papermc-server.sh "$MINECRAFT_VERSION"

# TODO: make the image UID/GID-agnostic (e.g., for compatibility with OpenShift)
FROM docker.io/alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c

# JRE setup
ENV JAVA_HOME=/opt/java
ENV PATH="${JAVA_HOME}/bin:${PATH}"

COPY --from=jre-build /jre ${JAVA_HOME}

# Need to be turned to "true" manually to confirm agreement with Minecraft EULA (https://aka.ms/MinecraftEULA)
ENV EULA=false

# Keep dependencies up-to-date
# bash is still required by start.sh for now (to be removed)
# gettext is required for envsubst: https://pkgs.alpinelinux.org/package/edge/main/x86_64/gettext
# libudev-zero is the Alpine-equivalent of libudev, which is required by PaperMC: https://pkgs.alpinelinux.org/package/edge/community/x86/libudev-zero
RUN apk add --no-cache bash gettext libudev-zero

# Create the "papermc" user
#
# Long-form parameters are not supported (e.g., --system, --group, --shell)
# BusyBox "adduser" doc: https://busybox.net/downloads/BusyBox.html#adduser
RUN addgroup -S papermc && adduser -S -G papermc -h /home/papermc -s /sbin/nologin papermc

# Now rely exclusively on the PaperMC user (rootless mode)
USER papermc

WORKDIR /home/papermc

# Copy license file
ADD --chmod=444 https://raw.githubusercontent.com/Djaytan/docker-papermc-server/refs/heads/main/LICENSE.md .

# Copy the PaperMC server
COPY --from=papermc-server-build --chown=papermc --chmod=500 /build/papermc-server-*.jar ./

# Copy the configuration files
# Write access is required by PaperMC to update the configuration files
# even tho we would prefer otherwise in containers (read-only access for immutability enforcement)
COPY --chown=papermc --chmod=700 runtime/config/base ./
COPY --chown=papermc --chmod=700 runtime/config/papermc config/

# Copy the server startup script
COPY --chown=papermc --chmod=500 runtime/start.sh ./

# Minecraft ports
EXPOSE 25565/tcp
EXPOSE 25565/udp

# TODO: Pre-launch server to pre-download Mojang's server jar for quick startup
ENTRYPOINT ["./start.sh"]

# TODO: healthcheck
