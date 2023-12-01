`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/10 16:23:30
// Design Name: 
// Module Name: ad1_spi_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ad1_spi_TB;

    reg CLK100M;
    reg RST;
    wire CS;
    wire [1:0] STATE;
    reg SDIN_0;
    reg SDIN_1;
    wire SCLK;
    wire DRDY;
    wire [31:0] COUNT_0;
    wire [31:0] COUNT_1;
    wire [15:0] SHFT_0;
    wire [15:0] SHFT_1;
    wire [15:0] DOUT_0;
    wire [15:0] DOUT_1;
    
    
    ad1_spi uut(
        .clk (CLK100M),
        .rst (RST),
        .cs  (CS),
        //.state (STATE),
        .sdin0 (SDIN_0),
        .sdin1 (SDIN_1),
        .sclk  (SCLK),
        .drdy  (DRDY),
        //.count0 (COUNT_0),
        //.count1 (COUNT_1),
        //.shft0 (SHFT_0),
        //.shft1 (SHFT_1),
        .dout0 (DOUT_0),
        .dout1 (DOUT_1)
        );
      
parameter PERIOD = 10;

initial begin
    CLK100M = 1'b0;
    RST = 1'b0;
    SDIN_0 = 1'b1;
    SDIN_1 = 1'b1;
end

always begin
    #(PERIOD/2) CLK100M = ~CLK100M;
end
        

endmodule
