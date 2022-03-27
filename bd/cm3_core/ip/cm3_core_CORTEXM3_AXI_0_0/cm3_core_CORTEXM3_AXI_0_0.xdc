# DAP synchronisers.  Block is DAPDpEnSync and DAPDpSync
# Note : Some cells in nvic with the name sync_reg, and also sync2_reg[x]
set_property ASYNC_REG TRUE [get_cells -hierarchical -regexp .*uDAPSWJDP.*sync_reg_reg]
set_property ASYNC_REG TRUE [get_cells -hierarchical -regexp .*uDAPSWJDP.*sync2_reg_reg]
# cm3_dap_ahb_ap_sync has the flops named d_sync1 and q.
set_property ASYNC_REG TRUE [get_cells -hierarchical -regexp .*u_CORTEXM3INTEGRATION.*d_sync1_reg]
set_property ASYNC_REG TRUE [get_cells -hierarchical -regexp .*u_CORTEXM3INTEGRATION.*sync.*\/q_reg]
# *****************************************************************************
# DAP state machines must have correct encoding.
# set_property FSM_ENCODING sequential [get_cells -hierarchical -regexp .*cm3_dap_ahb_ap_slv.*slv_state_reg.*]
# set_property FSM_ENCODING sequential [get_cells -hierarchical -regexp .*cm3_dap_ahb_ap_mst.*mst_state_reg.*]
# Currently coding as one_hot
# set_property FSM_ENCODING sequential [get_cells -hierarchical -regexp .*DAPSwjWatcher.*State_cdc_check_reg.*]
# In working build, this got encoded as one_hot
# set_property FSM_ENCODING auto [get_cells -hierarchical -regexp .*DAPSwDpProtocol.*State_reg.*]
# In working build, this got encoded as sequential
# set_property FSM_ENCODING auto [get_cells -hierarchical -regexp .*DAPJtagDpProtocol.*JTAGcurr_reg.*]
# In working build, this got encoded as sequential
# Naming convention broken, the module is DAPSwDpApbIf, but the instance is just DAPDpApbIf
# set_property FSM_ENCODING auto [get_cells -hierarchical -regexp .*DAPDpApbIf.*APBcurr_reg.*]
