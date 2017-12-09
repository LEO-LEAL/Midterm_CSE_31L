module imm_Gen (
input logic [31:0] inst_code ,
output logic [63:0] Imm_out 
);

const logic [6:0] opcode = inst_code[6:0];
logic [11:0] temp;


assign Imm_out = (opcode == 7'b0000011 || opcode == 7'b0010011 || opcode == 7'b1100111) ? {{52{inst_code[31]}}, inst_code[31:20]} :
    ((opcode == 7'b0100011) ? {{52{inst_code[31]}}, inst_code[31:25], inst_code[11:7]} :
    64'bx);
// this is a beautiful piece of code!!!
//always @(inst_code)begin 
//    if (opcode == 7'b0000011 || opcode == 7'b0010011 || opcode == 7'b1100111)//I-Type 
//        temp <= inst_code[31:20];
//    else if(opcode == 7'b0100011)//S-Type
//        temp <= {inst_code[31:25], inst_code[11:7]};
//end

//assign Imm_out = {{52 {temp[6]}}, temp};

endmodule
