# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_resetSystemStats
    rt::HARTNDb_startSystemStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "D:/fpga_study/ARM/cortex_m3_on_xc7a100t/vivado_prj/.Xil/Vivado-11904-LAPTOP-MNJIK6F2/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xc7a100tfgg484-1
     file delete -force synth_hints.os

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common_vhdl.tcl
    set rt::defaultWorkLibName xil_defaultlib

    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_verilog -sv -include {
    d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ipshared/ea75/rtl
    d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ipshared/85a3
    d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ipshared/ec67/hdl
  } {
      D:/program/Vivado/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv
      D:/program/Vivado/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv
    }
      rt::read_verilog -include {
    d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ipshared/ea75/rtl
    d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ipshared/85a3
    d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ipshared/ec67/hdl
  } {
      D:/fpga_study/ARM/cortex_m3_on_xc7a100t/vivado_prj/.Xil/Vivado-11904-LAPTOP-MNJIK6F2/realtime/cm3_core_CORTEXM3_AXI_0_0_stub.v
      D:/fpga_study/ARM/cortex_m3_on_xc7a100t/vivado_prj/.Xil/Vivado-11904-LAPTOP-MNJIK6F2/realtime/cm3_core_clk_wiz_0_0_stub.v
      D:/fpga_study/ARM/cortex_m3_on_xc7a100t/vivado_prj/.Xil/Vivado-11904-LAPTOP-MNJIK6F2/realtime/cm3_core_proc_sys_reset_0_0_stub.v
      D:/fpga_study/ARM/cortex_m3_on_xc7a100t/vivado_prj/.Xil/Vivado-11904-LAPTOP-MNJIK6F2/realtime/cm3_core_xbar_0_stub.v
      D:/fpga_study/ARM/cortex_m3_on_xc7a100t/vivado_prj/.Xil/Vivado-11904-LAPTOP-MNJIK6F2/realtime/cm3_core_util_vector_logic_0_0_stub.v
      D:/fpga_study/ARM/cortex_m3_on_xc7a100t/vivado_prj/.Xil/Vivado-11904-LAPTOP-MNJIK6F2/realtime/cm3_core_axi_gpio_0_1_stub.v
      D:/fpga_study/ARM/cortex_m3_on_xc7a100t/vivado_prj/.Xil/Vivado-11904-LAPTOP-MNJIK6F2/realtime/cm3_core_axi_uartlite_0_0_stub.v
      D:/fpga_study/ARM/cortex_m3_on_xc7a100t/vivado_prj/.Xil/Vivado-11904-LAPTOP-MNJIK6F2/realtime/cm3_core_swdio_tri_buffer_0_0_stub.v
      D:/fpga_study/ARM/cortex_m3_on_xc7a100t/vivado_prj/.Xil/Vivado-11904-LAPTOP-MNJIK6F2/realtime/cm3_core_auto_pc_0_stub.v
      D:/fpga_study/ARM/cortex_m3_on_xc7a100t/rtl/swdio_tri_buffer.v
      d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v
      d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ip/cm3_core_xlconstant_0_0/synth/cm3_core_xlconstant_0_0.v
      d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ip/cm3_core_xlconstant_0_1/synth/cm3_core_xlconstant_0_1.v
      d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ip/cm3_core_xlconstant_1_0/synth/cm3_core_xlconstant_1_0.v
      D:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/synth/cm3_core.v
      D:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/hdl/cm3_core_wrapper.v
      D:/fpga_study/ARM/cortex_m3_on_xc7a100t/rtl/top_hdl.v
    }
      rt::read_vhdl -lib xpm D:/program/Vivado/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top top_hdl
    rt::set_parameter enableIncremental true
    set rt::reportTiming false
    rt::set_parameter elaborateOnly true
    rt::set_parameter elaborateRtl true
    rt::set_parameter eliminateRedundantBitOperator false
    rt::set_parameter elaborateRtlOnlyFlow true
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter merge_flipflops true
    rt::set_parameter srlDepthThreshold 3
    rt::set_parameter rstSrlDepthThreshold 4
# MODE: 
    rt::set_parameter webTalkPath {}
    rt::set_parameter enableSplitFlowPath "D:/fpga_study/ARM/cortex_m3_on_xc7a100t/vivado_prj/.Xil/Vivado-11904-LAPTOP-MNJIK6F2/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_rtlelab -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    if { $rt::flowresult == 1 } { return -code error }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
