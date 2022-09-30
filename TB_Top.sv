`include "Inter_Face.sv"
`include "test.sv"

module TB_Top();
  
  Inter_Face  IF();
  ALU_Design  D1(IF.dut);
  test        T1(IF.test);
  
  
  initial begin
    $dumpfile("test.vcd");
    $dumpvars;
  end
endmodule