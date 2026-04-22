#!/bin/sh
set -eu

# cpu microcode
# driver
# 2d acceleration under xorg (still needed?)
# vulkan support
# monitoring

paru -S --needed --noconfirm \
	amd_ucode \
	mesa lib32-mesa \
	xf86-video-amdgpu \
	vulkan-radeon lib32-vulkan-radeon \
	amdgpu_top
