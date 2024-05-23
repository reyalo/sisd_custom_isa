module add_4bit(
  input [3:0] a, 
  input [3:0] b,
  output cout,
  output [3:0] s
);
// egulu holo je module ta toiri kora hocce tar port


wire cout0_cin1,cout1_cin2,cout2_cin3;


add_bit uut0(.a(a[0]), .b(b[0]), .cin(1'b0),       .cout(cout0_cin1), .s(s[0]));
add_bit uut1(.a(a[1]), .b(b[1]), .cin(cout0_cin1), .cout(cout1_cin2), .s(s[1]));
add_bit uut2(.a(a[2]), .b(b[2]), .cin(cout1_cin2), .cout(cout2_cin3), .s(s[2]));
add_bit uut3(.a(a[3]), .b(b[3]), .cin(cout2_cin3), .cout(cout),       .s(s[3]));

// .a mane holo add_bit module er port
// add_bit holo type of mudule used
// uut0 holo object or distinct connection of module


endmodule