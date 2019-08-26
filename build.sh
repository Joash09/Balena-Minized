#!/bin/bash

echo "Begin build BalenaOS for Xilinx Minized board"

source ./layers/poky/oe-init-build-env build

# This could all be replaced with a sample bblayes.conf file
bitbake-layers add-layer ../layers/meta-openembedded/meta-oe/
bitbake-layers add-layer ../layers/meta-openembedded/meta-python/
bitbake-layers add-layer ../layers/meta-openembedded/meta-perl/
bitbake-layers add-layer ../layers/meta-xilinx/meta-xilinx-bsp/
bitbake-layers add-layer ../layers/meta-xilinx/meta-xilinx-contrib/

bitbake core-image-minimal
