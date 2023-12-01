module top_module_test_TB;

    reg clk_100M;
    reg reset;

    wire cs;
    wire sclk;
    wire sen_rst;
    wire [9:0] wr_data_count;
    wire [9:0] rd_data_count;
    wire [1:0] led;
    wire [31:0] rand;

    top_module uut0(
        .clk_100M(clk_100M),
        .reset(reset),
        .sdin(rand[0]),
        .sen_rst(sen_rst),
        .cs(cs),
        .sclk(sclk),
        .wr_data_count(wr_data_count),
        .rd_data_count(rd_data_count),
        .led(led)
    );

    rand_gen uut1(
        .clk(clk_100M),
        .rst(reset),
        .sclk(sclk),
        .rand(rand)
    );

    initial begin
        clk_100M = 0;
        forever #5 clk_100M = ~clk_100M;
    end

    initial begin
        reset = 1;
        #1000 reset = 0;
    end

endmodule
