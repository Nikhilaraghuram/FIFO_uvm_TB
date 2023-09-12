`include "fifo_define.sv"
`define MON vif.MON.drv_cb

class fifo_monitor extends uvm_driver#(fifo_transaction);
  
  `uvm_component_utils(fifo_driver)
  
   virtual fifo_if vif;
  
  function new(string name, uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual fifo_if)::get(this, "", "vif", vif)) 
      begin
        `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
      end
  endfunction
