module regfile #(
parameter DATA_WIDTH = 64 ,
parameter ADDRESS_WIDTH = 5,
parameter REGISTER_SIZE = 2** ADDRESS_WIDTH
)(
input logic clk , rst, // Clock Signal
input logic RegWrite , // Register Write Signal , comes from control unit
input logic [ ADDRESS_WIDTH -1:0] ra1 , ra2 , wa , // Read address 1 // Read address 2 // Write address
input logic [ DATA_WIDTH -1:0] wd , // Write Data
output logic [ DATA_WIDTH -1:0] rd1 , rd2 // Read Data 1, Read Data 2
);

logic [REGISTER_SIZE-1 :0] reg_file [DATA_WIDTH - 1 :0]; //Creates a 32 X 64 register file
integer x;

always@ (posedge clk, negedge rst, negedge RegWrite)begin
    if(rst) begin //negative edge rst
        for(x =0 ; x <DATA_WIDTH;  x = x+1 ) begin
            reg_file[x] = 0;
        end
        
    end
    if(RegWrite) begin //negative edge write
        reg_file[wa] <= wd;
    end 
    else if(clk) begin
        rd1 <= reg_file[ra1];
        rd2 <= reg_file[ra2];
    end
end
endmodule
