FROM docker.io/ubuntu:noble@sha256:3afff29dffbc200d202546dc6c4f614edc3b109691e7ab4aa23d02b42ba86790 AS build

ARG MINECRAFT_VERSION=1.21.4

WORKDIR /build

# Install required dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends ca-certificates curl jq && \
    apt-get auto-remove && \
    apt-get clean

# Retrieve latest Paper server for the given version
COPY --chmod=500 build/get-papermc-server.sh .
RUN ./get-papermc-server.sh ${MINECRAFT_VERSION}

FROM docker.io/eclipse-temurin:24-jre-noble@sha256:7aa734c5fe42c1e46a6ff044131b19fe42376c270b68c7e1dc3ca0262b7f8665

# Need to be turned to "true" manually to confirm agreement with Minecraft EULA (https://aka.ms/MinecraftEULA)
ENV EULA=false

# Install required dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y gettext && \
    apt-get auto-remove && \
    apt-get clean

# Create the "papermc" user
RUN groupadd --system papermc && useradd --system --gid papermc --create-home papermc

# Lock root user for security purposes
RUN passwd --lock root

# Now rely exclusively on the PaperMC user (rootless mode)
USER papermc

WORKDIR /home/papermc

# Copy the PaperMC server
COPY --from=build --chown=papermc --chmod=500 /build/papermc-server-*.jar ./

# Copy the configuration files
# Write access is required by PaperMC to update the configuration files
# even tho we would prefer otherwise in containers (read-only access for immutability enforcement)
COPY --chown=papermc --chmod=700 runtime/config/base/ ./
COPY --chown=papermc --chmod=700 runtime/config/papermc/ config/

# Copy the server startup script
COPY --chown=papermc --chmod=500 runtime/start.sh ./

# Minecraft ports
EXPOSE 25565/tcp
EXPOSE 25565/udp

ENTRYPOINT ["./start.sh"]
