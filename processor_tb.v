module processor_tb;

reg clk;
reg reset;
reg [31:0] instruction;
// wire [31:0] result;
wire [1:0] counter_val_o;
wire [127:0] reg_read_data21_wire;
wire [127:0] reg_read_data22_wire;
wire [127:0] reg_write_data2_wire;

wire [31:0] mem_write_data2_wire;
// wire [31:0] reg_read_data1_wire;
// wire [31:0] reg_read_data2_wire;
// wire [31:0] reg_write_data_wire;
// wire zero_flag;

processor uut(
  .clk(clk),
  .reset(reset),
  .instruction(instruction),
  // .result(result),

  .counter_val_o(counter_val_o),

  .reg_read_data21_wire(reg_read_data21_wire),
  .reg_read_data22_wire(reg_read_data22_wire),
  .reg_write_data2_wire(reg_write_data2_wire),


  .mem_write_data2_wire(mem_write_data2_wire)
  // .reg_read_data1_wire(reg_read_data1_wire),
  // .reg_read_data2_wire(reg_read_data2_wire),
  // .reg_write_data_wire(reg_write_data_wire)
  // .zero_flag(zero_flag)
);

always @(posedge clk) begin
    $display("CVL = %b",counter_val_o);
    $display("RD1 = %b",reg_read_data21_wire);
    // $display("RD2 = %b",reg_read_data22_wire);
    $display("RWD = %b",reg_write_data2_wire);
    $display("RWDM = %b\n",mem_write_data2_wire);
    // $display("result = %b\n",result);
end


initial begin
  
  clk = 0;
  reset = 0;
  // instruction = 32'b0;

  // instruction = 32'b00010100000001000011110000111100;  // add 0,1
  //                           reg1 reg2 imd_data
  // instruction = 32'b01 0101 0000 0001 00001111 0000111100;  // add r1,15
  // instruction = 32'b01010100000001000011110000111100;  // add r0,16
  // instruction = 32'b11 0000 0000 0001 00000011 0000111100;  // LD r0,[3]
  // instruction = 32'b11000000000001000000110000111100;  // LD r0,[3]

  // instruction = 32'b11000000000001000001110000111100;  // LD r0,[3]
  // #10;
  

  instruction = 32'b11100000000001000000010000111100;  // VLD r0,[1]

  // result toiri hoye gese because cu,reg,alu works combinationaly 
  // but reg update after this cycle
  #10;
  // instruction = 32'b01010100000001000100010000111100;  // add ,15
  // instruction = 32'b11 0000 0001 0001 00000100 0000111100;  // LD r1,[4]
  // instruction = 32'b11000000010001000000110000111100;  // LD r1,[3]
  // instruction = 32'b11000000010001000000100000111100;  // LD r1,[2]

  // // instruction = 32'b01010100000001000011110000111100;  // add 0,1,15
  
  // // // instruction = 32'b00010100000010000011110000111100;  // add 0,1,0
  #10;

  // instruction = 32'b00 0101 0000 0001 00001111 0000111100;  // add r0, r1
  // instruction = 32'b00 0101 0000 0001 00001111 0000111100;  // add r0, r1
  // instruction = 32'b00010100000001000011110000111100;  // add r0, r1

  // #10;
  // instruction = 32'b00010100000001000011110000111100;  // add r0, r1

  #10;

  // instruction = 32'b11 0100 0000 0001 00000011 0000111100;  // ST r0,[3]
  // instruction = 32'b11010000000001000000110000111100;  // ST r0,[3]

  // #10;
  // instruction = 32'b0;  // ST r0,[3]

  // #10;

  // instruction = 32'b11000000000001000000110000111100;  // LD r0,[3]

  // #10;

  // instruction = 32'b11000000010001000000110000111100;  // LD r1,[3]

  // #10;

  // instruction = 32'b00010100000001000011110000111100;  // add r0, r1

  #10;

  instruction = 32'b11000000000001000000110000111100;  // LD r0,[3]
  #10;

  // instruction = 32'b11000000000001000000110000111100;  // LD r0,[3]


    instruction = 32'b11110000000001000000010000111100;  // VST [1], r0

  #10;#10;#10;#10;

  // #10;

  instruction = 32'b11100000000001000000000000111100;  // VLD r0,[1]
  #10;#10;#10;#10;
  


  









  $finish;


end

// initial begin
//   $monitor("result = %b ",result);
// end


always begin
    #5 clk = ~clk;
end

endmodule
