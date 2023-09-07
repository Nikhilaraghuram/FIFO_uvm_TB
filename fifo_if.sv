`include "fifo_define.sv";
interface fifo_if;
    logic clk, rstn,i_wren,i_rden;
    logic  [DATA_W - 1 : 0] i_wrdata;
  logic [DATA_W - 1 : 0] o_rddata;
  logic  o_alm_full , o_full,  o_alm_empty, o_empty;
endinterface : fifo_if
 
