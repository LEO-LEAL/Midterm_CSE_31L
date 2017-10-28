`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2017 09:59:19 PM
// Design Name: 
// Module Name: Subtractor
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


module Subtractor(
    input logic [31:0] a, b,
    output logic[31:0] out
    );
    
    logic [31:0] b_complement;
    
    assign b_complement = ~b;
    
    assign out = a + b_complement + 1;
    
endmodule
