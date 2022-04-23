#!/usr/bin/env bash

# This script must be executed using the "buildah unshare" command."
# "If an unprivileged users wants to mount and work with a container,
# thenthey need to execute buildah unshare.
# Executing buildah mount fails for unprivileged users unless the user is
# running inside a buildah unshare session."

CONTAINER=$(buildah from registry.fedoraproject.org/fedora-minimal:35)

buildah run ${CONTAINER} microdnf install -y gcc alsa-lib-devel rust rustfmt clippy cargo git

buildah run ${CONTAINER} git clone https://github.com/librespot-org/librespot.git /root/librespot
buildah run ${CONTAINER} /bin/bash -c 'cd /root/librespot; \
        git switch dev; \
        cargo build --no-default-features --features "alsa-backend"'

MNT=$(buildah mount $CONTAINER)
echo ${MNT}
cp ${MNT}/root/librespot/target/debug/librespot .

buildah umount $CONTAINER

buildah commit ${CONTAINER} librespot-container

buildah rm $CONTAINER