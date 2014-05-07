create_clock -name S_AXI_ACLK -period 10.0 [get_ports S_AXI_ACLK]
create_clock -name PHY_tx_clk -period 40 -waveform {0 14} [get_ports PHY_tx_clk]
create_clock -name PHY_rx_clk -period 40 -waveform {0 14} [get_ports PHY_rx_clk]
set ethernet_input {Ethernet_Lite_RXD* Ethernet_Lite_CRS Ethernet_Lite_RX_DV Ethernet_Lite_COL Ethernet_Lite_RX_ER}
set ethernet_output {Ethernet_Lite_TXD* Ethernet_Lite_TX_EN}
set_input_delay -max 34 -clock PHY_rx_clk $ethernet_input
set_output_delay -max 10 -clock PHY_tx_clk $ethernet_output
set_clock_uncertainty -setup 6 [get_clocks {PHY_tx_clk PHY_rx_clk}]
set_false_path -from [get_clocks -of [get_ports S_AXI_ACLK]] -to PHY_tx_clk
set_false_path -from PHY_tx_clk -to [get_clocks -of [get_ports S_AXI_ACLK]]
set_false_path -from [get_clocks -of [get_ports S_AXI_ACLK]] -to PHY_rx_clk
set_false_path -from PHY_rx_clk -to [get_clocks -of [get_ports S_AXI_ACLK]]
