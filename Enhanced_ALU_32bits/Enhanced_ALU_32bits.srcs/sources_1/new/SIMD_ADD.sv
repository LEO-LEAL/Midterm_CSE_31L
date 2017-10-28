`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2017 10:13:49 PM
// Design Name: 
// Module Name: SIMD_ADD
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


module SIMD_ADD(
    input logic [31:0] a, b,
    output logic[31:0] out
    );
    
    logic [7:0] sum1;
    logic [7:0] sum2;
    logic [7:0] sum3;
    logic [7:0] sum4;
    
    assign sum1 = a[7:0] + b[7:0];
    assign sum2 = a[15:8] + b[15:8];
    assign sum3 = a[23:16] + b[23:16];
    assign sum4 = a[31:24] + b[31:24];
    
    assign out = {sum4, sum3, sum2, sum1};
    
endmodule
