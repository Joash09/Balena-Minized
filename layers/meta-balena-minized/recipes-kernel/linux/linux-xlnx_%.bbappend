FILESEXTRAPATHS_prepend := "${THISDIR}/linux-xlnx:"

SRC_URI_append_minized-zynq7 = " file://gpio.patch"
