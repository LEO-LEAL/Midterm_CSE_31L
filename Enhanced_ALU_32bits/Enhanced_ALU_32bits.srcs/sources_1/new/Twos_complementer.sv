`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2017 09:59:19 PM
// Design Name: 
// Module Name: Twos_complementer
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


module Twos_complementer(
    input logic [31:0] a,
    output logic[31:0] out
    );
    
    logic [31:0] a_complement;
    
    assign a_complement = ~a;
    
    assign out = a_complement + 1;
    
endmodule
