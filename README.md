# Balena-Minized

Repository tracking all my changes to recipes and appends to support BalenaOS on Avnet Minized board

## Instructions

1. Run git submodule init to clone all required layers
2. Run git submodule update

Finally run

```bash
chmod +x build.sh
. ./build.sh
```

Image files are located in the build/tmp/deploy/images folder.

Using the SDK build the boot image.

Flash the boot image to QSPI using the program flash tool in the SDK.

Copy the other necessary files to the eMMC using a USB.
