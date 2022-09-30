`include "Environment.sv"

program test (Inter_Face IF_test);
  Environment env;
  initial begin
    env = new(IF_test);
    env.Run();
  end
endprogram