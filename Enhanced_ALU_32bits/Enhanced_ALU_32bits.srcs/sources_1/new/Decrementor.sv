`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2017 09:59:19 PM
// Design Name: 
// Module Name: Decrementor
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


module Decrementor(
    input logic [31:0] a,
    output logic of, zf, sf,
    output logic[31:0] out
    );
    
    assign out = a - 1;
    assign of = ((a[31] == 0) & (a[31]!=out[31]));
    assign zf = (out == 0);
    assign sf = (out[31] == 1);
    
endmodule
