# Security Best Practices

This guide provides practical instructions for optimizing the OCI image, with an emphasis on ensuring both compatibility and security.

## Recommended Usage

For production-grade deployments, it is recommended to use a command similar to this one:

```bash
$ docker run -d -it \
    --name papermc-server \
    --restart=on-failure:10 \
    --cap-drop all \
    --security-opt no-new-privileges \
    --ulimit nofile=16384 \
    --ulimit nproc=4096 \
    --ulimit core=0 \
    --cpus=4 \
    --memory=8GB \
    -p 25565:25565 \
    -e EULA=true \
    'djaytan/papermc-server:1.21.4'
```

These settings offer sensible defaults, but you may need to adjust them based on your server's unique requirements. This documentation explains the rationale
behind these recommendations and guides you on how to tailor them to fit your needs.

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
which advises enforcing constraints on memory, CPU, file descriptors, and processes.

Container resource limits fall into two main categories:

### Process-Level Limits (`ulimit`)

These limits apply at process level inside the container and are enforced via the Linux `ulimit` mechanism (i.e., `RLIMIT_*`). The following values are
recommended:

* `nofile` (maximum number of open files): `16384`
* `nproc` (maximum number of processes): `4096`
* `core` (core dump size): `0`

These settings are generous and suitable for most workloads. You may consider tightening them further based on actual usage, after proper testing and
monitoring.

While a high `nproc` limit is typically safe, be aware that it can occasionally trigger unexpected
behavior depending on the container runtime or host configuration. For further details, see
the [Docker documentation on `nproc` usage](https://docs.docker.com/reference/cli/docker/container/run/#for-nproc-usage).

Setting `core` to `0` disables core dumps, which can consume significant disk space and potentially expose sensitive information. This is especially important
in production environments where security and data confidentiality are critical.

### System Resource Limits (Cgroups)

System-level resource limits control the overall consumption of CPU and memory by the container. These constraints are enforced by the Linux kernel using
control groups (cgroups), ensuring that containers operate within defined boundaries and do not exhaust host resources.

#### Recommended Settings

* `memory` (maximum memory): At least **6 GB to 10 GB**, depending on the expected load. For detailed guidance, refer
  to [PaperMC’s memory recommendations](https://docs.papermc.io/paper/aikars-flags/#recommended-memory).
* `cpu` (CPU allocation): Allocate **2 to 4 cores** as a baseline. Actual needs may vary depending on the number of players, active plugins, world complexity,
  and other workload characteristics.

Cgroup limits are especially important in multi-tenant environments or orchestrated systems like Kubernetes, where resource isolation, predictability, and
fairness across containers are critical for system stability.
