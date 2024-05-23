`timescale 1ps/1ps

module add_bit_tb;
  reg a;
  reg b;
  reg cin;
  wire cout;
  wire s;

  add_bit uut(
    .a(a),
    .b(b),
    .cin(cin),
    .cout(cout),
    .s(s)

  );

  initial begin
    // $dumpfile("add_bit.vcd");
    // $dumpvars(0,add_bit_tb);
    a=0;
    b=0;
    cin=0;

    #20;
    b=1;

    #20;
    a=1;
    b=0;

    #20;
    b=1;

    #20;

    $finish;
    
  end

  initial begin
    $monitor("a = %b b = %b cin = %b | cout = %b s = %b", a, b, cin,cout,s);
  end

endmodule