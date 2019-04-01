//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: TB
// Module Name: testbench
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module testbench();
`include "header.vh"
reg clk=0, rst=0;
wire [11:0] input_packet;
wire input_valid, output_ready;
reg [11:0] output_packet;
reg output_valid=0;


always
begin
    #5 clk=!clk;
end

initial
begin
    #100;
    @(posedge clk)
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/WS_output_20_40_100_1.txt"));
    /*simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/WS_output_20_40_100_2.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/WS_output_20_40_100_3.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/WS_output_20_40_100_4.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/WS_output_20_40_100_5.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/WS_output_20_40_100_6.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/WS_output_20_40_100_7.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/WS_output_20_40_100_8.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/WS_output_20_40_100_9.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/WS_output_20_40_100_10.txt"));
    average(100, $fopen("results/WS_output_20_40_100_1.txt", "r"),$fopen("results/WS_output_20_40_100_2.txt", "r"),$fopen("results/WS_output_20_40_100_3.txt", "r"),$fopen("results/WS_output_20_40_100_4.txt", "r"),$fopen("results/WS_output_20_40_100_5.txt", "r"),$fopen("results/WS_output_20_40_100_6.txt", "r"),$fopen("results/WS_output_20_40_100_7.txt", "r"),$fopen("results/WS_output_20_40_100_8.txt", "r"),$fopen("results/WS_output_20_40_100_9.txt", "r"),$fopen("results/WS_output_20_40_100_10.txt", "r"), $fopen("results/WS_output_20_40_100.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/BA_output_20_40_100_1.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/BA_output_20_40_100_2.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/BA_output_20_40_100_3.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/BA_output_20_40_100_4.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/BA_output_20_40_100_5.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/BA_output_20_40_100_6.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/BA_output_20_40_100_7.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/BA_output_20_40_100_8.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/BA_output_20_40_100_9.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/BA_output_20_40_100_10.txt"));
    average(100, $fopen("results/BA_output_20_40_100_1.txt", "r"),$fopen("results/BA_output_20_40_100_2.txt", "r"),$fopen("results/BA_output_20_40_100_3.txt", "r"),$fopen("results/BA_output_20_40_100_4.txt", "r"),$fopen("results/BA_output_20_40_100_5.txt", "r"),$fopen("results/BA_output_20_40_100_6.txt", "r"),$fopen("results/BA_output_20_40_100_7.txt", "r"),$fopen("results/BA_output_20_40_100_8.txt", "r"),$fopen("results/BA_output_20_40_100_9.txt", "r"),$fopen("results/BA_output_20_40_100_10.txt", "r"), $fopen("results/BA_output_20_40_100.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/ER_output_20_40_100_1.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/ER_output_20_40_100_2.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/ER_output_20_40_100_3.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/ER_output_20_40_100_4.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/ER_output_20_40_100_5.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/ER_output_20_40_100_6.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/ER_output_20_40_100_7.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/ER_output_20_40_100_8.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/ER_output_20_40_100_9.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 40, 100, $fopen("results/ER_output_20_40_100_10.txt"));
    average(100, $fopen("results/ER_output_20_40_100_1.txt", "r"),$fopen("results/ER_output_20_40_100_2.txt", "r"),$fopen("results/ER_output_20_40_100_3.txt", "r"),$fopen("results/ER_output_20_40_100_4.txt", "r"),$fopen("results/ER_output_20_40_100_5.txt", "r"),$fopen("results/ER_output_20_40_100_6.txt", "r"),$fopen("results/ER_output_20_40_100_7.txt", "r"),$fopen("results/ER_output_20_40_100_8.txt", "r"),$fopen("results/ER_output_20_40_100_9.txt", "r"),$fopen("results/ER_output_20_40_100_10.txt", "r"), $fopen("results/ER_output_20_40_100.txt"));
    
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/WS_output_30_10_100_1.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/WS_output_30_10_100_2.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/WS_output_30_10_100_3.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/WS_output_30_10_100_4.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/WS_output_30_10_100_5.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/WS_output_30_10_100_6.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/WS_output_30_10_100_7.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/WS_output_30_10_100_8.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/WS_output_30_10_100_9.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/WS_output_30_10_100_10.txt"));
    average(100, $fopen("results/WS_output_30_10_100_1.txt", "r"),$fopen("results/WS_output_30_10_100_2.txt", "r"),$fopen("results/WS_output_30_10_100_3.txt", "r"),$fopen("results/WS_output_30_10_100_4.txt", "r"),$fopen("results/WS_output_30_10_100_5.txt", "r"),$fopen("results/WS_output_30_10_100_6.txt", "r"),$fopen("results/WS_output_30_10_100_7.txt", "r"),$fopen("results/WS_output_30_10_100_8.txt", "r"),$fopen("results/WS_output_30_10_100_9.txt", "r"),$fopen("results/WS_output_30_10_100_10.txt", "r"), $fopen("results/WS_output_30_10_100.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/BA_output_30_10_100_1.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/BA_output_30_10_100_2.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/BA_output_30_10_100_3.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/BA_output_30_10_100_4.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/BA_output_30_10_100_5.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/BA_output_30_10_100_6.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/BA_output_30_10_100_7.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/BA_output_30_10_100_8.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/BA_output_30_10_100_9.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/BA_output_30_10_100_10.txt"));
    average(100, $fopen("results/BA_output_30_10_100_1.txt", "r"),$fopen("results/BA_output_30_10_100_2.txt", "r"),$fopen("results/BA_output_30_10_100_3.txt", "r"),$fopen("results/BA_output_30_10_100_4.txt", "r"),$fopen("results/BA_output_30_10_100_5.txt", "r"),$fopen("results/BA_output_30_10_100_6.txt", "r"),$fopen("results/BA_output_30_10_100_7.txt", "r"),$fopen("results/BA_output_30_10_100_8.txt", "r"),$fopen("results/BA_output_30_10_100_9.txt", "r"),$fopen("results/BA_output_30_10_100_10.txt", "r"), $fopen("results/BA_output_30_10_100.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/ER_output_30_10_100_1.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/ER_output_30_10_100_2.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/ER_output_30_10_100_3.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/ER_output_30_10_100_4.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/ER_output_30_10_100_5.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/ER_output_30_10_100_6.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/ER_output_30_10_100_7.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/ER_output_30_10_100_8.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/ER_output_30_10_100_9.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 30, 10, 100, $fopen("results/ER_output_30_10_100_10.txt"));
    average(100, $fopen("results/ER_output_30_10_100_1.txt", "r"),$fopen("results/ER_output_30_10_100_2.txt", "r"),$fopen("results/ER_output_30_10_100_3.txt", "r"),$fopen("results/ER_output_30_10_100_4.txt", "r"),$fopen("results/ER_output_30_10_100_5.txt", "r"),$fopen("results/ER_output_30_10_100_6.txt", "r"),$fopen("results/ER_output_30_10_100_7.txt", "r"),$fopen("results/ER_output_30_10_100_8.txt", "r"),$fopen("results/ER_output_30_10_100_9.txt", "r"),$fopen("results/ER_output_30_10_100_10.txt", "r"), $fopen("results/ER_output_30_10_100.txt"));
 
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/WS_output_90_70_100_1.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/WS_output_90_70_100_2.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/WS_output_90_70_100_3.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/WS_output_90_70_100_4.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/WS_output_90_70_100_5.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/WS_output_90_70_100_6.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/WS_output_90_70_100_7.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/WS_output_90_70_100_8.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/WS_output_90_70_100_9.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/WS_output_90_70_100_10.txt"));
    average(100, $fopen("results/WS_output_90_70_100_1.txt", "r"),$fopen("results/WS_output_90_70_100_2.txt", "r"),$fopen("results/WS_output_90_70_100_3.txt", "r"),$fopen("results/WS_output_90_70_100_4.txt", "r"),$fopen("results/WS_output_90_70_100_5.txt", "r"),$fopen("results/WS_output_90_70_100_6.txt", "r"),$fopen("results/WS_output_90_70_100_7.txt", "r"),$fopen("results/WS_output_90_70_100_8.txt", "r"),$fopen("results/WS_output_90_70_100_9.txt", "r"),$fopen("results/WS_output_90_70_100_10.txt", "r"), $fopen("results/WS_output_90_70_100.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/BA_output_90_70_100_1.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/BA_output_90_70_100_2.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/BA_output_90_70_100_3.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/BA_output_90_70_100_4.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/BA_output_90_70_100_5.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/BA_output_90_70_100_6.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/BA_output_90_70_100_7.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/BA_output_90_70_100_8.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/BA_output_90_70_100_9.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/BA_output_90_70_100_10.txt"));
    average(100, $fopen("results/BA_output_90_70_100_1.txt", "r"),$fopen("results/BA_output_90_70_100_2.txt", "r"),$fopen("results/BA_output_90_70_100_3.txt", "r"),$fopen("results/BA_output_90_70_100_4.txt", "r"),$fopen("results/BA_output_90_70_100_5.txt", "r"),$fopen("results/BA_output_90_70_100_6.txt", "r"),$fopen("results/BA_output_90_70_100_7.txt", "r"),$fopen("results/BA_output_90_70_100_8.txt", "r"),$fopen("results/BA_output_90_70_100_9.txt", "r"),$fopen("results/BA_output_90_70_100_10.txt", "r"), $fopen("results/BA_output_90_70_100.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/ER_output_90_70_100_1.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/ER_output_90_70_100_2.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/ER_output_90_70_100_3.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/ER_output_90_70_100_4.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/ER_output_90_70_100_5.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/ER_output_90_70_100_6.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/ER_output_90_70_100_7.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/ER_output_90_70_100_8.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/ER_output_90_70_100_9.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 90, 70, 100, $fopen("results/ER_output_90_70_100_10.txt"));
    average(100, $fopen("results/ER_output_90_70_100_1.txt", "r"),$fopen("results/ER_output_90_70_100_2.txt", "r"),$fopen("results/ER_output_90_70_100_3.txt", "r"),$fopen("results/ER_output_90_70_100_4.txt", "r"),$fopen("results/ER_output_90_70_100_5.txt", "r"),$fopen("results/ER_output_90_70_100_6.txt", "r"),$fopen("results/ER_output_90_70_100_7.txt", "r"),$fopen("results/ER_output_90_70_100_8.txt", "r"),$fopen("results/ER_output_90_70_100_9.txt", "r"),$fopen("results/ER_output_90_70_100_10.txt", "r"), $fopen("results/ER_output_90_70_100.txt"));

    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/WS_output_20_50_100_1.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/WS_output_20_50_100_2.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/WS_output_20_50_100_3.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/WS_output_20_50_100_4.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/WS_output_20_50_100_5.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/WS_output_20_50_100_6.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/WS_output_20_50_100_7.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/WS_output_20_50_100_8.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/WS_output_20_50_100_9.txt"));
    simulateSISmodel($fopen("matrices/WS_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/WS_output_20_50_100_10.txt"));
    average(100, $fopen("results/WS_output_20_50_100_1.txt", "r"),$fopen("results/WS_output_20_50_100_2.txt", "r"),$fopen("results/WS_output_20_50_100_3.txt", "r"),$fopen("results/WS_output_20_50_100_4.txt", "r"),$fopen("results/WS_output_20_50_100_5.txt", "r"),$fopen("results/WS_output_20_50_100_6.txt", "r"),$fopen("results/WS_output_20_50_100_7.txt", "r"),$fopen("results/WS_output_20_50_100_8.txt", "r"),$fopen("results/WS_output_20_50_100_9.txt", "r"),$fopen("results/WS_output_20_50_100_10.txt", "r"), $fopen("results/WS_output_20_50_100.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/BA_output_20_50_100_1.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/BA_output_20_50_100_2.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/BA_output_20_50_100_3.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/BA_output_20_50_100_4.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/BA_output_20_50_100_5.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/BA_output_20_50_100_6.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/BA_output_20_50_100_7.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/BA_output_20_50_100_8.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/BA_output_20_50_100_9.txt"));
    simulateSISmodel($fopen("matrices/BA_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/BA_output_20_50_100_10.txt"));
    average(100, $fopen("results/BA_output_20_50_100_1.txt", "r"),$fopen("results/BA_output_20_50_100_2.txt", "r"),$fopen("results/BA_output_20_50_100_3.txt", "r"),$fopen("results/BA_output_20_50_100_4.txt", "r"),$fopen("results/BA_output_20_50_100_5.txt", "r"),$fopen("results/BA_output_20_50_100_6.txt", "r"),$fopen("results/BA_output_20_50_100_7.txt", "r"),$fopen("results/BA_output_20_50_100_8.txt", "r"),$fopen("results/BA_output_20_50_100_9.txt", "r"),$fopen("results/BA_output_20_50_100_10.txt", "r"), $fopen("results/BA_output_20_50_100.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/ER_output_20_50_100_1.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/ER_output_20_50_100_2.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/ER_output_20_50_100_3.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/ER_output_20_50_100_4.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/ER_output_20_50_100_5.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/ER_output_20_50_100_6.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/ER_output_20_50_100_7.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/ER_output_20_50_100_8.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/ER_output_20_50_100_9.txt"));
    simulateSISmodel($fopen("matrices/ER_adjacencyMatrix.txt","r"), 20, 50, 100, $fopen("results/ER_output_20_50_100_10.txt"));
    average(100, $fopen("results/ER_output_20_50_100_1.txt", "r"),$fopen("results/ER_output_20_50_100_2.txt", "r"),$fopen("results/ER_output_20_50_100_3.txt", "r"),$fopen("results/ER_output_20_50_100_4.txt", "r"),$fopen("results/ER_output_20_50_100_5.txt", "r"),$fopen("results/ER_output_20_50_100_6.txt", "r"),$fopen("results/ER_output_20_50_100_7.txt", "r"),$fopen("results/ER_output_20_50_100_8.txt", "r"),$fopen("results/ER_output_20_50_100_9.txt", "r"),$fopen("results/ER_output_20_50_100_10.txt", "r"), $fopen("results/ER_output_20_50_100.txt")); 
    */    
    $finish;
end

networkOnChip SISNOC(
clk,
rst,
output_packet,
output_valid,
output_ready,
input_packet,
input_valid,
1'b1
);

endmodule