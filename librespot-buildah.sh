#!/usr/bin/env bash

# This script must be executed using the "buildah unshare" command."
# "If an unprivileged users wants to mount and work with a container,
# thenthey need to execute buildah unshare.
# Executing buildah mount fails for unprivileged users unless the user is
# running inside a buildah unshare session."

CONTAINER=$(buildah from registry.fedoraproject.org/fedora-minimal:41)

MNT=$(buildah mount $CONTAINER)

buildah run ${CONTAINER} microdnf install -y cargo make gcc alsa-lib-devel 
buildah run ${CONTAINER} microdnf clean all
buildah run ${CONTAINER} rm -rf /var/cache/dnf
# The --locked flag can be used to force Cargo to use the packaged Cargo. lock file if it is available. This may be useful for ensuring reproducible builds, to use the exact same set of dependencies that were available when the package was published.
# Source: https://doc.rust-lang.org/cargo/commands/cargo-install.html
buildah run ${CONTAINER} cargo install --locked librespot --no-default-features --features "alsa-backend with-libmdns"

buildah config --entrypoint "/root/.cargo/bin/librespot" ${CONTAINER} 
#buildah config --cmd "--name=Buildah_LibreSpot_Speaker --bitrate=320 --zeroconf-port=49999 --device=hdmi:CARD=PCH,DEV=0 --initial-volume=75 -v" ${CONTAINER}
buildah config --cmd "--name=Buildah_LibreSpot_Speaker --bitrate=320 --zeroconf-port=49999 --backend=alsa --device=default --initial-volume=75 -v" ${CONTAINER}

buildah config --label maintainer="Benjamin Blasco" ${CONTAINER}
buildah config --label description="Fedora-based container for running librespot, built on Rust" ${CONTAINER}

echo ${MNT}
cp ${MNT}/root/.cargo/bin/librespot .

buildah umount $CONTAINER

buildah commit ${CONTAINER} librespot-container

buildah rm $CONTAINER
