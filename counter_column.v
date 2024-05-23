module counter_column(
    input wire clk,
    input wire reset,
    output wire [1:0] counter_val
);

reg [1:0] counter;

initial begin
  counter <= 2'b0;
end


  always @(posedge clk) begin

        if(!reset)begin
            counter <= counter + 2'b1;
        end else begin
            counter <= 2'b0;
        end
          



  end
  // always @(posedge clk or posedge reset) begin
  //     if (reset) begin
  //       counter <= 2'b0;

  //     end else begin

  //       counter <= counter + 2'b1;

  //     end
  // end

  assign counter_val = counter;


endmodule

// module program_counter (
//     input wire clk,
//     input wire reset,
//     input wire jump_en,
//     input wire [31:0] jump_addr,
//     output wire [31:0] addr
// );

//   reg [31:0] pc;

//   initial begin
//     pc <= 32'b0;
//   end

//   always @(posedge clk or posedge reset) begin
//     if (reset) begin
//       pc <= 32'b0;
//     end else if (jump_en == 1'b1) begin
//       pc <= pc + jump_addr;
//     end else begin
//       pc <= pc + 32'b1;
//     end
//   end

//   assign addr = pc;

// endmodule
