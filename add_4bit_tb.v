`timescale 1ns/1ps

module add_bit_tb;
  reg [3:0] a;
  reg [3:0] b;
  wire cout;
  wire [3:0] s;

  add_4bit uut(
    .a(a),
    .b(b),
    .cout(cout),
    .s(s)

  );

  initial begin
    // $dumpfile("add_bit.vcd");
    // $dumpvars(0,add_bit_tb);
    a=4'b0100;
    b=4'b0100;

    $display("S = %b", s);

    #20;

    // a=4'b1111;
    // b=4'b0101;
    $display("S = %b", s);

    #20
    
    $finish;
    
  end

  // initial begin
  //   $monitor("a = %b b = %b | cout = %b s = %b", a, b, cout, s);
  // end

endmodule



















