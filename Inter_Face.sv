interface Inter_Face;
  
  logic [7:0] A, B;     // inputs of ALU
  logic [7:0] OPCode;   // control signal for different operations
  logic [7:0] Out; 		// output  of ALU
  logic Carry;			// carry while add operation
  
  modport dut (input A, B, OPCode, output Out, Carry);
  modport test(output A, B, OPCode, input Out, Carry);
  
endinterface