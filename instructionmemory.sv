module instructionmemory #(
parameter INS_ADDRESS = 9,
parameter INS_W = 32
)(
input logic [ INS_ADDRESS -1:0] ra , // Read address of the instruction memory , comes from PC
output logic [ INS_W -1:0] rd // Read Data
);

(* ram_style = " block " *) logic [ INS_W -1:0] ins_mem [(2** INS_ADDRESS ) -1:0];

assign rd =  ins_mem[ra];

endmodule
