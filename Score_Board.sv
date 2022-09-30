class Score_Board;
  Transaction trans;
  mailbox mon2scb;
  int i;
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
    i=0;
  endfunction
  
  task main();
    repeat(1)  begin
      mon2scb.get(trans);
      
      case(trans.OPCode)
        Add : begin 
          if({trans.Carry, trans.Out} == trans.A + trans.B)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        Sub : begin
          if(trans.Out == trans.A - trans.B)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        Mul : begin 	
          if(trans.Out == trans.A * trans.B)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        Div : begin 	
          if(trans.Out == trans.A / trans.B)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        Mod : begin	 
          if(trans.Out == trans.A % trans.B)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        And : begin	 
          if(trans.Out == trans.A && trans.B)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        Or  : begin	
          if(trans.Out == trans.A || trans.B)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        NotA: begin	 
          if(trans.Out == ! trans.A)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        Xor : begin	 
          if(trans.Out == trans.A ^ trans.B)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        BitWise_And : begin 
          if(trans.Out == trans.A & trans.B)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        BitWise_Or  : begin	
          if(trans.Out == trans.A | trans.B)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        BitWise_NotB: begin 
          if(trans.Out == ~ trans.B)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        Shift_RightA: begin 
          if(trans.Out == ~ trans.A >> 1)
            $fatal("Expected output");
          else
            $fatal("ERROR");
        end

        Shift_LeftB : begin 
          if(trans.Out == ~ trans.B << 1)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        IncrementA  : begin 
          if({trans.Carry, trans.Out} == trans.A + 1)
            $display("Expected output");
          else
            $fatal("ERROR");
        end

        DecrementB  : begin 
          if(trans.Out ==  trans.B - 1)
            $display("Expected output");
          else
            $fatal("ERROR");
        end
      endcase
      
      i++;
      trans.print (i, "Score Board");
    end
  endtask
endclass     