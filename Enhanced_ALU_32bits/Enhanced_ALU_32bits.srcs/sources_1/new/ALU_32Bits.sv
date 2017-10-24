`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2017 02:47:59 PM
// Design Name: 
// Module Name: ALU_32Bits
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


module ALU_32Bits(A, B, Op_Code, Out, cf, of, zf, sf);

    input  logic [31:0] A;
    input  logic [31:0] B;
    input  logic [ 3:0] Op_Code;
    output logic [31:0] Out;
    output logic cf;
    output logic of;
    output logic zf;
    output logic sf;
    
    logic [31:0] b0000, b0001, b0010, b0011, b0100, b0101, b0110, b0111, b1000, b1001, b1010, b1011;
    
    
    
    
    
    
    
    logic [31:0] first_sel0, first_sel1,  first_sel2,  first_sel3,  first_sel4,  first_sel5;
    logic [31:0] second_sel0, second_sel1,  second_sel2;
    logic [31:0] third_sel0, third_sel1;

    assign first_sel0 = Op_Code[0] ? b0001 : b0000;
    assign first_sel1 = Op_Code[0] ? b0011 : b0010;
    assign first_sel2 = Op_Code[0] ? b0101 : b0100;
    assign first_sel3 = Op_Code[0] ? b0111 : b0110;
    assign first_sel4 = Op_Code[0] ? b1001 : b1000;
    assign first_sel5 = Op_Code[0] ? b1011 : b1010;
    
    assign second_sel0 = Op_Code[1] ? first_sel1 : first_sel0;
    assign second_sel1 = Op_Code[1] ? first_sel3 : first_sel2;
    assign second_sel2 = Op_Code[1] ? first_sel5 : first_sel4;
     
    assign third_sel0 = Op_Code[2] ? second_sel1 : first_sel0;
    assign third_sel1 = second_sel2;
     
    assign Out = Op_Code[3] ? third_sel1 : third_sel0;
  
endmodule
