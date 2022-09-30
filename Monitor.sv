class Monitor;
  Transaction trans;
  mailbox mon2scb;
  virtual Inter_Face VIF;  
  int i;
  
  function new(virtual Inter_Face VIF, mailbox mon2scb);
    this.VIF = VIF;
    this.mon2scb = mon2scb;
    i=0;
  endfunction
  
  task main();
    repeat(1) #1 begin
      trans = new();
      trans.A = VIF.A;
      trans.B = VIF.B;
      trans.OPCode = VIF.OPCode;
      trans.Out = VIF.Out;
      trans.Carry = VIF.Carry;
      
      mon2scb.put(trans);
      
      i++;
      trans.print (i, "Monitor");
    end
  endtask
endclass