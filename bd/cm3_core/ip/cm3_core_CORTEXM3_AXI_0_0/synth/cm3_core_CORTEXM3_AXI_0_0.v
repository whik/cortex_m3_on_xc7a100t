// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: Arm.com:CortexM:CORTEXM3_AXI:1.1
// IP Revision: 38

(* X_CORE_INFO = "CortexM3DbgAXI,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "cm3_core_CORTEXM3_AXI_0_0,CortexM3DbgAXI,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module cm3_core_CORTEXM3_AXI_0_0 (
  SYSRESETREQ,
  DBGRESTARTED,
  LOCKUP,
  HALTED,
  JTAGNSW,
  SWDO,
  SWDOEN,
  SWV,
  HCLK,
  SYSRESETn,
  IRQ,
  NMI,
  CFGITCMEN,
  DBGRESETn,
  DBGRESTART,
  EDBGRQ,
  STCLK,
  SWCLKTCK,
  SWDITMS,
  AWADDRS,
  AWLENS,
  AWSIZES,
  AWBURSTS,
  AWLOCKS,
  AWCACHES,
  AWPROTS,
  AWUSERS,
  AWVALIDS,
  AWREADYS,
  WSTRBS,
  WLASTS,
  WVALIDS,
  WREADYS,
  HWDATAS,
  BRESPS,
  BVALIDS,
  BREADYS,
  ARADDRS,
  ARLENS,
  ARSIZES,
  ARBURSTS,
  ARLOCKS,
  ARCACHES,
  ARPROTS,
  ARUSERS,
  ARVALIDS,
  ARREADYS,
  RRESPS,
  RLASTS,
  RVALIDS,
  RREADYS,
  HRDATAS,
  AWADDRC,
  AWLENC,
  AWSIZEC,
  AWBURSTC,
  AWLOCKC,
  AWCACHEC,
  AWPROTC,
  AWUSERC,
  AWVALIDC,
  AWREADYC,
  WSTRBC,
  WLASTC,
  WVALIDC,
  WREADYC,
  HWDATAC,
  BRESPC,
  BVALIDC,
  BREADYC,
  ARADDRC,
  ARLENC,
  ARSIZEC,
  ARBURSTC,
  ARLOCKC,
  ARCACHEC,
  ARPROTC,
  ARUSERC,
  ARVALIDC,
  ARREADYC,
  RRESPC,
  RLASTC,
  RVALIDC,
  RREADYC,
  HRDATAC
);

output wire SYSRESETREQ;
output wire DBGRESTARTED;
output wire LOCKUP;
output wire HALTED;
output wire JTAGNSW;
output wire SWDO;
output wire SWDOEN;
output wire SWV;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME HCLK, ASSOCIATED_BUSIF CM3_SYS_AXI3:CM3_CODE_AXI3, ASSOCIATED_RESET SYSRESETn:NMI, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 HCLK CLK" *)
input wire HCLK;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SYSRESETn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 SYSRESETn RST" *)
input wire SYSRESETn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME IRQ, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 IRQ INTERRUPT" *)
input wire [0 : 0] IRQ;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME NMI, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 NMI INTERRUPT" *)
input wire NMI;
input wire [1 : 0] CFGITCMEN;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DBGRESETn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 DBGRESETn RST" *)
input wire DBGRESETn;
input wire DBGRESTART;
input wire EDBGRQ;
input wire STCLK;// System tick enable
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SWCLKTCK, ASSOCIATED_RESET nTRST, PHASE 0.000, CLK_DOMAIN cm3_core_SWCLKTCK_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 SWCLKTCK CLK" *)
input wire SWCLKTCK;
input wire SWDITMS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 AWADDR" *)
output wire [31 : 0] AWADDRS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 AWLEN" *)
output wire [3 : 0] AWLENS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 AWSIZE" *)
output wire [2 : 0] AWSIZES;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 AWBURST" *)
output wire [1 : 0] AWBURSTS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 AWLOCK" *)
output wire [1 : 0] AWLOCKS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 AWCACHE" *)
output wire [3 : 0] AWCACHES;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 AWPROT" *)
output wire [2 : 0] AWPROTS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 AWUSER" *)
output wire [0 : 0] AWUSERS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 AWVALID" *)
output wire AWVALIDS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 AWREADY" *)
input wire AWREADYS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 WSTRB" *)
output wire [3 : 0] WSTRBS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 WLAST" *)
output wire WLASTS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 WVALID" *)
output wire WVALIDS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 WREADY" *)
input wire WREADYS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 WDATA" *)
output wire [31 : 0] HWDATAS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 BRESP" *)
input wire [1 : 0] BRESPS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 BVALID" *)
input wire BVALIDS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 BREADY" *)
output wire BREADYS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 ARADDR" *)
output wire [31 : 0] ARADDRS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 ARLEN" *)
output wire [3 : 0] ARLENS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 ARSIZE" *)
output wire [2 : 0] ARSIZES;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 ARBURST" *)
output wire [1 : 0] ARBURSTS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 ARLOCK" *)
output wire [1 : 0] ARLOCKS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 ARCACHE" *)
output wire [3 : 0] ARCACHES;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 ARPROT" *)
output wire [2 : 0] ARPROTS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 ARUSER" *)
output wire [0 : 0] ARUSERS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 ARVALID" *)
output wire ARVALIDS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 ARREADY" *)
input wire ARREADYS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 RRESP" *)
input wire [1 : 0] RRESPS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 RLAST" *)
input wire RLASTS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 RVALID" *)
input wire RVALIDS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 RREADY" *)
output wire RREADYS;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CM3_SYS_AXI3, DATA_WIDTH 32, PROTOCOL AXI3, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_SYS_AXI3 RDATA" *)
input wire [31 : 0] HRDATAS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 AWADDR" *)
output wire [31 : 0] AWADDRC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 AWLEN" *)
output wire [3 : 0] AWLENC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 AWSIZE" *)
output wire [2 : 0] AWSIZEC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 AWBURST" *)
output wire [1 : 0] AWBURSTC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 AWLOCK" *)
output wire [1 : 0] AWLOCKC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 AWCACHE" *)
output wire [3 : 0] AWCACHEC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 AWPROT" *)
output wire [2 : 0] AWPROTC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 AWUSER" *)
output wire [0 : 0] AWUSERC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 AWVALID" *)
output wire AWVALIDC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 AWREADY" *)
input wire AWREADYC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 WSTRB" *)
output wire [3 : 0] WSTRBC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 WLAST" *)
output wire WLASTC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 WVALID" *)
output wire WVALIDC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 WREADY" *)
input wire WREADYC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 WDATA" *)
output wire [31 : 0] HWDATAC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 BRESP" *)
input wire [1 : 0] BRESPC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 BVALID" *)
input wire BVALIDC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 BREADY" *)
output wire BREADYC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 ARADDR" *)
output wire [31 : 0] ARADDRC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 ARLEN" *)
output wire [3 : 0] ARLENC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 ARSIZE" *)
output wire [2 : 0] ARSIZEC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 ARBURST" *)
output wire [1 : 0] ARBURSTC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 ARLOCK" *)
output wire [1 : 0] ARLOCKC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 ARCACHE" *)
output wire [3 : 0] ARCACHEC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 ARPROT" *)
output wire [2 : 0] ARPROTC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 ARUSER" *)
output wire [0 : 0] ARUSERC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 ARVALID" *)
output wire ARVALIDC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 ARREADY" *)
input wire ARREADYC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 RRESP" *)
input wire [1 : 0] RRESPC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 RLAST" *)
input wire RLASTC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 RVALID" *)
input wire RVALIDC;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 RREADY" *)
output wire RREADYC;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CM3_CODE_AXI3, DATA_WIDTH 32, PROTOCOL AXI3, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CM3_CODE_AXI3 RDATA" *)
input wire [31 : 0] HRDATAC;

  CortexM3DbgAXI #(
    .NUM_IRQ(1),
    .JTAG_PRESENT(1'B0),
    .ITCM_SIZE(4'B0111),
    .DTCM_SIZE(4'B0111),
    .ITCM_INIT_RAM(1'B0),
    .DTCM_INIT_RAM(1'B0),
    .ITCM_INIT_FILE(""),
    .DTCM_INIT_FILE(""),
    .AUSER_WIDTH(1),
    .AUSER_MAX(0),
    .STRB_WIDTH(4),
    .STRB_MAX(3),
    .MPU_PRESENT(1'B1),
    .LVL_WIDTH(3),
    .TRACE_LVL(0),
    .DEBUG_LVL(3),
    .WIC_PRESENT(1'B0),
    .WIC_LINES(3),
    .BB_PRESENT(1'B1)
  ) inst (
    .SYSRESETREQ(SYSRESETREQ),
    .DBGRESTARTED(DBGRESTARTED),
    .LOCKUP(LOCKUP),
    .HALTED(HALTED),
    .WAKEUP(),
    .WICENACK(),
    .JTAGNSW(JTAGNSW),
    .JTAGTOP(),
    .SWDO(SWDO),
    .SWDOEN(SWDOEN),
    .TDO(),
    .nTDOEN(),
    .TRCENA(),
    .TRACECLK(),
    .TRACEDATA(),
    .SWV(SWV),
    .HCLK(HCLK),
    .SYSRESETn(SYSRESETn),
    .IRQ(IRQ),
    .NMI(NMI),
    .CFGITCMEN(CFGITCMEN),
    .DBGRESETn(DBGRESETn),
    .DBGRESTART(DBGRESTART),
    .EDBGRQ(EDBGRQ),
    .STCLK(STCLK),// System tick enable
    .WICENREQ(1'B0),
    .SWCLKTCK(SWCLKTCK),
    .SWDITMS(SWDITMS),
    .nTRST(1'B1),
    .TDI(1'B0),
    .AWADDRS(AWADDRS),
    .AWLENS(AWLENS),
    .AWSIZES(AWSIZES),
    .AWBURSTS(AWBURSTS),
    .AWLOCKS(AWLOCKS),
    .AWCACHES(AWCACHES),
    .AWPROTS(AWPROTS),
    .AWUSERS(AWUSERS),
    .AWVALIDS(AWVALIDS),
    .AWREADYS(AWREADYS),
    .WSTRBS(WSTRBS),
    .WLASTS(WLASTS),
    .WVALIDS(WVALIDS),
    .WREADYS(WREADYS),
    .HWDATAS(HWDATAS),
    .BRESPS(BRESPS),
    .BVALIDS(BVALIDS),
    .BREADYS(BREADYS),
    .ARADDRS(ARADDRS),
    .ARLENS(ARLENS),
    .ARSIZES(ARSIZES),
    .ARBURSTS(ARBURSTS),
    .ARLOCKS(ARLOCKS),
    .ARCACHES(ARCACHES),
    .ARPROTS(ARPROTS),
    .ARUSERS(ARUSERS),
    .ARVALIDS(ARVALIDS),
    .ARREADYS(ARREADYS),
    .RRESPS(RRESPS),
    .RLASTS(RLASTS),
    .RVALIDS(RVALIDS),
    .RREADYS(RREADYS),
    .HRDATAS(HRDATAS),
    .AWADDRC(AWADDRC),
    .AWLENC(AWLENC),
    .AWSIZEC(AWSIZEC),
    .AWBURSTC(AWBURSTC),
    .AWLOCKC(AWLOCKC),
    .AWCACHEC(AWCACHEC),
    .AWPROTC(AWPROTC),
    .AWUSERC(AWUSERC),
    .AWVALIDC(AWVALIDC),
    .AWREADYC(AWREADYC),
    .WSTRBC(WSTRBC),
    .WLASTC(WLASTC),
    .WVALIDC(WVALIDC),
    .WREADYC(WREADYC),
    .HWDATAC(HWDATAC),
    .BRESPC(BRESPC),
    .BVALIDC(BVALIDC),
    .BREADYC(BREADYC),
    .ARADDRC(ARADDRC),
    .ARLENC(ARLENC),
    .ARSIZEC(ARSIZEC),
    .ARBURSTC(ARBURSTC),
    .ARLOCKC(ARLOCKC),
    .ARCACHEC(ARCACHEC),
    .ARPROTC(ARPROTC),
    .ARUSERC(ARUSERC),
    .ARVALIDC(ARVALIDC),
    .ARREADYC(ARREADYC),
    .RRESPC(RRESPC),
    .RLASTC(RLASTC),
    .RVALIDC(RVALIDC),
    .RREADYC(RREADYC),
    .HRDATAC(HRDATAC)
  );
endmodule
