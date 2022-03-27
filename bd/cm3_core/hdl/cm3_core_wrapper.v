//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sun Mar 27 15:36:06 2022
//Host        : LAPTOP-MNJIK6F2 running 64-bit major release  (build 9200)
//Command     : generate_target cm3_core_wrapper.bd
//Design      : cm3_core_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module cm3_core_wrapper
   (cm3_clk,
    cm3_gpio_in_tri_i,
    cm3_gpio_out_tri_o,
    cm3_resetn,
    cm3_swclk,
    cm3_swdio,
    cm3_uart_rxd,
    cm3_uart_txd);
  input cm3_clk;
  input [3:0]cm3_gpio_in_tri_i;
  output [3:0]cm3_gpio_out_tri_o;
  input cm3_resetn;
  input cm3_swclk;
  inout cm3_swdio;
  input cm3_uart_rxd;
  output cm3_uart_txd;

  wire cm3_clk;
  wire [3:0]cm3_gpio_in_tri_i;
  wire [3:0]cm3_gpio_out_tri_o;
  wire cm3_resetn;
  wire cm3_swclk;
  wire cm3_swdio;
  wire cm3_uart_rxd;
  wire cm3_uart_txd;

  cm3_core cm3_core_i
       (.cm3_clk(cm3_clk),
        .cm3_gpio_in_tri_i(cm3_gpio_in_tri_i),
        .cm3_gpio_out_tri_o(cm3_gpio_out_tri_o),
        .cm3_resetn(cm3_resetn),
        .cm3_swclk(cm3_swclk),
        .cm3_swdio(cm3_swdio),
        .cm3_uart_rxd(cm3_uart_rxd),
        .cm3_uart_txd(cm3_uart_txd));
endmodule
