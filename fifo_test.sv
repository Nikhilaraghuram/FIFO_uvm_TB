class fifo_test extends uvm_test;
  fifo_sequence seq;
  fifo_environment env;
  
  `uvm_component_utils(fifo_test)
  
  function new(string name = "fifo_test", uvm_component parent= null);
    super.new(name, parent);
  endfunction
  
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq = fifo_sequence::type_id::create("seq", this);
    env = fifo_environment::type_id::create("env", this);
  endfunction
  
   task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.start(env.agt.sqcr);
    phase.drop_objection(this);
  endtask
  
endclass
