# 📘 Usage

For a quick start, you can run the following command:

```bash
$ docker run -d -it \
    --name papermc-server \
    --restart=always \
    -p 25565:25565 \
    -e EULA=true \
    'djaytan/papermc-server:latest'
```

!!! abstract "Tags"

    Available tags can be found [here](https://hub.docker.com/r/djaytan/papermc-server/tags).

!!! warning "Accepting the EULA"

    Setting the `EULA` environment variable to `true` implies that you have read and accepted the [Minecraft EULA](https://www.minecraft.net/en-us/eula).

!!! tip "Configuration"

    You can customize the server using **environment variables** or **configuration files**.
    Learn more in the [configuration guide](configuration.md).

    For production-grade deployments, we recommend following [our dedicated setup guide](production-grade-deployment.md).
