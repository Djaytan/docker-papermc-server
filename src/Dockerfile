FROM docker.io/ubuntu:noble@sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782 AS build

WORKDIR /build

# Install required dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends ca-certificates curl jq && \
    apt-get auto-remove && \
    apt-get clean

# Retrieve latest Paper server for the given version
COPY --chmod=500 build/get-papermc-server.sh .
RUN ./get-papermc-server.sh

FROM docker.io/eclipse-temurin:21-jre-noble@sha256:3ef64ec531571987f58ccc90bd3d7f92950539f1baa00a5c45b660d6faccf37d

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
