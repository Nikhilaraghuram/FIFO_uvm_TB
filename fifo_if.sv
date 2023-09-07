`include "fifo_define.sv";

interface fifo_if;
    logic clk, rstn,i_wren,i_rden;
    logic  [DATA_W - 1 : 0] i_wrdata;
  logic [DATA_W - 1 : 0] o_rddata;
  logic  o_alm_full , o_full,  o_alm_empty, o_empty;

    //clocking block for driver 
    clocking drv_cb@(posedge clk);
        default input #0 output #0;
   endclocking

modport DRV(clocking drv_cb);
    
endinterface : fifo_if
 
