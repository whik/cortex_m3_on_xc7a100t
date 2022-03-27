
################################################################
# This is a generated script based on design: cm3_core
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source cm3_core_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# swdio_tri_buffer

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tfgg484-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name cm3_core

# This script was generated for a remote BD. To create a non-remote design,
# change the variable <run_remote_bd_flow> to <0>.

set run_remote_bd_flow 1
if { $run_remote_bd_flow == 1 } {
  # Set the reference directory for source file relative paths (by default 
  # the value is script directory path)
  set origin_dir ./bd

  # Use origin directory path location variable, if specified in the tcl shell
  if { [info exists ::origin_dir_loc] } {
     set origin_dir $::origin_dir_loc
  }

  set str_bd_folder [file normalize ${origin_dir}]
  set str_bd_filepath ${str_bd_folder}/${design_name}/${design_name}.bd

  # Check if remote design exists on disk
  if { [file exists $str_bd_filepath ] == 1 } {
     catch {common::send_msg_id "BD_TCL-110" "ERROR" "The remote BD file path <$str_bd_filepath> already exists!"}
     common::send_msg_id "BD_TCL-008" "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0>."
     common::send_msg_id "BD_TCL-009" "INFO" "Also make sure there is no design <$design_name> existing in your current project."

     return 1
  }

  # Check if design exists in memory
  set list_existing_designs [get_bd_designs -quiet $design_name]
  if { $list_existing_designs ne "" } {
     catch {common::send_msg_id "BD_TCL-111" "ERROR" "The design <$design_name> already exists in this project! Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_msg_id "BD_TCL-010" "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Check if design exists on disk within project
  set list_existing_designs [get_files -quiet */${design_name}.bd]
  if { $list_existing_designs ne "" } {
     catch {common::send_msg_id "BD_TCL-112" "ERROR" "The design <$design_name> already exists in this project at location:
    $list_existing_designs"}
     catch {common::send_msg_id "BD_TCL-113" "ERROR" "Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_msg_id "BD_TCL-011" "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Now can create the remote BD
  # NOTE - usage of <-dir> will create <$str_bd_folder/$design_name/$design_name.bd>
  create_bd_design -dir $str_bd_folder $design_name
} else {

  # Create regular design
  if { [catch {create_bd_design $design_name} errmsg] } {
     common::send_msg_id "BD_TCL-012" "INFO" "Please set a different value to variable <design_name>."

     return 1
  }
}

current_bd_design $design_name

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set cm3_gpio_in [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 cm3_gpio_in ]
  set cm3_gpio_out [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 cm3_gpio_out ]

  # Create ports
  set cm3_clk [ create_bd_port -dir I -type clk cm3_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {50000000} \
 ] $cm3_clk
  set cm3_resetn [ create_bd_port -dir I -type rst cm3_resetn ]
  set cm3_swclk [ create_bd_port -dir I -type clk cm3_swclk ]
  set cm3_swdio [ create_bd_port -dir IO cm3_swdio ]
  set cm3_uart_rxd [ create_bd_port -dir I cm3_uart_rxd ]
  set cm3_uart_txd [ create_bd_port -dir O cm3_uart_txd ]

  # Create instance: CORTEXM3_AXI_0, and set properties
  set CORTEXM3_AXI_0 [ create_bd_cell -type ip -vlnv Arm.com:CortexM:CORTEXM3_AXI:1.1 CORTEXM3_AXI_0 ]
  set_property -dict [ list \
   CONFIG.DTCM_SIZE {"0111"} \
   CONFIG.ITCM_INIT_RAM {false} \
   CONFIG.ITCM_SIZE {"0111"} \
   CONFIG.JTAG_PRESENT {false} \
   CONFIG.TRACE_LVL {0} \
 ] $CORTEXM3_AXI_0

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS_2 {1} \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO2_WIDTH {4} \
   CONFIG.C_GPIO_WIDTH {4} \
   CONFIG.C_IS_DUAL {1} \
 ] $axi_gpio_0

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list \
   CONFIG.C_BAUDRATE {115200} \
 ] $axi_uartlite_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {200.0} \
   CONFIG.CLKOUT1_JITTER {192.113} \
   CONFIG.CLKOUT1_PHASE_ERROR {164.985} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {20.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {20.000} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {20.000} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.PRIM_IN_FREQ {50} \
   CONFIG.RESET_PORT {resetn} \
   CONFIG.RESET_TYPE {ACTIVE_LOW} \
 ] $clk_wiz_0

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: swdio_tri_buffer_0, and set properties
  set block_name swdio_tri_buffer
  set block_cell_name swdio_tri_buffer_0
  if { [catch {set swdio_tri_buffer_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $swdio_tri_buffer_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_WIDTH {2} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {1} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {1} \
 ] $xlconstant_2

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins CORTEXM3_AXI_0/CM3_SYS_AXI3] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO [get_bd_intf_ports cm3_gpio_out] [get_bd_intf_pins axi_gpio_0/GPIO]
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO2 [get_bd_intf_ports cm3_gpio_in] [get_bd_intf_pins axi_gpio_0/GPIO2]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_interconnect_0/M01_AXI] [get_bd_intf_pins axi_uartlite_0/S_AXI]

  # Create port connections
  connect_bd_net -net CORTEXM3_AXI_0_SWDO [get_bd_pins CORTEXM3_AXI_0/SWDO] [get_bd_pins swdio_tri_buffer_0/swd_o]
  connect_bd_net -net CORTEXM3_AXI_0_SWDOEN [get_bd_pins CORTEXM3_AXI_0/SWDOEN] [get_bd_pins swdio_tri_buffer_0/swd_oe]
  connect_bd_net -net CORTEXM3_AXI_0_SYSRESETREQ [get_bd_pins CORTEXM3_AXI_0/SYSRESETREQ] [get_bd_pins proc_sys_reset_0/mb_debug_sys_rst]
  connect_bd_net -net M01_ARESETN_1 [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net Net [get_bd_ports cm3_swdio] [get_bd_pins swdio_tri_buffer_0/swd_io]
  connect_bd_net -net SWCLKTCK_0_1 [get_bd_ports cm3_swclk] [get_bd_pins CORTEXM3_AXI_0/SWCLKTCK]
  connect_bd_net -net axi_uartlite_0_tx [get_bd_ports cm3_uart_txd] [get_bd_pins axi_uartlite_0/tx]
  connect_bd_net -net clk_in1_0_1 [get_bd_ports cm3_clk] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins CORTEXM3_AXI_0/HCLK] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins proc_sys_reset_0/dcm_locked]
  connect_bd_net -net proc_sys_reset_0_mb_reset [get_bd_pins proc_sys_reset_0/mb_reset] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net resetn_0_1 [get_bd_ports cm3_resetn] [get_bd_pins clk_wiz_0/resetn] [get_bd_pins proc_sys_reset_0/aux_reset_in] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net rx_0_1 [get_bd_ports cm3_uart_rxd] [get_bd_pins axi_uartlite_0/rx]
  connect_bd_net -net swdio_tri_buffer_0_swd_i [get_bd_pins CORTEXM3_AXI_0/SWDITMS] [get_bd_pins swdio_tri_buffer_0/swd_i]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins CORTEXM3_AXI_0/DBGRESETn] [get_bd_pins CORTEXM3_AXI_0/SYSRESETn] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins CORTEXM3_AXI_0/CFGITCMEN] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins CORTEXM3_AXI_0/NMI] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins CORTEXM3_AXI_0/IRQ] [get_bd_pins xlconstant_2/dout]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x40000000 [get_bd_addr_spaces CORTEXM3_AXI_0/CM3_SYS_AXI3] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40600000 [get_bd_addr_spaces CORTEXM3_AXI_0/CM3_SYS_AXI3] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


