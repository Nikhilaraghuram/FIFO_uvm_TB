`include "fifo_define.sv"
`define MON vif.MON.drv_cb

class fifo_monitor extends uvm_monitor;
  
  virtual fifo_interface vif;
 
  uvm_analysis_port#(fifo_seq_item)ap;
  
  `uvm_component_utils(fifo_monitor)
  

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
    ap=new("ap", this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual fifo_interface)::get(this, "", "vif", vif)) begin
       `uvm_error("build_phase", "No virtual interface specified for this monitor instance")
       end
   endfunction
