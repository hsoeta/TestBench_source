`timescale 1ns / 1ps

module sensor_ctrl_TB;

    reg clk_100M;
    reg clk_4M;
    reg sys_rst;

    wire [10:0] count;
    wire [8:0] data_count;
    wire [31:0] cycle_count;
    wire sen_rst;
    wire acq_timing;


    sensor_ctrl UUT0(
        .clk_100M   (clk_100M),
        .clk_4M     (clk_4M),
        .count      (count),
        .data_count (data_count),
        .cycle_count(cycle_count),
        .sys_rst    (sys_rst),
        .sen_rst    (sen_rst),
        .acq_timing (acq_timing)
    );

    parameter FREQ_100M = 10;
    parameter FREQ_4M   = 250;

    always begin
        #(FREQ_100M/2) clk_100M = ~clk_100M;
    end
    always begin
        #(FREQ_4M/2)   clk_4M   = ~clk_4M;
    end

    initial begin
        clk_100M = 1'b0;
        clk_4M   = 1'b0;
        sys_rst  = 1'b0;
        #100 sys_rst = 1'b1;
        #100 sys_rst = 1'b0;
    end

endmodule