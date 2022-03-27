-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Sun Mar 20 17:03:20 2022
-- Host        : LAPTOP-MNJIK6F2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ip/cm3_core_swdio_tri_buffer_0_0/cm3_core_swdio_tri_buffer_0_0_stub.vhdl
-- Design      : cm3_core_swdio_tri_buffer_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cm3_core_swdio_tri_buffer_0_0 is
  Port ( 
    swd_o : in STD_LOGIC;
    swd_oe : in STD_LOGIC;
    swd_i : out STD_LOGIC;
    swd_io : inout STD_LOGIC
  );

end cm3_core_swdio_tri_buffer_0_0;

architecture stub of cm3_core_swdio_tri_buffer_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "swd_o,swd_oe,swd_i,swd_io";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "swdio_tri_buffer,Vivado 2018.3";
begin
end;
