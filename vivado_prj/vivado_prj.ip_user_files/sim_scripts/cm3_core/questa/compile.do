vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_18
vlib questa_lib/msim/fifo_generator_v13_2_3
vlib questa_lib/msim/axi_data_fifo_v2_1_17
vlib questa_lib/msim/axi_crossbar_v2_1_19
vlib questa_lib/msim/util_vector_logic_v2_0_1
vlib questa_lib/msim/xlconstant_v1_1_5
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/interrupt_control_v3_1_4
vlib questa_lib/msim/axi_gpio_v2_0_20
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/axi_uartlite_v2_0_22
vlib questa_lib/msim/axi_protocol_converter_v2_1_18

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_18 questa_lib/msim/axi_register_slice_v2_1_18
vmap fifo_generator_v13_2_3 questa_lib/msim/fifo_generator_v13_2_3
vmap axi_data_fifo_v2_1_17 questa_lib/msim/axi_data_fifo_v2_1_17
vmap axi_crossbar_v2_1_19 questa_lib/msim/axi_crossbar_v2_1_19
vmap util_vector_logic_v2_0_1 questa_lib/msim/util_vector_logic_v2_0_1
vmap xlconstant_v1_1_5 questa_lib/msim/xlconstant_v1_1_5
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_4 questa_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_20 questa_lib/msim/axi_gpio_v2_0_20
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_22 questa_lib/msim/axi_uartlite_v2_0_22
vmap axi_protocol_converter_v2_1_18 questa_lib/msim/axi_protocol_converter_v2_1_18

vlog -work xil_defaultlib -64 -sv "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"D:/program/Vivado/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/program/Vivado/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/program/Vivado/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cm3_dap_ahb_ap.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cm3_wic.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cm3_nvic.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cm3_dwt.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/AhbToAxi.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cm3_mpu.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cm3_bus_matrix.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/models.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cmsdk.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cm3_tpiu.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/dapswjdp.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cm3_fpb.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cm3_dpu.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cm3_itm.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cm3_etm.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cortexm3.v" \
"../../../bd/cm3_core/ipshared/ea75/rtl/cortexm3_integration.v" \
"../../../bd/cm3_core/ip/cm3_core_CORTEXM3_AXI_0_0/sim/cm3_core_CORTEXM3_AXI_0_0.v" \
"../../../bd/cm3_core/ip/cm3_core_clk_wiz_0_0/cm3_core_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/cm3_core/ip/cm3_core_clk_wiz_0_0/cm3_core_clk_wiz_0_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../../bd/cm3_core/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../../bd/cm3_core/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/cm3_core/ip/cm3_core_proc_sys_reset_0_0/sim/cm3_core_proc_sys_reset_0_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../../../bd/cm3_core/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../../../bd/cm3_core/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_18 -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../../../bd/cm3_core/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_3 -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../../../bd/cm3_core/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_3 -64 -93 \
"../../../../../bd/cm3_core/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_3 -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../../../bd/cm3_core/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_17 -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../../../bd/cm3_core/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_19 -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../../../bd/cm3_core/ipshared/6c9d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../bd/cm3_core/ip/cm3_core_xbar_0/sim/cm3_core_xbar_0.v" \

vlog -work util_vector_logic_v2_0_1 -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../../../bd/cm3_core/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../bd/cm3_core/ip/cm3_core_util_vector_logic_0_0/sim/cm3_core_util_vector_logic_0_0.v" \

vlog -work xlconstant_v1_1_5 -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../../../bd/cm3_core/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../bd/cm3_core/ip/cm3_core_xlconstant_0_0/sim/cm3_core_xlconstant_0_0.v" \
"../../../bd/cm3_core/ip/cm3_core_xlconstant_0_1/sim/cm3_core_xlconstant_0_1.v" \
"../../../bd/cm3_core/ip/cm3_core_xlconstant_1_0/sim/cm3_core_xlconstant_1_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../../bd/cm3_core/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../../bd/cm3_core/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_20 -64 -93 \
"../../../../../bd/cm3_core/ipshared/a7c9/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/cm3_core/ip/cm3_core_axi_gpio_0_1/sim/cm3_core_axi_gpio_0_1.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../../bd/cm3_core/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../../bd/cm3_core/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_22 -64 -93 \
"../../../../../bd/cm3_core/ipshared/7371/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/cm3_core/ip/cm3_core_axi_uartlite_0_0/sim/cm3_core_axi_uartlite_0_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../bd/cm3_core/sim/cm3_core.v" \
"../../../bd/cm3_core/ip/cm3_core_swdio_tri_buffer_0_0/sim/cm3_core_swdio_tri_buffer_0_0.v" \

vlog -work axi_protocol_converter_v2_1_18 -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../../../bd/cm3_core/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../bd/cm3_core/ipshared/ea75/rtl" "+incdir+../../../../../bd/cm3_core/ipshared/85a3" "+incdir+../../../../../bd/cm3_core/ipshared/ec67/hdl" "+incdir+../../../../../bd/cm3_core/ipshared/ea75/rtl" \
"../../../bd/cm3_core/ip/cm3_core_auto_pc_0/sim/cm3_core_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

