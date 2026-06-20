# ublue-sway

Custom [bootc](https://github.com/bootc-dev/bootc) image. This customizes the Universal Blue Base image adding Fedora Sway Atomic packages and layering Libvirt.

- Universal Blue Base: `ghcr.io/ublue-os/base-main:latest`
- Sway: `quay.io/repository/fedora-ostree-desktops/sway-atomic:44`
- Fedora: `quay.io/fedora/fedora-bootc:44`

# Repository Contents

## Containerfile

The [Containerfile](./Containerfile) defines the operations used to customize the selected image.This file is the entrypoint for your image build, and works exactly like a regular podman Containerfile. For reference, please see the [Podman Documentation](https://docs.podman.io/en/latest/Introduction.html).

## build.sh

The [build.sh](./build_files/build.sh) file is called from your Containerfile. It is the best place to install new packages or make any other customization to your system. There are customization examples contained within it for your perusal.

## build.yml

The [build.yml](./.github/workflows/build.yml) Github Actions workflow creates your custom OCI image and publishes it to the Github Container Registry (GHCR). By default, the image name will match the Github repository name.
