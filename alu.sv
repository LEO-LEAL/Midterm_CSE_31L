module alu #(
parameter DATA_WIDTH = 64 ,
parameter OPCODE_LENGTH = 4
)(
input logic [ DATA_WIDTH -1:0] SrcA ,
input logic [ DATA_WIDTH -1:0] SrcB ,
input logic [ OPCODE_LENGTH -1:0] ALUCC ,
output logic [ DATA_WIDTH -1:0] ALUResult
);



assign ALUResult = (ALUCC == 4'b0000) ? SrcA & SrcB : 
    ((ALUCC == 4'b0001) ? SrcA | SrcB : 
    ((ALUCC == 4'b0010) ? SrcA + SrcB :
    ((ALUCC == 4'b0110) ? SrcA - SrcB :
    4'bx)));

endmodule
