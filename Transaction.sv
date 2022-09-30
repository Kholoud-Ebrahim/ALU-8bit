class Transaction;
  rand bit [7:0] A;
  rand bit [7:0] B;
  rand operation OPCode;
  bit [7:0] Out;
  bit       Carry;
  
  function void print (int i=0,string name);
    $display("===========================");
    $display("[%0d] ",i, name, " : time = %0t",$time);
    $display("===========================");
    $display("A= %0b	B= %0b	\nOp= ", A, B, OPCode.name);
    $display("Out= %0b	carry= %0b", Out, Carry);
    $display("===========================\n");
  endfunction
endclass