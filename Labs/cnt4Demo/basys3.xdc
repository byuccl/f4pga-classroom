###################################################################
#
# basys3_220.xdc
#
# This is a master constraints file for laboratory assignments used
# at BYU for ECEN 220. 
#
# You should uncomment those lines that define ports that you used
# in your top-level design. You should also change the name of the 
# port in the .xdc file to match your corresponding top-level port.
#
###################################################################

# # Clock (uncomment both lines)
set_property -dict { PACKAGE_PIN W5    IOSTANDARD LVCMOS33 } [get_ports { clk }]; 
create_clock -period 10.00 [get_ports {clk}];

# # Buttons 
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { clr }]; 
# set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { btnu }]; 
# set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports { btnl }]; 
# set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports { btnr }]; 
# set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { btnd }]; 

# # Switches
# set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]; 
# set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]; 
# set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]; 
# set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS33 } [get_ports { sw[3] }]; 
# set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports { sw[4] }]; 
# set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { sw[5] }]; 
# set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { sw[6] }]; 
# set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { sw[7] }]; 
# set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports { sw[8] }]; 
# set_property -dict { PACKAGE_PIN T3    IOSTANDARD LVCMOS33 } [get_ports { sw[9] }]; 
# set_property -dict { PACKAGE_PIN T2    IOSTANDARD LVCMOS33 } [get_ports { sw[10] }]; 
# set_property -dict { PACKAGE_PIN R3    IOSTANDARD LVCMOS33 } [get_ports { sw[11] }]; 
# set_property -dict { PACKAGE_PIN W2    IOSTANDARD LVCMOS33 } [get_ports { sw[12] }]; 
# set_property -dict { PACKAGE_PIN U1    IOSTANDARD LVCMOS33 } [get_ports { sw[13] }]; 
# set_property -dict { PACKAGE_PIN T1    IOSTANDARD LVCMOS33 } [get_ports { sw[14] }]; 
# set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports { sw[15] }]; 

# # LEDs
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; 
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; 
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { led[2] }]; 
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]; 
# set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { led[4] }]; 
# set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports { led[5] }]; 
# set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { led[6] }]; 
# set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { led[7] }]; 
# set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { led[8] }]; 
# set_property -dict { PACKAGE_PIN V3    IOSTANDARD LVCMOS33 } [get_ports { led[9] }]; 
# set_property -dict { PACKAGE_PIN W3    IOSTANDARD LVCMOS33 } [get_ports { led[10] }]; 
# set_property -dict { PACKAGE_PIN U3    IOSTANDARD LVCMOS33 } [get_ports { led[11] }]; 
# set_property -dict { PACKAGE_PIN P3    IOSTANDARD LVCMOS33 } [get_ports { led[12] }]; 
# set_property -dict { PACKAGE_PIN N3    IOSTANDARD LVCMOS33 } [get_ports { led[13] }]; 
# set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports { led[14] }]; 
# set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports { led[15] }]; 

# # Seven Segment Display
# set_property -dict { PACKAGE_PIN W7    IOSTANDARD LVCMOS33 } [get_ports { segment[0] }]; 
# set_property -dict { PACKAGE_PIN W6    IOSTANDARD LVCMOS33 } [get_ports { segment[1] }]; 
# set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS33 } [get_ports { segment[2] }]; 
# set_property -dict { PACKAGE_PIN V8    IOSTANDARD LVCMOS33 } [get_ports { segment[3] }]; 
# set_property -dict { PACKAGE_PIN U5    IOSTANDARD LVCMOS33 } [get_ports { segment[4] }]; 
# set_property -dict { PACKAGE_PIN V5    IOSTANDARD LVCMOS33 } [get_ports { segment[5] }]; 
# set_property -dict { PACKAGE_PIN U7    IOSTANDARD LVCMOS33 } [get_ports { segment[6] }]; 
# set_property -dict { PACKAGE_PIN V7    IOSTANDARD LVCMOS33 } [get_ports { segment[7] }]; 
# set_property -dict { PACKAGE_PIN U2    IOSTANDARD LVCMOS33 } [get_ports { anode[0] }]; 
# set_property -dict { PACKAGE_PIN U4    IOSTANDARD LVCMOS33 } [get_ports { anode[1] }]; 
# set_property -dict { PACKAGE_PIN V4    IOSTANDARD LVCMOS33 } [get_ports { anode[2] }]; 
# set_property -dict { PACKAGE_PIN W4    IOSTANDARD LVCMOS33 } [get_ports { anode[3] }]; 

# # UART
# set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { rx_in }];  
# set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { tx_out }]; 
# set_property -dict { PACKAGE_PIN J1    IOSTANDARD LVCMOS33 } [get_ports { tx_debug }]; # J1 connects to pin 1 of the JA pin hub. This pin will output
                                                                                         # 3.3V if working correctly.
##VGA Connector
# set_property -dict { PACKAGE_PIN G19   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[0] }]; 
# set_property -dict { PACKAGE_PIN H19   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[1] }]; 
# set_property -dict { PACKAGE_PIN J19   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[2] }]; 
# set_property -dict { PACKAGE_PIN N19   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[3] }]; 

# set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[0] }]; 
# set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[1] }]; 
# set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[2] }]; 
# set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[3] }]; 

# set_property -dict { PACKAGE_PIN N18   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[0] }]; 
# set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[1] }]; 
# set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[2] }]; 
# set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[3] }]; 

# set_property -dict { PACKAGE_PIN P19   IOSTANDARD LVCMOS33 } [get_ports { VGA_HS }]; 
# set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { VGA_VS }]; 
