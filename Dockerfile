ARG UPSTREAM_VERSION_PORTAINER

FROM busybox:1.37.0-musl AS busybox

FROM portainer/portainer-ce:${UPSTREAM_VERSION_PORTAINER}

# The Portainer image has no shell or coreutils. Restoring a backup from the
# package's Backup tab runs `docker exec <container> mkdir -p <dir>` first,
# which fails without a mkdir binary. Static busybox named mkdir runs only its
# mkdir applet.
COPY --from=busybox /bin/busybox /bin/mkdir
