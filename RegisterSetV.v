module RegisterSetV (
    input wire clk,               // Clock input
    input wire reset,            // Reset input
    input wire writeEnable,         // Write enable signal

    input wire [3:0] writeAddressR,  // col num
    input wire [1:0] writeAddressC,  // row num

    input wire [31:0] writeData,     // Each cell Data

    input wire [3:0] readAddress1,   // Read full row 
    input wire [3:0] readAddress2,   // Read full row

    output wire [31:0] readData1[3:0],  // take full row
    output wire [31:0] readData2[3:0]   // take full row
);
integer i, j, k;

reg [31:0] registers [0:15][0:3];    // 16*4 registers 32 bit

initial begin

    for (i = 0 ;i < 16; i = i + 1) begin
        for(j = 0; j < 4; j = j + 1)begin
            registers[i][j] <= 31'b0;
        end
    end

    registers[0][0] <= 0;
    registers[0][1] <= 1;
    registers[0][2] <= 2;
    registers[0][3] <= 3;

    registers[1][0] <= 0;
    registers[1][1] <= 1;
    registers[1][2] <= 2;
    registers[1][3] <= 3;

end


always @(posedge reset) begin
    for (i = 0 ;i < 16; i = i + 1) begin
        for(j = 0; j < 4; j = j + 1)begin
            registers[i][j] <= 31'b0;
        end
    end
end

// write data
always @(posedge clk) begin
    if (writeEnable) begin
        registers[writeAddressR][writeAddressC] <= writeData;
    end
end

// read data

// for(k = 0; k < 4; k = k + 1){

    // assign readData1[k] = registers[readAddress1][k];
    // assign readData2[k] = registers[readAddress2][k];
    assign readData1[0] = registers[readAddress1][0];
    assign readData2[0] = registers[readAddress2][0];
    assign readData1[1] = registers[readAddress1][1];
    assign readData2[1] = registers[readAddress2][1];
    assign readData1[2] = registers[readAddress1][2];
    assign readData2[2] = registers[readAddress2][2];
    assign readData1[3] = registers[readAddress1][3];
    assign readData2[3] = registers[readAddress2][3];

// }



endmodule
