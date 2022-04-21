#!/usr/bin/env bash

# You can enter the user namespace using the buildah unshare command.
# If you don’t do this, the buildah mount, command will fail. 
buildah unshare

CONTAINER=$(buildah from registry.fedoraproject.org/fedora-minimal:35)

MNT=$(buildah mount $CONTAINER)

buildah run ${CONTAINER} microdnf install -y cargo make gcc alsa-lib-devel 
buildah run ${CONTAINER} microdnf clean all
buildah run ${CONTAINER} rm -rf /var/cache/dnf
buildah run ${CONTAINER} cargo install librespot --no-default-features --features "alsa-backend"

buildah config --entrypoint "/root/.cargo/bin/librespot" ${CONTAINER} 
#buildah config --cmd "--name=Buildah_LibreSpot_Speaker --bitrate=320 --zeroconf-port=49999 --device=hdmi:CARD=PCH,DEV=0 --initial-volume=75 -v" ${CONTAINER}
buildah config --cmd "--name=Buildah_LibreSpot_Speaker --bitrate=320 --zeroconf-port=49999 --backend=alsa --device=default --initial-volume=75 -v" ${CONTAINER}

buildah config --label maintainer="Benjamin Blasco" ${CONTAINER}
buildah config --label description="Fedora-based container for running librespot, built on Rust" ${CONTAINER}

cp $MNT/root/.cargo/bin/librespot /tmp

buildah commit ${CONTAINER} librespot-container

exit
