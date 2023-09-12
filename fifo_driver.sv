`include "fifo_define.sv"
`define DRV vif.DRV.drv_cb

class fifo_driver extends uvm_driver#(fifo_transaction);
  
  `uvm_component_utils(fifo_driver)
  
   virtual fifo_if vif;

fifo_transaction trans;
  
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
  
  task run_phase(uvm_phase phase);
      @(`DRV)
         if(rstn) begin
        `DRV.i_wren<=0;
        `DRV.i_rden<=0;
        `DRV.i_wrdata<=0;
      end
    forever begin
      
      seq_item_port.get_next_item(trans);
      uvm_report_info("FIFO_DRIVER ", $psprintf("Got Transaction %s",trans.convert2string()));
     
       if(trans.i_wren == 1)
        fifo_write(trans.i_wrdata);
      else if(trans.i_rden == 1)
        fifo_read();
      
      uvm_report_info("FIFO_DRIVER ", $psprintf("Got Response %s",trans.convert2string()));
      //Putting back response
      seq_item_port.put(trans);
      seq_item_port.item_done();
    end 
  endtask
     
  task fifo_write(input [DATA_W-1:0] din);
    @(`DRV)
   `DRV.i_wren<=trans.i_wren;
   `DRV.i_wrdata<=trans.i_wrdata;    
    @(`DRV)
   `DRV.i_wren<=0;
  endtask
  
   task fifo_read();
     @(`DRV)
     `DRV.i_rden<=trans.i_rden;
    @(`DRV)
    `DRV.i_rden<=0;
  endtask
  
endclass
