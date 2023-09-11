`include "fifo_define.sv"

class fifo_sequence extends uvm_sequence#(fifo_transaction);
   
  `uvm_object_utils(fifo_sequence)

   fifo_transaction tx;
  
  function new(string name="fifo_sequence");
     super.new(name);
   endfunction:new
   
   // Task Body. Behavior of the sequence. 
  task body();
     repeat(DEPTH) 
     begin
       
       tx=fifo_transaction::type_id::create("tx");
       
       start_item(tx);
       
       assert(tx.randomize());
       finish_item(tx);
      
     end
   endtask:body 
   
 endclass:fifo_sequence 
// writing testcase

class write_sequence extends fifo_sequence #(fifo_transaction);
   `uvm_object_utils(write_sequence)

   fifo_transaction tx;
  
   function new(string name="write_sequence");
     super.new(name);
   endfunction:new
   
   // Task Body. Behavior of the sequence. 
  task body();
     repeat(DEPTH) 
     begin
       
       tx=fifo_transaction::type_id::create("tx");
       
       start_item(tx);
        i_wren == 1'b1;
        i_rden == 1'b0;
       finish_item(tx);
      
     end
   endtask:body 
   
 endclass:write_sequence 
//read sequence 
class read_sequence extends fifo_sequence #(fifo_transaction);
   `uvm_object_utils(read_sequence)

   fifo_transaction tx;
  
   function new(string name="read_sequence");
     super.new(name);
   endfunction:new
   
   // Task Body. Behavior of the sequence. 
  task body();
     repeat(DEPTH) 
     begin
       
       tx=fifo_transaction::type_id::create("tx");
       
       start_item(tx);
        i_wren == 1'b0;
        i_rden == 1'b1;
       finish_item(tx);
      
     end
   endtask:body 
   
 endclass:read_sequence 

// parallel write read sequence 
class write_read_sequence extends fifo_sequence #(fifo_transaction);
   `uvm_object_utils(write_read_sequence)

   fifo_transaction tx;
  
   function new(string name="write_read_sequence");
     super.new(name);
   endfunction:new
   
   // Task Body. Behavior of the sequence. 
  task body();
     repeat(DEPTH) 
     begin
       
       tx=fifo_transaction::type_id::create("tx");
       
       start_item(tx);
        i_wren == 1'b1;
        i_rden == 1'b1;
       finish_item(tx);
      
     end
   endtask:body 
   
 endclass:write_read_sequence 
