`include "fifo_define.sv"
`define MON vif.MON.mon_cb

class fifo_monitor extends uvm_monitor;
  
  virtual fifo_interface vif;

  fifo_transaction trans;
  
  uvm_analysis_port#(fifo_transaction) ap;
  
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

   virtual task run_phase(uvm_phase phase);
    forever begin
      @(`MON)
      if(`MON.i_wren == 1)begin
        $display("\n write enable  is high");
        trans.i_wrdata = `MON.i_wrdata;
        trans.i_wren = 1'b1;
        trans.i_rden = 1'b0;
        trans.o_alm_full = `MON.o_alm_full;
        trans.o_full = `MON.o_full;
       
        ap.write(trans);
      end
      else if(`MON.i_rden == 1)begin
        @(`MON)
        $display("\nRean enable  is high");
        trans.o_rddata = `MON.o_rddata;
        trans.i_rden= 1'b1;
        trans.i_wren = 1'b0;
         trans.o_alm_empty = `MON.o_alm_empty;
        trans.o_empty = `MON.o_empty;
        ap.write(trans);
      end
    end
  endtask
endclass
