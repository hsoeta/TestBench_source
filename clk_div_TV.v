`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/15 17:55:45
// Design Name: 
// Module Name: clk_div_TB
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


module clk_div_TB;

    reg clk_100M;
    reg reset;
    
    wire clk_80M;
    wire clk_20M;
    wire clk_4M;
    wire locked;

clk_div UUT0(
    .clk_100M (clk_100M),
    .clk_80M  (clk_80M),
    .clk_20M  (clk_20M),
    .clk_4M   (clk_4M),
    .locked   (locked),
    .clk_wiz_reset (reset)
);

parameter T = 10;

initial begin
    clk_100M = 0;
    reset = 0;
    #100 reset <= 1;
    #100 reset <= 0;
end

always begin
    #(T/2) clk_100M <= ~clk_100M;
end

endmodule