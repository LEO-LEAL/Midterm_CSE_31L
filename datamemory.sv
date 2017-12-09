module datamemory #(
parameter DM_ADDRESS = 9 ,
parameter DATA_W = 64
)(
input logic MemRead , // comes from control unit
input logic MemWrite , // Comes from control unit
input logic [ DM_ADDRESS -1:0] a , // Read / Write address - 9 LSB bits of the ALU output
input logic [ DATA_W -1:0] wd , // Write Data
output logic [ DATA_W -1:0] rd // Read Data
);

(* ram_style = " block " *) logic [DATA_W - 1 :0] mem [DATA_W - 1 :0]; //creates a 64 X 64 memory


always @(*) begin
    if(MemWrite)begin
        mem[a] <= wd;
    end
    else if(MemRead)begin
        rd <= mem[a];
    end
end

endmodule