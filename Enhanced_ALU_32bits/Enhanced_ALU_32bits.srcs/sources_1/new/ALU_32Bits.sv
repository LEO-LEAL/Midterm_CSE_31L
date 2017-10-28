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
    logic [11:0] c = 12'b000000000000;
    logic [11:0] o = 12'b000000000000;
    logic [11:0] z = 12'b000000000000;
    logic [11:0] s = 12'b000000000000;
    
    Adder inst_1(A, B, c[0], o[0], z[0], s[0], b0000);
    Subtractor inst_2(A, B, c[1], o[1], z[1], s[1], b0001);
    Incrementor inst_3(A, c[2], o[2], z[2], s[2], b0010);
    Decrementor inst_4(A, o[3], z[3], s[3], b0011);
    Mover inst_5(A, z[4], s[4], b0100);
    Shifter inst_6(A, z[5], s[5], b0101);
    SIMD_ADD inst_7(A, B, c[6], o[6], z[6], s[6], b0110);
    AND inst_8(A, B, z[7], s[7], b0111);
    OR inst_9(A, B, z[8], s[8], b1000);
    XOR inst_10(A, B, z[9], s[9], b1001);
    Complementer inst_11(A, z[10], s[9], b1010);
    Twos_complementer inst_12(A, c[11], o[11], z[11], s[11], b1011);
    
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
    
    MUX_12bit_to_1bit inst_13(c, Op_Code, cf);
    MUX_12bit_to_1bit inst_14(o, Op_Code, of);
    MUX_12bit_to_1bit inst_15(z, Op_Code, zf);
    MUX_12bit_to_1bit inst_16(s, Op_Code, sf);
  
endmodule
