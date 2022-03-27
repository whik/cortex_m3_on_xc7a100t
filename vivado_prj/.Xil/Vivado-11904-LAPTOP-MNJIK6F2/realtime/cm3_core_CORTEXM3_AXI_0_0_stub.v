// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "CortexM3DbgAXI,Vivado 2018.3" *)
module cm3_core_CORTEXM3_AXI_0_0(SYSRESETREQ, DBGRESTARTED, LOCKUP, HALTED, 
  JTAGNSW, SWDO, SWDOEN, SWV, HCLK, SYSRESETn, IRQ, NMI, CFGITCMEN, DBGRESETn, DBGRESTART, EDBGRQ, STCLK, 
  SWCLKTCK, SWDITMS, AWADDRS, AWLENS, AWSIZES, AWBURSTS, AWLOCKS, AWCACHES, AWPROTS, AWUSERS, AWVALIDS, 
  AWREADYS, WSTRBS, WLASTS, WVALIDS, WREADYS, HWDATAS, BRESPS, BVALIDS, BREADYS, ARADDRS, ARLENS, 
  ARSIZES, ARBURSTS, ARLOCKS, ARCACHES, ARPROTS, ARUSERS, ARVALIDS, ARREADYS, RRESPS, RLASTS, RVALIDS, 
  RREADYS, HRDATAS, AWADDRC, AWLENC, AWSIZEC, AWBURSTC, AWLOCKC, AWCACHEC, AWPROTC, AWUSERC, AWVALIDC, 
  AWREADYC, WSTRBC, WLASTC, WVALIDC, WREADYC, HWDATAC, BRESPC, BVALIDC, BREADYC, ARADDRC, ARLENC, 
  ARSIZEC, ARBURSTC, ARLOCKC, ARCACHEC, ARPROTC, ARUSERC, ARVALIDC, ARREADYC, RRESPC, RLASTC, RVALIDC, 
  RREADYC, HRDATAC);
  output SYSRESETREQ;
  output DBGRESTARTED;
  output LOCKUP;
  output HALTED;
  output JTAGNSW;
  output SWDO;
  output SWDOEN;
  output SWV;
  input HCLK;
  input SYSRESETn;
  input [0:0]IRQ;
  input NMI;
  input [1:0]CFGITCMEN;
  input DBGRESETn;
  input DBGRESTART;
  input EDBGRQ;
  input STCLK;
  input SWCLKTCK;
  input SWDITMS;
  output [31:0]AWADDRS;
  output [3:0]AWLENS;
  output [2:0]AWSIZES;
  output [1:0]AWBURSTS;
  output [1:0]AWLOCKS;
  output [3:0]AWCACHES;
  output [2:0]AWPROTS;
  output [0:0]AWUSERS;
  output AWVALIDS;
  input AWREADYS;
  output [3:0]WSTRBS;
  output WLASTS;
  output WVALIDS;
  input WREADYS;
  output [31:0]HWDATAS;
  input [1:0]BRESPS;
  input BVALIDS;
  output BREADYS;
  output [31:0]ARADDRS;
  output [3:0]ARLENS;
  output [2:0]ARSIZES;
  output [1:0]ARBURSTS;
  output [1:0]ARLOCKS;
  output [3:0]ARCACHES;
  output [2:0]ARPROTS;
  output [0:0]ARUSERS;
  output ARVALIDS;
  input ARREADYS;
  input [1:0]RRESPS;
  input RLASTS;
  input RVALIDS;
  output RREADYS;
  input [31:0]HRDATAS;
  output [31:0]AWADDRC;
  output [3:0]AWLENC;
  output [2:0]AWSIZEC;
  output [1:0]AWBURSTC;
  output [1:0]AWLOCKC;
  output [3:0]AWCACHEC;
  output [2:0]AWPROTC;
  output [0:0]AWUSERC;
  output AWVALIDC;
  input AWREADYC;
  output [3:0]WSTRBC;
  output WLASTC;
  output WVALIDC;
  input WREADYC;
  output [31:0]HWDATAC;
  input [1:0]BRESPC;
  input BVALIDC;
  output BREADYC;
  output [31:0]ARADDRC;
  output [3:0]ARLENC;
  output [2:0]ARSIZEC;
  output [1:0]ARBURSTC;
  output [1:0]ARLOCKC;
  output [3:0]ARCACHEC;
  output [2:0]ARPROTC;
  output [0:0]ARUSERC;
  output ARVALIDC;
  input ARREADYC;
  input [1:0]RRESPC;
  input RLASTC;
  input RVALIDC;
  output RREADYC;
  input [31:0]HRDATAC;
endmodule
