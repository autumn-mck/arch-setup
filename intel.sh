#!/bin/sh
set -eu

# cpu microcode
# driver
# vulkan support

yay -S --needed --noconfirm \
	intel-ucode \
	mesa lib32-mesa \
	vulkan-intel lib32-vulkan-intel \
	intel-media-driver vpl-gpu-rt \
	libva-utils
