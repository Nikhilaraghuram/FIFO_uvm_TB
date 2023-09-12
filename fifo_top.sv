`include "fifo_pkg.sv"
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "fifo_if.sv"

module fifo_top;
  bit clk;
  bit rstn;

  always #5 clk = ~clk;

  initial begin
    clk = 1;
    reset = 0;
    #5;
    reset = 1;
  end

  fifo_if vif(clk, rstn);

  uvm_config_db#(virtual fifo_if)::set(uvm_root::get(), "*", "vif", vif);

  //dut instantiation 

   initial begin
    uvm_config_db#(virtual f_interface)::set(null, "", "vif", tif);
   
     run_test("fifo_test");
  end
  
endmodule
