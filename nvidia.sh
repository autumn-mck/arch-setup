#!/bin/sh
set -e

packages="nvidia-open"
pacman -S --needed --noconfirm $packages
