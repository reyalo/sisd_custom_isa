module RegisterSet (
    input wire clk,               // Clock input
    input wire reset,            // Reset input
    input wire writeEnable,         // Write enable signal
    input wire [3:0] writeAddress,  // 1-bit write address
    input wire [31:0] writeData,     // 4-bit data to write
    input wire [3:0] readAddress1,   // 1-bit read address
    input wire [3:0] readAddress2,   // 1-bit read address
    output wire [31:0] readData1,      // 4-bit data read from the selected register
    output wire [31:0] readData2      // 4-bit data read from the selected register
);
integer i;
reg [31:0] registers [0:15];    // 4 4-bit registers

initial begin

    for (i = 0 ;i < 16; i = i + 1) begin
        registers[i] <= 31'b0;
    end

    registers[0] <= 0;
    registers[1] <= 1;
    registers[2] <= 2;

end


always @(posedge reset) begin
    for (i = 0 ;i < 16; i = i + 1) begin
        registers[i] <= 31'b0;
    end
end

// write data
always @(posedge clk) begin
    if (writeEnable) begin
        registers[writeAddress] <= writeData;
    end
end

// read data
assign readData1 = registers[readAddress1];
assign readData2 = registers[readAddress2];

endmodule
