`include "fifo_define.sv"

class fifo_transaction extends uvm_sequence_item;
   //data signals
    rand logic i_wren;
    rand logic i_rden;
    rand logic [DATA_W - 1 : 0] i_wrdata;
    logic [DATA_W - 1 : 0] o_rddata;
    logic  o_alm_full ;
    logic o_full ;
    logic o_alm_empty ;
    logic o_empty;

  //constructor 
  function new(string name = "fifo_transaction");
        super.new(name);
    endfunction

  `uvm_object_utils_begin(fifo_transaction)
        `uvm_field_int(i_wren, UVM_ALL_ON)
        `uvm_field_int(i_rden, UVM_ALL_ON)
        `uvm_field_int(i_wrdata, UVM_ALL_ON)
        `uvm_field_int(o_rddata, UVM_ALL_ON)
        `uvm_field_int(o_alm_full, UVM_ALL_ON)
        `uvm_field_int(o_full, UVM_ALL_ON)
        `uvm_field_int(o_alm_empty, UVM_ALL_ON)
        `uvm_field_int(o_empty, UVM_ALL_ON)
    `uvm_object_utils_end
endclass 
