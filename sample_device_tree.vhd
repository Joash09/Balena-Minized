/dts-v1/;

/ {
	#address-cells = <0x1>;
	#size-cells = <0x1>;
	compatible = "xlnx,zynq-7000";

	cpus {
		#address-cells = <0x1>;
		#size-cells = <0x0>;

		cpu@0 {
			compatible = "arm,cortex-a9";
			device_type = "cpu";
			reg = <0x0>;
			clocks = <0x1 0x3>;
			clock-latency = <0x3e8>;
			cpu0-supply = <0x2>;
			operating-points = <0xa2c2a 0xf4240 0x51615 0xf4240>;
		};
	};

	fpga-full {
		compatible = "fpga-region";
		fpga-mgr = <0x3>;
		#address-cells = <0x1>;
		#size-cells = <0x1>;
		ranges;
	};

	pmu@f8891000 {
		compatible = "arm,cortex-a9-pmu";
		interrupts = <0x0 0x5 0x4 0x0 0x6 0x4>;
		interrupt-parent = <0x4>;
		reg = <0xf8891000 0x1000 0xf8893000 0x1000>;
	};

	fixedregulator {
		compatible = "regulator-fixed";
		regulator-name = "VCCPINT";
		regulator-min-microvolt = <0xf4240>;
		regulator-max-microvolt = <0xf4240>;
		regulator-boot-on;
		regulator-always-on;
		linux,phandle = <0x2>;
		phandle = <0x2>;
	};

	amba {
		u-boot,dm-pre-reloc;
		compatible = "simple-bus";
		#address-cells = <0x1>;
		#size-cells = <0x1>;
		interrupt-parent = <0x4>;
		ranges;

		adc@f8007100 {
			compatible = "xlnx,zynq-xadc-1.00.a";
			reg = <0xf8007100 0x20>;
			interrupts = <0x0 0x7 0x4>;
			interrupt-parent = <0x4>;
			clocks = <0x1 0xc>;
		};

		can@e0008000 {
			compatible = "xlnx,zynq-can-1.0";
			status = "disabled";
			clocks = <0x1 0x13 0x1 0x24>;
			clock-names = "can_clk", "pclk";
			reg = <0xe0008000 0x1000>;
			interrupts = <0x0 0x1c 0x4>;
			interrupt-parent = <0x4>;
			tx-fifo-depth = <0x40>;
			rx-fifo-depth = <0x40>;
		};

		can@e0009000 {
			compatible = "xlnx,zynq-can-1.0";
			status = "disabled";
			clocks = <0x1 0x14 0x1 0x25>;
			clock-names = "can_clk", "pclk";
			reg = <0xe0009000 0x1000>;
			interrupts = <0x0 0x33 0x4>;
			interrupt-parent = <0x4>;
			tx-fifo-depth = <0x40>;
			rx-fifo-depth = <0x40>;
		};

		gpio@e000a000 {
			compatible = "xlnx,zynq-gpio-1.0";
			#gpio-cells = <0x2>;
			clocks = <0x1 0x2a>;
			gpio-controller;
			interrupt-controller;
			#interrupt-cells = <0x2>;
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x14 0x4>;
			reg = <0xe000a000 0x1000>;
			emio-gpio-width = <0x4>;
			gpio-mask-high = <0x0>;
			gpio-mask-low = <0x5600>;
			linux,phandle = <0x7>;
			phandle = <0x7>;
		};

		i2c@e0004000 {
			compatible = "cdns,i2c-r1p10";
			status = "disabled";
			clocks = <0x1 0x26>;
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x19 0x4>;
			reg = <0xe0004000 0x1000>;
			#address-cells = <0x1>;
			#size-cells = <0x0>;
		};

		i2c@e0005000 {
			compatible = "cdns,i2c-r1p10";
			status = "disabled";
			clocks = <0x1 0x27>;
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x30 0x4>;
			reg = <0xe0005000 0x1000>;
			#address-cells = <0x1>;
			#size-cells = <0x0>;
		};

		interrupt-controller@f8f01000 {
			compatible = "arm,cortex-a9-gic";
			#interrupt-cells = <0x3>;
			interrupt-controller;
			reg = <0xf8f01000 0x1000 0xf8f00100 0x100>;
			num_cpus = <0x2>;
			num_interrupts = <0x60>;
			linux,phandle = <0x4>;
			phandle = <0x4>;
		};

		cache-controller@f8f02000 {
			compatible = "arm,pl310-cache";
			reg = <0xf8f02000 0x1000>;
			interrupts = <0x0 0x2 0x4>;
			arm,data-latency = <0x3 0x2 0x2>;
			arm,tag-latency = <0x2 0x2 0x2>;
			cache-unified;
			cache-level = <0x2>;
		};

		memory-controller@f8006000 {
			compatible = "xlnx,zynq-ddrc-a05";
			reg = <0xf8006000 0x1000>;
		};

		ocmc@f800c000 {
			compatible = "xlnx,zynq-ocmc-1.0";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x3 0x4>;
			reg = <0xf800c000 0x1000>;
		};

		serial@e0000000 {
			compatible = "xlnx,xuartps", "cdns,uart-r1p8";
			status = "okay";
			clocks = <0x1 0x17 0x1 0x28>;
			clock-names = "uart_clk", "pclk";
			reg = <0xe0000000 0x1000>;
			interrupts = <0x0 0x1b 0x4>;
			device_type = "serial";
			port-number = <0x4>;
		};

		serial@e0001000 {
			compatible = "xlnx,xuartps", "cdns,uart-r1p8";
			status = "okay";
			clocks = <0x1 0x18 0x1 0x29>;
			clock-names = "uart_clk", "pclk";
			reg = <0xe0001000 0x1000>;
			interrupts = <0x0 0x32 0x4>;
			device_type = "serial";
			port-number = <0x0>;
			current-speed = <0x1c200>;
		};

		spi@e0006000 {
			compatible = "xlnx,zynq-spi-r1p6";
			reg = <0xe0006000 0x1000>;
			status = "disabled";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x1a 0x4>;
			clocks = <0x1 0x19 0x1 0x22>;
			clock-names = "ref_clk", "pclk";
			#address-cells = <0x1>;
			#size-cells = <0x0>;
		};

		spi@e0007000 {
			compatible = "xlnx,zynq-spi-r1p6";
			reg = <0xe0007000 0x1000>;
			status = "disabled";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x31 0x4>;
			clocks = <0x1 0x1a 0x1 0x23>;
			clock-names = "ref_clk", "pclk";
			#address-cells = <0x1>;
			#size-cells = <0x0>;
		};

		spi@e000d000 {
			clock-names = "ref_clk", "pclk";
			clocks = <0x1 0xa 0x1 0x2b>;
			compatible = "xlnx,zynq-qspi-1.0";
			status = "okay";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x13 0x4>;
			reg = <0xe000d000 0x1000>;
			#address-cells = <0x1>;
			#size-cells = <0x0>;
			is-dual = <0x0>;
			num-cs = <0x1>;
			spi-rx-bus-width = <0x4>;
			spi-tx-bus-width = <0x4>;

			flash@0 {
				compatible = "micron,m25p80";
				reg = <0x0>;
				#address-cells = <0x1>;
				#size-cells = <0x1>;
				spi-max-frequency = <0x2faf080>;

				partition@0x00000000 {
					label = "boot";
					reg = <0x0 0xff0000>;
				};

				partition@0x00270000 {
					label = "kernel";
					reg = <0x270000 0xd80000>;
				};

				partition@0x00ff0000 {
					label = "bootenv";
					reg = <0xff0000 0x10000>;
				};

				partition@0x01000000 {
					label = "spare";
					reg = <0x1000000 0x0>;
				};
			};
		};

		memory-controller@e000e000 {
			#address-cells = <0x1>;
			#size-cells = <0x1>;
			status = "disabled";
			clock-names = "memclk", "aclk";
			clocks = <0x1 0xb 0x1 0x2c>;
			compatible = "arm,pl353-smc-r2p1";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x12 0x4>;
			ranges;
			reg = <0xe000e000 0x1000>;

			flash@e1000000 {
				status = "disabled";
				compatible = "arm,pl353-nand-r2p1";
				reg = <0xe1000000 0x1000000>;
				#address-cells = <0x1>;
				#size-cells = <0x1>;
			};

			flash@e2000000 {
				status = "disabled";
				compatible = "cfi-flash";
				reg = <0xe2000000 0x2000000>;
				#address-cells = <0x1>;
				#size-cells = <0x1>;
			};
		};

		ethernet@e000b000 {
			compatible = "cdns,zynq-gem", "cdns,gem";
			reg = <0xe000b000 0x1000>;
			status = "disabled";
			interrupts = <0x0 0x16 0x4>;
			clocks = <0x1 0x1e 0x1 0x1e 0x1 0xd>;
			clock-names = "pclk", "hclk", "tx_clk";
			#address-cells = <0x1>;
			#size-cells = <0x0>;
		};

		ethernet@e000c000 {
			compatible = "cdns,zynq-gem", "cdns,gem";
			reg = <0xe000c000 0x1000>;
			status = "disabled";
			interrupts = <0x0 0x2d 0x4>;
			clocks = <0x1 0x1f 0x1 0x1f 0x1 0xe>;
			clock-names = "pclk", "hclk", "tx_clk";
			#address-cells = <0x1>;
			#size-cells = <0x0>;
		};

		sdhci@e0100000 {
			compatible = "arasan,sdhci-8.9a";
			status = "okay";
			clock-names = "clk_xin", "clk_ahb";
			clocks = <0x1 0x15 0x1 0x20>;
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x18 0x4>;
			reg = <0xe0100000 0x1000>;
			xlnx,has-cd = <0x0>;
			xlnx,has-power = <0x0>;
			xlnx,has-wp = <0x0>;
			bus-width = <0x4>;
			non-removeable;
			broken-cd;
			vmmc-supply = <0x5>;

			brcmf@1 {
				status = "okay";
				reg = <0x1>;
				compatible = "brcm,bcm43430-fmac";
			};
		};

		sdhci@e0101000 {
			compatible = "arasan,sdhci-8.9a";
			status = "okay";
			clock-names = "clk_xin", "clk_ahb";
			clocks = <0x1 0x16 0x1 0x21>;
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x2f 0x4>;
			reg = <0xe0101000 0x1000>;
			xlnx,has-cd = <0x0>;
			xlnx,has-power = <0x0>;
			xlnx,has-wp = <0x0>;
			non-removeable;
			bus-width = <0x4>;

			mmccard@0 {
				reg = <0x0>;
				compatible = "mmc-card";
				broken-hpi;
			};
		};

		slcr@f8000000 {
			#address-cells = <0x1>;
			#size-cells = <0x1>;
			compatible = "xlnx,zynq-slcr", "syscon", "simple-mfd";
			reg = <0xf8000000 0x1000>;
			ranges;
			linux,phandle = <0x6>;
			phandle = <0x6>;

			clkc@100 {
				#clock-cells = <0x1>;
				compatible = "xlnx,ps7-clkc";
				fclk-enable = <0x3>;
				clock-output-names = "armpll", "ddrpll", "iopll", "cpu_6or4x", "cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x", "ddr3x", "dci", "lqspi", "smc", "pcap", "gem0", "gem1", "fclk0", "fclk1", "fclk2", "fclk3", "can0", "can1", "sdio0", "sdio1", "uart0", "uart1", "spi0", "spi1", "dma", "usb0_aper", "usb1_aper", "gem0_aper", "gem1_aper", "sdio0_aper", "sdio1_aper", "spi0_aper", "spi1_aper", "can0_aper", "can1_aper", "i2c0_aper", "i2c1_aper", "uart0_aper", "uart1_aper", "gpio_aper", "lqspi_aper", "smc_aper", "swdt", "dbg_trc", "dbg_apb";
				reg = <0x100 0x100>;
				ps-clk-frequency = <0x1fca055>;
				linux,phandle = <0x1>;
				phandle = <0x1>;
			};

			rstc@200 {
				compatible = "xlnx,zynq-reset";
				reg = <0x200 0x48>;
				#reset-cells = <0x1>;
				syscon = <0x6>;
			};

			pinctrl@700 {
				compatible = "xlnx,pinctrl-zynq";
				reg = <0x700 0x200>;
				syscon = <0x6>;
			};
		};

		dmac@f8003000 {
			compatible = "arm,pl330", "arm,primecell";
			reg = <0xf8003000 0x1000>;
			interrupt-parent = <0x4>;
			interrupt-names = "abort", "dma0", "dma1", "dma2", "dma3", "dma4", "dma5", "dma6", "dma7";
			interrupts = <0x0 0xd 0x4 0x0 0xe 0x4 0x0 0xf 0x4 0x0 0x10 0x4 0x0 0x11 0x4 0x0 0x28 0x4 0x0 0x29 0x4 0x0 0x2a 0x4 0x0 0x2b 0x4>;
			#dma-cells = <0x1>;
			#dma-channels = <0x8>;
			#dma-requests = <0x4>;
			clocks = <0x1 0x1b>;
			clock-names = "apb_pclk";
		};

		devcfg@f8007000 {
			compatible = "xlnx,zynq-devcfg-1.0";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x8 0x4>;
			reg = <0xf8007000 0x100>;
			clocks = <0x1 0xc 0x1 0xf 0x1 0x10 0x1 0x11 0x1 0x12>;
			clock-names = "ref_clk", "fclk0", "fclk1", "fclk2", "fclk3";
			syscon = <0x6>;
			linux,phandle = <0x3>;
			phandle = <0x3>;
		};

		efuse@f800d000 {
			compatible = "xlnx,zynq-efuse";
			reg = <0xf800d000 0x20>;
		};

		timer@f8f00200 {
			compatible = "arm,cortex-a9-global-timer";
			reg = <0xf8f00200 0x20>;
			interrupts = <0x1 0xb 0x301>;
			interrupt-parent = <0x4>;
			clocks = <0x1 0x4>;
		};

		timer@f8001000 {
			interrupt-parent = <0x4>;
			interrupts = <0x0 0xa 0x4 0x0 0xb 0x4 0x0 0xc 0x4>;
			compatible = "cdns,ttc";
			clocks = <0x1 0x6>;
			reg = <0xf8001000 0x1000>;
		};

		timer@f8002000 {
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x25 0x4 0x0 0x26 0x4 0x0 0x27 0x4>;
			compatible = "cdns,ttc";
			clocks = <0x1 0x6>;
			reg = <0xf8002000 0x1000>;
		};

		timer@f8f00600 {
			interrupt-parent = <0x4>;
			interrupts = <0x1 0xd 0x301>;
			compatible = "arm,cortex-a9-twd-timer";
			reg = <0xf8f00600 0x20>;
			clocks = <0x1 0x4>;
		};

		usb@e0002000 {
			compatible = "xlnx,zynq-usb-2.20a", "chipidea,usb2";
			status = "okay";
			clocks = <0x1 0x1c>;
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x15 0x4>;
			reg = <0xe0002000 0x1000>;
			phy_type = "ulpi";
			usb-reset = <0x7 0x7 0x0>;
			dr_mode = "otg";
			usb-phy = <0x8>;
		};

		usb@e0003000 {
			compatible = "xlnx,zynq-usb-2.20a", "chipidea,usb2";
			status = "disabled";
			clocks = <0x1 0x1d>;
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x2c 0x4>;
			reg = <0xe0003000 0x1000>;
			phy_type = "ulpi";
		};

		watchdog@f8005000 {
			clocks = <0x1 0x2d>;
			compatible = "cdns,wdt-r1p2";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x9 0x1>;
			reg = <0xf8005000 0x1000>;
			timeout-sec = <0xa>;
		};
	};

	amba_pl {
		#address-cells = <0x1>;
		#size-cells = <0x1>;
		compatible = "simple-bus";
		ranges;

		gpio@41200000 {
			#gpio-cells = <0x2>;
			compatible = "xlnx,xps-gpio-1.00.a";
			gpio-controller;
			reg = <0x41200000 0x10000>;
			xlnx,all-inputs = <0x0>;
			xlnx,all-inputs-2 = <0x0>;
			xlnx,all-outputs = <0x1>;
			xlnx,all-outputs-2 = <0x1>;
			xlnx,dout-default = <0x0>;
			xlnx,dout-default-2 = <0x0>;
			xlnx,gpio-width = <0x1>;
			xlnx,gpio2-width = <0x1>;
			xlnx,interrupt-present = <0x0>;
			xlnx,is-dual = <0x1>;
			xlnx,tri-default = <0xffffffff>;
			xlnx,tri-default-2 = <0xffffffff>;
		};

		gpio@41210000 {
			#gpio-cells = <0x2>;
			compatible = "xlnx,xps-gpio-1.00.a";
			gpio-controller;
			reg = <0x41210000 0x10000>;
			xlnx,all-inputs = <0x1>;
			xlnx,all-inputs-2 = <0x0>;
			xlnx,all-outputs = <0x0>;
			xlnx,all-outputs-2 = <0x0>;
			xlnx,dout-default = <0x0>;
			xlnx,dout-default-2 = <0x0>;
			xlnx,gpio-width = <0x1>;
			xlnx,gpio2-width = <0x20>;
			xlnx,interrupt-present = <0x0>;
			xlnx,is-dual = <0x0>;
			xlnx,tri-default = <0xffffffff>;
			xlnx,tri-default-2 = <0xffffffff>;
		};

		gpio@41220000 {
			#gpio-cells = <0x2>;
			compatible = "xlnx,xps-gpio-1.00.a";
			gpio-controller;
			reg = <0x41220000 0x10000>;
			xlnx,all-inputs = <0x0>;
			xlnx,all-inputs-2 = <0x0>;
			xlnx,all-outputs = <0x0>;
			xlnx,all-outputs-2 = <0x0>;
			xlnx,dout-default = <0xffffffff>;
			xlnx,dout-default-2 = <0x0>;
			xlnx,gpio-width = <0x2>;
			xlnx,gpio2-width = <0x20>;
			xlnx,interrupt-present = <0x0>;
			xlnx,is-dual = <0x0>;
			xlnx,tri-default = <0xffffffff>;
			xlnx,tri-default-2 = <0xffffffff>;
		};

		i2c@41600000 {
			#address-cells = <0x1>;
			#size-cells = <0x0>;
			clock-names = "ref_clk";
			clocks = <0x1 0xf>;
			compatible = "xlnx,xps-iic-2.00.a";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x1e 0x4>;
			reg = <0x41600000 0x10000>;
			status = "okay";

			lis2ds12@1d {
				compatible = "st,lis2ds12";
				reg = <0x1d>;
			};
		};

		serial@43c10000 {
			clock-frequency = <0x47868c0>;
			clock-names = "ref_clk";
			clocks = <0x1 0x0>;
			compatible = "xlnx,xps-uart16550-2.00.a", "ns16550a";
			current-speed = <0x1c200>;
			device_type = "serial";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x1f 0x4>;
			port-number = <0x1>;
			reg = <0x43c10000 0x10000>;
			reg-offset = <0x1000>;
			reg-shift = <0x2>;
			xlnx,external-xin-clk-hz = <0x47868c0>;
			xlnx,external-xin-clk-hz-d = <0x4b>;
			xlnx,has-external-rclk = <0x0>;
			xlnx,has-external-xin = <0x1>;
			xlnx,is-a-16550 = <0x1>;
			xlnx,s-axi-aclk-freq-hz-d = "150.0";
			xlnx,use-modem-ports = <0x1>;
			xlnx,use-user-ports = <0x1>;
		};

		serial@43c20000 {
			clock-frequency = <0x47868c0>;
			clock-names = "ref_clk";
			clocks = <0x1 0x0>;
			compatible = "xlnx,xps-uart16550-2.00.a", "ns16550a";
			current-speed = <0x1c200>;
			device_type = "serial";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x20 0x4>;
			port-number = <0x2>;
			reg = <0x43c20000 0x10000>;
			reg-offset = <0x1000>;
			reg-shift = <0x2>;
			xlnx,external-xin-clk-hz = <0x47868c0>;
			xlnx,external-xin-clk-hz-d = <0x4b>;
			xlnx,has-external-rclk = <0x0>;
			xlnx,has-external-xin = <0x1>;
			xlnx,is-a-16550 = <0x1>;
			xlnx,s-axi-aclk-freq-hz-d = "150.0";
			xlnx,use-modem-ports = <0x1>;
			xlnx,use-user-ports = <0x1>;
		};

		serial@43c00000 {
			clock-frequency = <0x47868c0>;
			clock-names = "ref_clk";
			clocks = <0x1 0x0>;
			compatible = "xlnx,xps-uart16550-2.00.a", "ns16550a";
			current-speed = <0x1c200>;
			device_type = "serial";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x1d 0x4>;
			port-number = <0x2>;
			reg = <0x43c00000 0x10000>;
			reg-offset = <0x1000>;
			reg-shift = <0x2>;
			xlnx,external-xin-clk-hz = <0x47868c0>;
			xlnx,external-xin-clk-hz-d = <0x4b>;
			xlnx,has-external-rclk = <0x0>;
			xlnx,has-external-xin = <0x1>;
			xlnx,is-a-16550 = <0x1>;
			xlnx,s-axi-aclk-freq-hz-d = "150.0";
			xlnx,use-modem-ports = <0x1>;
			xlnx,use-user-ports = <0x1>;
			status = "okay";
		};
	};

	chosen {
		bootargs = "console=ttyPS0,115200 earlyprintk root=/dev/mmcblk1p2 rw rootwait";
		stdout-path = "serial0:115200n8";
	};

	aliases {
		serial0 = "/amba/serial@e0001000";
		serial1 = "/amba/serial@e0000000";
		serial2 = "/amba_pl/serial@43c00000";
		serial3 = "/amba/serial@e0000000";
		serial4 = "/amba_pl/serial@43c10000";
		spi0 = "/amba/spi@e000d000";
	};

	memory {
		device_type = "memory";
		reg = <0x0 0x20000000>;
	};

	wlreg-on {
		compatible = "regulator-fixed";
		regulator-name = "wlreg_on";
		enable-active-high;
		gpio = <0x7 0x38 0x0>;
		regulator-min-microvolt = <0x325aa0>;
		regulator-max-microvolt = <0x325aa0>;
		startup-delay-us = <0x64>;
		linux,phandle = <0x5>;
		phandle = <0x5>;
	};

	usb_phy@0 {
		compatible = "ulpi-phy";
		#phy-cells = <0x0>;
		reg = <0xe0002000 0x1000>;
		view-port = <0x170>;
		drv-vbus;
		linux,phandle = <0x8>;
		phandle = <0x8>;
	};
};
