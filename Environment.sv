`include "Transaction.sv"
`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Score_Board.sv"

class Environment;
  Transaction trans;
  Generator   gen;
  Driver      driv;
  Monitor     mon;
  Score_Board scb;
  mailbox  M1, M2;   // M1: gen2driv,    M2: mon2scb
  virtual Inter_Face VIF; 
  
  function new(virtual Inter_Face VIF);
    this.VIF  = VIF;
    M1  = new();
    M2  = new();
    gen = new(M1);
    driv= new(VIF, M1);
    mon = new(VIF, M2);
    scb = new(M2);
  endfunction
  
  task test;
    fork
      gen.main();
      driv.main();
      mon.main();
      scb.main();
    join
  endtask
  
  task Run;
    test();
    $finish;
  endtask
endclass