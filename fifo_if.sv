`include "fifo_define.sv";

interface fifo_if(input bit clk, rstn);
    logic i_wren,i_rden;
    logic  [DATA_W - 1 : 0] i_wrdata;
    logic [DATA_W - 1 : 0] o_rddata;
    logic  o_alm_full , o_full,  o_alm_empty, o_empty;

    //clocking block for driver 
    clocking drv_cb@(posedge clk);
        default input #0 output #0;
        output i_wren, i_rden , i_wrdata;
        input rstn ;
   endclocking

modport DRV(clocking drv_cb);
    
endinterface : fifo_if
 
