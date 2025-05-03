# Guide

This guide helps you make the most of the OCI image, with a focus on compatibility and security.

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
