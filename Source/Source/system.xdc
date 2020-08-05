set_property PACKAGE_PIN C12 [get_ports {txd}]
set_property IOSTANDARD LVCMOS33 [get_ports {txd}]

set_property PACKAGE_PIN A12 [get_ports {rxd}]
set_property IOSTANDARD LVCMOS33 [get_ports {rxd}]

set_property PACKAGE_PIN J1 [get_ports {LEDmind}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDmind}]
set_property PULLDOWN true [get_ports {LEDmind}]

set_property PACKAGE_PIN A13 [get_ports {LED}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED}]
set_property PULLDOWN true [get_ports {LED}]

set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -add -name clk_pin -period 10 -waveform {0 3.3} [get_ports {clk}]