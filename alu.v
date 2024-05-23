module alu(
  input wire [31:0] operand1,
  input wire [31:0] operand2,
  input wire [3:0] op,

  output reg [31:0] result,
  output reg zero_flag
);

  always @* begin
    
    case(op)
      4'b0000: result = operand1 & operand2;  // AND
      4'b0001: result = operand1 | operand2;  // OR
      4'b0010: result = operand1 ^ operand2;  // xor
      4'b0101: result = operand1 + operand2;  // ADD
      4'b0110: result = operand1 - operand2;  // sub
      4'b0111: result = operand1 * operand2;  // mul
      4'b1100: result = operand1 / operand2;  // div
      default: result = 32'b0;
    endcase
    zero_flag = (result == 32'b0);
  end
  


endmodule