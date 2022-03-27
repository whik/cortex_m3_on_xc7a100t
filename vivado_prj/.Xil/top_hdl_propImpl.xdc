set_property SRC_FILE_INFO {cfile:d:/fpga_study/ARM/cortex_m3_on_xc7a100t/bd/cm3_core/ip/cm3_core_clk_wiz_0_0/cm3_core_clk_wiz_0_0.xdc rfile:../../bd/cm3_core/ip/cm3_core_clk_wiz_0_0/cm3_core_clk_wiz_0_0.xdc id:1 order:EARLY scoped_inst:cm3_core_wrapper_ut0/cm3_core_i/clk_wiz_0/inst} [current_design]
current_instance cm3_core_wrapper_ut0/cm3_core_i/clk_wiz_0/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.2
