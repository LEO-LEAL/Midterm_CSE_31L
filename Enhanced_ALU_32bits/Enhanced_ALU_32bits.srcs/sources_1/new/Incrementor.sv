`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2017 09:59:19 PM
// Design Name: 
// Module Name: Incrementor
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


module Incrementor(
    input logic [31:0] a,
    output logic cf, of, zf, sf,
    output logic [31:0] out
    );
    
    logic [32:0] sum;
    assign sum = a + 1;
    
    assign out = sum[31:0];
    assign cf = sum[32];
    assign of = ((a[31] == 0) & (a[31]!=out[31]));
    assign zf = (out == 0);
    //assign sf = 
    
endmodule
