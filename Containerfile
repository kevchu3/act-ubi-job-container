FROM registry.access.redhat.com/ubi9/podman:9.4

# Install Git, container tools, and Node.js
RUN dnf install git buildah skopeo -y && \
    dnf module enable nodejs:20 -y && \
    dnf module install nodejs:20/development -y

ENV _BUILDAH_STARTED_IN_USERNS="" \
    BUILDAH_ISOLATION=chroot \
    STORAGE_driver=vfs

# Folder permissions to install Go tools
RUN mkdir /opt/hostedtoolcache && chown 1000:1000 /opt/hostedtoolcache

USER 1001
