/***************************************************************
 * Copyright @ 公众号：电子电路开发学习
 * ModuleName : top_hdl.v 
 * Date : 2022年3月20日
 * Time : 15:57:07
 * Author : wcc
 * Function : dual direction gpio
 * Version : v1.0
 * Version | Modify
 * ----------------------------------
 * v1.0 .....
 ***************************************************************/

module swdio_tri_buffer(
    //Inputs
    input swd_o,
    input swd_oe,
    
    //Outputs
    output swd_i,
    
    //Inouts
    inout swd_io
);

IOBUF swd_iobuf_inst(
    .O(swd_i),
    .I(swd_o),
    .IO(swd_io),
    
    .T(!swd_oe)
);

endmodule
