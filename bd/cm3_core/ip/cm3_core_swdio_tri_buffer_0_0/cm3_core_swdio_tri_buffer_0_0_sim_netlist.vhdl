-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Sun Mar 20 17:03:20 2022
-- Host        : LAPTOP-MNJIK6F2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ip/cm3_core_swdio_tri_buffer_0_0/cm3_core_swdio_tri_buffer_0_0_sim_netlist.vhdl
-- Design      : cm3_core_swdio_tri_buffer_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cm3_core_swdio_tri_buffer_0_0_swdio_tri_buffer is
  port (
    swd_i : out STD_LOGIC;
    swd_io : inout STD_LOGIC;
    swd_o : in STD_LOGIC;
    swd_oe : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of cm3_core_swdio_tri_buffer_0_0_swdio_tri_buffer : entity is "swdio_tri_buffer";
end cm3_core_swdio_tri_buffer_0_0_swdio_tri_buffer;

architecture STRUCTURE of cm3_core_swdio_tri_buffer_0_0_swdio_tri_buffer is
  signal T0 : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of swd_iobuf_inst : label is "PRIMITIVE";
begin
swd_iobuf_inst: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => swd_o,
      IO => swd_io,
      O => swd_i,
      T => T0
    );
swd_iobuf_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => swd_oe,
      O => T0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cm3_core_swdio_tri_buffer_0_0 is
  port (
    swd_o : in STD_LOGIC;
    swd_oe : in STD_LOGIC;
    swd_i : out STD_LOGIC;
    swd_io : inout STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of cm3_core_swdio_tri_buffer_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of cm3_core_swdio_tri_buffer_0_0 : entity is "cm3_core_swdio_tri_buffer_0_0,swdio_tri_buffer,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of cm3_core_swdio_tri_buffer_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of cm3_core_swdio_tri_buffer_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of cm3_core_swdio_tri_buffer_0_0 : entity is "swdio_tri_buffer,Vivado 2018.3";
end cm3_core_swdio_tri_buffer_0_0;

architecture STRUCTURE of cm3_core_swdio_tri_buffer_0_0 is
begin
inst: entity work.cm3_core_swdio_tri_buffer_0_0_swdio_tri_buffer
     port map (
      swd_i => swd_i,
      swd_io => swd_io,
      swd_o => swd_o,
      swd_oe => swd_oe
    );
end STRUCTURE;
