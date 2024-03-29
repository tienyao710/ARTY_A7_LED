set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports CLK_100Mhz]
set_property -dict {PACKAGE_PIN D9 IOSTANDARD LVCMOS33} [get_ports RESET_N]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS33} [get_ports LED0_B]
set_property -dict {PACKAGE_PIN F6 IOSTANDARD LVCMOS33} [get_ports LED0_G]
set_property -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS33} [get_ports LED0_R]
set_property -dict {PACKAGE_PIN G4 IOSTANDARD LVCMOS33} [get_ports LED1_B]
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports LED1_G]
set_property -dict {PACKAGE_PIN G3 IOSTANDARD LVCMOS33} [get_ports LED1_R]
set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports LED2_B]
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports LED2_G]
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports LED2_R]
set_property -dict {PACKAGE_PIN K2 IOSTANDARD LVCMOS33} [get_ports LED3_B]
set_property -dict {PACKAGE_PIN H6 IOSTANDARD LVCMOS33} [get_ports LED3_G]
set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS33} [get_ports LED3_R]
set_property -dict {PACKAGE_PIN H5 IOSTANDARD LVCMOS33} [get_ports LED4]
set_property -dict {PACKAGE_PIN J5 IOSTANDARD LVCMOS33} [get_ports LED5]
set_property -dict {PACKAGE_PIN T9 IOSTANDARD LVCMOS33} [get_ports LED6]
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports LED7]

create_clock -period 5.000 -name CLK_100Mhz -waveform {0.000 2.500}
