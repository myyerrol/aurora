/*
 * @Author      : myyerrol
 * @Date        : 2024-11-02 18:10:12
 * @LastEditors : myyerrol
 * @LastEditTime: 2024-12-26 11:25:38
 * @Description : Testbench.
 *
 * Copyright (c) 2024 by MEMDSL, All Rights Reserved.
 */

`timescale 1ns / 1ps

module reg_rst_y_mode_s_en_n_tb();

initial begin
    $dumpfile("build/reg_rst_y_mode_s_en_n_tb.vcd");
    $dumpvars(0, reg_rst_y_mode_s_en_n_tb);
end

parameter CYCLE      = 10;
parameter DATA_WIDTH = 32;

logic                      r_clk;
logic                      r_rst_n;
logic [DATA_WIDTH - 1 : 0] w_data;

always #(CYCLE / 2) r_clk = ~r_clk;

initial begin
    r_clk   = 1'b0;

    r_rst_n = 1'b0;
    w_data  = 32'hFFFF0000;
    #20;
    r_rst_n = 1'b1;
    w_data  = 32'hFFFF00FF;
    #20;
    r_rst_n = 1'b1;
    w_data  = 32'hFFFFFFFF;
    #20 $finish;
end

reg_rst_y_mode_s_en_n #(
    .DATA_WIDTH(DATA_WIDTH)
) u_reg_rst_y_mode_s_en_n(
    .i_clk  (r_clk),
    .i_rst_n(r_rst_n),
    .i_data (w_data),
    .o_data ()
);

endmodule
