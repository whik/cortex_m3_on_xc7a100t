// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Mar 20 17:03:20 2022
// Host        : LAPTOP-MNJIK6F2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cm3_core_swdio_tri_buffer_0_0_stub.v
// Design      : cm3_core_swdio_tri_buffer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "swdio_tri_buffer,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(swd_o, swd_oe, swd_i, swd_io)
/* synthesis syn_black_box black_box_pad_pin="swd_o,swd_oe,swd_i,swd_io" */;
  input swd_o;
  input swd_oe;
  output swd_i;
  inout swd_io;
endmodule
