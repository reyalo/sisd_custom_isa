module add_bit(
  input a,
  input b,
  input cin,
  output cout,
  output s

);
  assign s = a ^ b ^ cin;
  assign cout = a&b | b&cin | cin&a;


endmodule