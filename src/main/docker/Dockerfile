# syntax=docker/dockerfile:1.15.0@sha256:05e0ad437efefcf144bfbf9d7f728c17818408e6d01432d9e264ef958bbd52f3
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

# TODO: what about an alpine variant?
FROM docker.io/ubuntu:noble@sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782 AS build

ARG MINECRAFT_VERSION

RUN if [[ -z "$MINECRAFT_VERSION" ]]; then \
        echo "Error: MINECRAFT_VERSION argument is not set." >&2; \
        exit 1; \
    fi

RUN echo "Building PaperMC server for Minecraft version: $MINECRAFT_VERSION"

WORKDIR /build

# Install required dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends ca-certificates curl jq && \
    rm -rf /var/lib/apt/lists/*

# Retrieve latest Paper server for the given version
COPY --chmod=500 get-papermc-server.sh .
RUN ./get-papermc-server.sh "$MINECRAFT_VERSION"

FROM docker.io/eclipse-temurin:21-jre-noble@sha256:3ef64ec531571987f58ccc90bd3d7f92950539f1baa00a5c45b660d6faccf37d

# Need to be turned to "true" manually to confirm agreement with Minecraft EULA (https://aka.ms/MinecraftEULA)
ENV EULA=false

# Keep dependencies up-to-date
# gettext is required for envsubst
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends gettext && \
    rm -rf /var/lib/apt/lists/*

# Create the "papermc" user
RUN groupadd --system papermc && useradd --system --gid papermc --create-home papermc

# Lock root user for security purposes
RUN passwd --lock root

# Now rely exclusively on the PaperMC user (rootless mode)
USER papermc

WORKDIR /home/papermc

# Copy license file
ADD --chmod=444 https://raw.githubusercontent.com/Djaytan/docker-papermc-server/refs/heads/main/LICENSE.md .

# Copy the PaperMC server
COPY --from=build --chown=papermc --chmod=500 /build/papermc-server-*.jar ./

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
