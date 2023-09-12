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

  fifo dut(.clk(vif.clk),
           .rstn(vif.rstn),
           .i_wrdata(vif.i_wrdata),
           .i_wren(vif.i_wren),
           .i_rden(vif.rden),
           .o_full(vif.full),
           .o_empty(vif.o_empty),
           .o_rddata(vif.o_rddata)
           .o_alm_full(vif.o_alm_full)
           .o_alm_empty(vif.o_alm_empty));

   initial begin
    uvm_config_db#(virtual f_interface)::set(null, "", "vif", tif);
   
     run_test("fifo_test");
  end
  
endmodule
