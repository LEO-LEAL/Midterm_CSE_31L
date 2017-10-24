`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2017 02:17:19 PM
// Design Name: 
// Module Name: Complementer
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


module Complementer(
    input logic [31:0] a, //32-bit input
    output logic [31:0] y //32-bit output
    );
    
    assign y = ~a;
    
endmodule
