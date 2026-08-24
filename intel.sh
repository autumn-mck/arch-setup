#!/bin/sh
set -eu

yay -S --needed --noconfirm \
	intel-ucode \
	mesa \
	vulkan-intel
