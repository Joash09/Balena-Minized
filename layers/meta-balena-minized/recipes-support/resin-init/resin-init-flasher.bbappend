# Identiify internal storage. This should point to QSPI
INTERNAL_DEVICE_KERNEL_minized-zynq7 = "mtdblock3" 

# Find out what the bootloader configuration file is
INTERNAL_DEVICE_BOOTLOADER_CONFIG_minized-zynq7 = "uImage"

# Relative path to resin-boot partition
INTERNAL_DEVICE_BOOTLOADER_CONFIG_PATH_minized-zynq7 = "/EFI/BOOT/uImage"
