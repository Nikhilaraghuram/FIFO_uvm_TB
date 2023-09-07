`include "fifo_define.sv"

class fifo_sequence extends uvm_sequence#(fifo_transaction);
   
  `uvm_object_utils(fifo_sequence)

   fifo_transaction tx;
  
  function new(string name="fifo_sequence");
     super.new(name);
   endfunction:new
   
   // Task Body. Behavior of the sequence. 
  task body();
     repeat(10) 
     begin
       
       tx=fifo_transaction::type_id::create("tx");
       
       start_item(tx);
       
       assert(tx.randomize());
       finish_item(tx);
      
     end
   endtask:body 
   
 endclass:fifo_sequence 
