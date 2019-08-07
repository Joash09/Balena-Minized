# Learning Yocto Notes

* Might be cleaner to move layers into a layer folder
* Need to make sure that the Yocto BSP package for the Minized board is compatible with a Yocto version of BalenaOS release
	1. In meta-xilinx-contrib the version is sumo / thud
	2. meta-balena has a sumo / thud image. Therefore is compatible with Zynq
	3. I'm guessing I need to checkout that branch for both poky and openembedded
* Will be adding a conf folder to repo with sample bblayers.conf and layer.conf files
* More machine targets are added through BSPs
