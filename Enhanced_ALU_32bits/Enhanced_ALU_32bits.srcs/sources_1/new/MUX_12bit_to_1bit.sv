`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2017 08:52:02 AM
// Design Name: 
// Module Name: MUX_12bit_to_1bit
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


module MUX_12bit_to_1bit(
    input logic [11:0] in,
    input logic [3:0] sel,
    output logic out
    );
    
    logic [31:0] first_sel0, first_sel1,  first_sel2,  first_sel3,  first_sel4,  first_sel5;
    logic [31:0] second_sel0, second_sel1,  second_sel2;
    logic [31:0] third_sel0, third_sel1;
    
    assign first_sel0 = sel[0] ? in[1] : in[0];
    assign first_sel1 = sel[0] ? in[3] : in[2];
    assign first_sel2 = sel[0] ? in[5] : in[4];
    assign first_sel3 = sel[0] ? in[7] : in[6];
    assign first_sel4 = sel[0] ? in[9] : in[8];
    assign first_sel5 = sel[0] ? in[11] : in[10];
        
    assign second_sel0 = sel[1] ? first_sel1 : first_sel0;
    assign second_sel1 = sel[1] ? first_sel3 : first_sel2;
    assign second_sel2 = sel[1] ? first_sel5 : first_sel4;
         
    assign third_sel0 = sel[2] ? second_sel1 : first_sel0;
    assign third_sel1 = second_sel2;
         
    assign out = sel[3] ? third_sel1 : third_sel0;
    
    
endmodule
