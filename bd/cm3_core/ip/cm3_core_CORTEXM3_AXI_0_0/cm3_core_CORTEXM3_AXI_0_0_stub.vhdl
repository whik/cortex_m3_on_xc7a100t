-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Sun Mar 20 13:52:41 2022
-- Host        : LAPTOP-MNJIK6F2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ip/cm3_core_CORTEXM3_AXI_0_0/cm3_core_CORTEXM3_AXI_0_0_stub.vhdl
-- Design      : cm3_core_CORTEXM3_AXI_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cm3_core_CORTEXM3_AXI_0_0 is
  Port ( 
    SYSRESETREQ : out STD_LOGIC;
    DBGRESTARTED : out STD_LOGIC;
    LOCKUP : out STD_LOGIC;
    HALTED : out STD_LOGIC;
    JTAGNSW : out STD_LOGIC;
    SWDO : out STD_LOGIC;
    SWDOEN : out STD_LOGIC;
    SWV : out STD_LOGIC;
    HCLK : in STD_LOGIC;
    SYSRESETn : in STD_LOGIC;
    IRQ : in STD_LOGIC_VECTOR ( 0 to 0 );
    NMI : in STD_LOGIC;
    CFGITCMEN : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DBGRESETn : in STD_LOGIC;
    DBGRESTART : in STD_LOGIC;
    EDBGRQ : in STD_LOGIC;
    STCLK : in STD_LOGIC;
    SWCLKTCK : in STD_LOGIC;
    SWDITMS : in STD_LOGIC;
    AWADDRS : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AWLENS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    AWSIZES : out STD_LOGIC_VECTOR ( 2 downto 0 );
    AWBURSTS : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AWLOCKS : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AWCACHES : out STD_LOGIC_VECTOR ( 3 downto 0 );
    AWPROTS : out STD_LOGIC_VECTOR ( 2 downto 0 );
    AWUSERS : out STD_LOGIC_VECTOR ( 0 to 0 );
    AWVALIDS : out STD_LOGIC;
    AWREADYS : in STD_LOGIC;
    WSTRBS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    WLASTS : out STD_LOGIC;
    WVALIDS : out STD_LOGIC;
    WREADYS : in STD_LOGIC;
    HWDATAS : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRESPS : in STD_LOGIC_VECTOR ( 1 downto 0 );
    BVALIDS : in STD_LOGIC;
    BREADYS : out STD_LOGIC;
    ARADDRS : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ARLENS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ARSIZES : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ARBURSTS : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ARLOCKS : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ARCACHES : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ARPROTS : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ARUSERS : out STD_LOGIC_VECTOR ( 0 to 0 );
    ARVALIDS : out STD_LOGIC;
    ARREADYS : in STD_LOGIC;
    RRESPS : in STD_LOGIC_VECTOR ( 1 downto 0 );
    RLASTS : in STD_LOGIC;
    RVALIDS : in STD_LOGIC;
    RREADYS : out STD_LOGIC;
    HRDATAS : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AWADDRC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AWLENC : out STD_LOGIC_VECTOR ( 3 downto 0 );
    AWSIZEC : out STD_LOGIC_VECTOR ( 2 downto 0 );
    AWBURSTC : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AWLOCKC : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AWCACHEC : out STD_LOGIC_VECTOR ( 3 downto 0 );
    AWPROTC : out STD_LOGIC_VECTOR ( 2 downto 0 );
    AWUSERC : out STD_LOGIC_VECTOR ( 0 to 0 );
    AWVALIDC : out STD_LOGIC;
    AWREADYC : in STD_LOGIC;
    WSTRBC : out STD_LOGIC_VECTOR ( 3 downto 0 );
    WLASTC : out STD_LOGIC;
    WVALIDC : out STD_LOGIC;
    WREADYC : in STD_LOGIC;
    HWDATAC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRESPC : in STD_LOGIC_VECTOR ( 1 downto 0 );
    BVALIDC : in STD_LOGIC;
    BREADYC : out STD_LOGIC;
    ARADDRC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ARLENC : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ARSIZEC : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ARBURSTC : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ARLOCKC : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ARCACHEC : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ARPROTC : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ARUSERC : out STD_LOGIC_VECTOR ( 0 to 0 );
    ARVALIDC : out STD_LOGIC;
    ARREADYC : in STD_LOGIC;
    RRESPC : in STD_LOGIC_VECTOR ( 1 downto 0 );
    RLASTC : in STD_LOGIC;
    RVALIDC : in STD_LOGIC;
    RREADYC : out STD_LOGIC;
    HRDATAC : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end cm3_core_CORTEXM3_AXI_0_0;

architecture stub of cm3_core_CORTEXM3_AXI_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "SYSRESETREQ,DBGRESTARTED,LOCKUP,HALTED,JTAGNSW,SWDO,SWDOEN,SWV,HCLK,SYSRESETn,IRQ[0:0],NMI,CFGITCMEN[1:0],DBGRESETn,DBGRESTART,EDBGRQ,STCLK,SWCLKTCK,SWDITMS,AWADDRS[31:0],AWLENS[3:0],AWSIZES[2:0],AWBURSTS[1:0],AWLOCKS[1:0],AWCACHES[3:0],AWPROTS[2:0],AWUSERS[0:0],AWVALIDS,AWREADYS,WSTRBS[3:0],WLASTS,WVALIDS,WREADYS,HWDATAS[31:0],BRESPS[1:0],BVALIDS,BREADYS,ARADDRS[31:0],ARLENS[3:0],ARSIZES[2:0],ARBURSTS[1:0],ARLOCKS[1:0],ARCACHES[3:0],ARPROTS[2:0],ARUSERS[0:0],ARVALIDS,ARREADYS,RRESPS[1:0],RLASTS,RVALIDS,RREADYS,HRDATAS[31:0],AWADDRC[31:0],AWLENC[3:0],AWSIZEC[2:0],AWBURSTC[1:0],AWLOCKC[1:0],AWCACHEC[3:0],AWPROTC[2:0],AWUSERC[0:0],AWVALIDC,AWREADYC,WSTRBC[3:0],WLASTC,WVALIDC,WREADYC,HWDATAC[31:0],BRESPC[1:0],BVALIDC,BREADYC,ARADDRC[31:0],ARLENC[3:0],ARSIZEC[2:0],ARBURSTC[1:0],ARLOCKC[1:0],ARCACHEC[3:0],ARPROTC[2:0],ARUSERC[0:0],ARVALIDC,ARREADYC,RRESPC[1:0],RLASTC,RVALIDC,RREADYC,HRDATAC[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "CortexM3DbgAXI,Vivado 2018.3";
begin
end;
