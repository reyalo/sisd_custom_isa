module alu_tb;
  reg [31:0] operand1;
  reg [31:0] operand2;
  reg [3:0] op;

  wire [31:0] result;
  wire zero_flag;

alu uut(

  .operand1(operand1),
  .operand2(operand2),
  .op(op),
  .result(result),
  .zero_flag(zero_flag)

);


initial begin
  
  operand1 = 32'b0;
  operand2 = 32'b0;
  op       = 4'b0;

  // $display("operand1 = %b", operand1);
  // $display("operand2 = %b", operand2);
  // $display("Result = %b", result);
  // $display("Zero Flag = %b\n", zero_flag);

  #10 ;

  operand1 = 32'b1000;
  operand2 = 32'b1000;
  op       = 4'b0000;

  #10;

  operand1 = 32'b1000;
  operand2 = 32'b1000;
  op       = 4'b0101;

  #10;


  #10;



  $finish;

end


initial begin
  $monitor("result %b zf %b",result,zero_flag);
end


// always begin
//     #5 clk = ~clk;
// end

endmodule