#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# RPM Fusion repos, needed for full Intel media driver
dnf5 install -y \
  "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
  "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# Disable RPM Fusion by default in the final image
dnf5 config-manager setopt 'rpmfusion-*.enabled=0'

# Fedora Sway Atomic package set
dnf5 install -y \
  NetworkManager-l2tp-gnome \
  NetworkManager-libreswan-gnome \
  NetworkManager-openconnect-gnome \
  NetworkManager-openvpn-gnome \
  NetworkManager-sstp-gnome \
  NetworkManager-vpnc-gnome \
  Thunar blueman bolt dunst foot fprintd-pam gnome-keyring-pam \
  grim gvfs gvfs-smb imv kanshi lxqt-policykit \
  mesa-dri-drivers mesa-vulkan-drivers network-manager-applet \
  pavucontrol pinentry-gnome3 playerctl plymouth-system-theme \
  polkit pulseaudio-utils sddm sddm-wayland-sway slurp \
  sway sway-config-fedora swaybg swayidle swaylock \
  system-config-printer thunar-archive-plugin tuned-ppd \
  tuned-switcher waybar wev wl-clipboard wlr-randr wlsunset \
  xarchiver xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
  xorg-x11-server-Xwayland

## Remove things I don't want
dnf5 remove -y \
  nano nano-default-editor \

# Packages + host codec/media bits
dnf5 install -y \
  ansible python3-dnspython \
  bat inotify-tools \
  libva-utils \
  libvirt qemu-kvm virt-manager \
  vim vim-default-editor \
  wireguard-tools \
  openh264 mozilla-openh264 \

## Remove things I don't need
dnf5 remove -y \
  noopenh264 || true

## Install only these RPM Fusion variants
dnf5 install -y --enablerepo='rpmfusion-*' \
  intel-media-driver

systemctl enable sddm.service
systemctl enable libvirtd.service
systemctl enable podman.socket
