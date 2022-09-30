typedef enum {Add, Sub, Mul, Div, Mod, And, Or , NotA, Xor, BitWise_And, BitWise_Or, BitWise_NotB, Shift_RightA, Shift_LeftB, IncrementA, DecrementB} operation;

module ALU_Design(Inter_Face.dut IF_DUT);
  operation OP;
  always @(*) begin
    IF_DUT.Carry = 0; // default value for carry
    
    case(IF_DUT.OPCode)
      Add : begin 
        {IF_DUT.Carry, IF_DUT.Out} = IF_DUT.A + IF_DUT.B;
        $display("Addition operation");
      end
     
      Sub : begin
        IF_DUT.Out = IF_DUT.A - IF_DUT.B;
        $display("Subtraction operation"); 
      end
      
      Mul : begin 	
        IF_DUT.Out = IF_DUT.A * IF_DUT.B;
        $display("Multiplication operation");
      end
      
      Div : begin 	
        IF_DUT.Out = IF_DUT.A / IF_DUT.B;
        $display("Division operation");
      end
      
      Mod : begin	 
        IF_DUT.Out = IF_DUT.A % IF_DUT.B;
        $display("Modulo Division operation");
      end
      
      And : begin	 
        IF_DUT.Out = IF_DUT.A && IF_DUT.B;
        $display("Logical AND operation");
      end
      
      Or  : begin	
        IF_DUT.Out = IF_DUT.A || IF_DUT.B;
        $display("Logical OR operation");
      end
      
      NotA: begin	 
        IF_DUT.Out = ! IF_DUT.A ;
        $display("Logical Invert A operation");
      end
      
      Xor : begin	 
        IF_DUT.Out = IF_DUT.A ^ IF_DUT.B;
        $display("Bit-wise XOR operation");
      end
      
      BitWise_And : begin 
        IF_DUT.Out = IF_DUT.A & IF_DUT.B;
        $display("Bit-wise AND operation");
      end
      
      BitWise_Or  : begin	
        IF_DUT.Out = IF_DUT.A | IF_DUT.B;
        $display("Bit-wise OR operation");
      end
      
      BitWise_NotB: begin 
        IF_DUT.Out = ~ IF_DUT.B;
        $display("Bit-wise Invert B operation");
      end
      
      Shift_RightA: begin 
        IF_DUT.Out = IF_DUT.A >> 1;
        $display("Right Shift A operation");
      end
      
      Shift_LeftB : begin 
        IF_DUT.Out = IF_DUT.B << 1;
        $display("Left Shift B operation");
      end
      
      IncrementA  : begin 
        {IF_DUT.Carry, IF_DUT.Out} = IF_DUT.A + 1;
        $display("Increment B operation");
      end
      
      DecrementB  : begin 
        IF_DUT.Out = IF_DUT.B - 1;
        $display("Decrement B operation");
      end
      
      default: begin
        IF_DUT.Out   = 0;
        IF_DUT.Carry =0;
      end
    endcase    
  end
endmodule