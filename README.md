# ublue-sway

https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/ublue-sway)](https://artifacthub.io/packages/search?repo=ublue-sway)

Custom [bootc](https://github.com/bootc-dev/bootc) image. This customizes the Universal Blue Base image adding Fedora Sway Atomic packages and layering Libvirt.

- Universal Blue Base: `ghcr.io/ublue-os/base-main:latest`
- Sway: `quay.io/repository/fedora-ostree-desktops/sway-atomic:44`
- Fedora: `quay.io/fedora/fedora-bootc:44`

## Fedora Sway
- Installs [Sway Atomic packages](https://gitlab.com/fedora/ostree/ci-test/-/raw/main/packages/sway-atomic.yaml).
- [Base OS config](https://gitlab.com/fedora/ostree/ci-test/-/raw/main/common.yaml) adapted from Fedora.

# Repository Contents

## Containerfile

The [Containerfile](./Containerfile) defines the operations used to customize the image. This file is the entrypoint for the image build. For reference, please see the [Podman Documentation](https://docs.podman.io/en/latest/Introduction.html).

## build.sh

The [build.sh](./build_files/build.sh) file is called from the Containerfile. It is the best place to install new packages or make any other customization to your system. 

## build.yml

The [build.yml](./.github/workflows/build.yml) Github Actions workflow creates the OCI image and publishes it to the Github Container Registry (GHCR). 
