class Driver;
  Transaction trans;
  mailbox gen2driv;
  virtual Inter_Face VIF;
  int i;
  
  function new (virtual Inter_Face VIF, mailbox gen2driv);
    this.VIF = VIF;
    this.gen2driv = gen2driv;
    i=0;
  endfunction
  
  task main();
    repeat(1) begin
      gen2driv.get(trans);
      VIF.A		 <= trans.A;
      VIF.B		 <= trans.B;
      VIF.OPCode <= trans.OPCode;
    
      trans.Out = VIF.Out;
      trans.Carry = VIF.Carry;
      
      i++;
      trans.print (i, "Driver");
    end
  endtask
endclass