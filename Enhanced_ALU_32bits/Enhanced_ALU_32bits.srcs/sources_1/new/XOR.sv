`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2017 09:59:19 PM
// Design Name: 
// Module Name: XOR
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


module XOR(
    input logic [31:0] a, b,
    output logic zf,
    output logic[31:0] out
    );
    
    assign out = a ^ b;
    assign zf = (out == 0);
    
endmodule
