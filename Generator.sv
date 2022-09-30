class Generator;
  Transaction trans;
  mailbox gen2driv;
  int i;
  function new(mailbox gen2driv);
    this.gen2driv =gen2driv;
    i=0;
  endfunction
  
  task main();
    repeat(1) begin
      trans =new();
      trans.randomize();
      gen2driv.put(trans);
      i++;
      trans.print (i,"Generator");
    end
  endtask
endclass