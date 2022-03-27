// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "swdio_tri_buffer,Vivado 2018.3" *)
module cm3_core_swdio_tri_buffer_0_0(swd_o, swd_oe, swd_i, swd_io);
  input swd_o;
  input swd_oe;
  output swd_i;
  inout swd_io;
endmodule
