# Production-Grade Deployment

This guide offers practical steps to optimize the OCI image for production use, focusing on compatibility, performance, and security.

## Recommended Usage

For production-grade deployments, the following command provides a more secure and efficient way to run the server:

```bash
$ docker run -d -it \
    --name papermc-server \
    --restart=on-failure:3 \
    --cap-drop all \
    --security-opt no-new-privileges \
    --cpus=4 \
    --memory=8GB \
    -p 25565:25565 \
    -e EULA=true \
    'djaytan/papermc-server:latest'
```

Alternatively, you can use a Docker Compose configuration like the one below:

```yaml
services:
  papermc-server:
    image: djaytan/papermc-server:latest
    ports:
      - '25565:25565'
    environment:
      EULA: 'true'
    mem_limit: 8GB
    cpus: 4
    restart: on-failure:3
    stdin_open: true
    tty: true
    privileged: false
    cap_drop:
      - ALL
```

These examples offer secure and sensible defaults. However, you should adjust resource limits and other options based on your server’s hardware and expected
usage. The rest of this documentation explains the reasoning behind these recommendations and provides guidance on customizing the setup to your specific needs.

## OWASP - Docker Security Cheat Sheet

The [OWASP Docker Security Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html) offers a thorough guide to securing
Docker containers. We strongly recommend following these best practices when running the PaperMC server container.

In the following sections, we’ll explain how to implement some of these recommendations specifically for this image.

_**Note:** Making the filesystem read-only is not yet fully supported in this image._

## UID/GID

The image is **UID-agnostic** as long as the container’s user belongs to the `root` group (`GID = 0`). If no user is specified, it defaults to the built-in
`daemon` user.

In many environments, this default setup is sufficient. However, in more restrictive contexts—such as Kubernetes or OpenShift—you may need greater flexibility.
These platforms often enforce the use of non-root users for security, and will assign a random UID at runtime to the container.

To accommodate such scenarios, the image is designed to remain functional even with an arbitrary UID, provided the user is part of the root group. This ensures
continued read and/or write access to files with group-level permissions (i.e., `g+r` or `g+rw`) without falling back on insecure world-readable and/or
writable (`o+r`, `o+rw`) modes.

For more details about OpenShift’s Security Context Constraints (SCCs), refer to
the [official documentation](https://docs.openshift.com/container-platform/latest/concepts/policy/security-context-constraints.html).

## Linux Kernel Capabilities & Privileges

It is recommended to drop all Linux kernel capabilities, as this enhances security without affecting the container’s functionality. The PaperMC server does not
require any special privileges, so this should not cause issues for most workloads. However, if you encounter specific problems, you can re-enable individual
capabilities as needed.

Additionally, disabling privilege escalation tools like `su` and `sudo` is recommended to further restrict potential security risks.

## Resource Limits

Setting appropriate resource limits is essential to ensure the container behaves reliably, securely, and within predictable boundaries. This aligns with [OWASP
Docker Security Cheat Sheet – Rule #7](https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html#rule-7-limit-resources-memory-cpu-file-descriptors-processes-restarts),
which typically advises enforcing constraints on memory and CPU.

Below are the recommendations for this container:

* 🧠 `memory` (maximum memory): At least **6 GB to 10 GB**, depending on the expected load. For detailed guidance, refer
  to [PaperMC’s memory recommendations](https://docs.papermc.io/paper/aikars-flags/#recommended-memory).
* 🖥️ `cpu` (CPU allocation): Allocate **2 to 4 cores** as a baseline. More cores can improve performance, especially with a larger player base or heavier
  workloads. Actual requirements will vary based on the number of players, active plugins, world complexity, and other performance factors.

Resource limits are especially important in multi-tenant environments or orchestrated systems like Kubernetes, where resource isolation, predictability, and
fairness across containers are critical for system stability.
