// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Mar 20 13:47:24 2022
// Host        : LAPTOP-MNJIK6F2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ip/cm3_core_util_vector_logic_0_0/cm3_core_util_vector_logic_0_0_stub.v
// Design      : cm3_core_util_vector_logic_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "util_vector_logic_v2_0_1_util_vector_logic,Vivado 2018.3" *)
module cm3_core_util_vector_logic_0_0(Op1, Res)
/* synthesis syn_black_box black_box_pad_pin="Op1[0:0],Res[0:0]" */;
  input [0:0]Op1;
  output [0:0]Res;
endmodule
