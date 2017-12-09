module datapath #(
parameter PC_W = 9, // Program Counter
parameter INS_W = 32 , // Instruction Width
parameter RF_ADDRESS = 5 , // Register File Address
parameter DATA_W = 64 , // Data WriteData
parameter DM_ADDRESS = 9 , // Data Memory Address
parameter ALU_CC_W = 4 // ALU Control Code Width
)(
input logic clk , reset , // global clock
// reset , sets the PC to zero
RegWrite , MemtoReg , //R- file writing enable // Memory or ALU MUX
ALUsrc , MemWrite , //R- file or Immediate MUX // Memroy Writing Enable
MemRead , // Memroy Reading Enable
input logic [ ALU_CC_W -1:0] ALU_CC // ALU Control Code ( input of the ALU )
);

// Step 0 Declaring all temporary variables that will be used

logic [8:0] a,b ; //temp variable for PC Counter address and its increment by 4
logic  [31:0] c, d; //temp holding variables for 32 bit instruction line 
logic [4:0] rs1, rs2, rd; //Register Source 1, Register source 2, Register Destination
logic num4 = 9'b000000100; //Just the number 4 for adding to PC
logic [11:0] itypeimmediate; //temp value for immediate value for I type Instructions
logic [63:0] ro1, ro2; //outputs of registerfile 
logic [63:0] temp_imm; //temp variable for immediate gen
logic [63:0] mux_a; //temp value for 1st muliplexer output
logic [63:0] mux_b; //temp value for 2nd multiplexer output
logic [63:0] tempaluresult;
logic [63:0] datamemoryresult;
//logic memread = MemRead; //MemRead and MemWrite share port names with top module, this brought about some issues
//logic memwrite = MemWrite;

//PART 1: instatiation of PC and adder 

initial begin // I'm not sure if this needs a sequential block. But it makes sense since we want the value of PC to change after we take the initial addresss, not in parallel (while)

assign a = flopr( .d(b), .q()); //this is the PC Counter, it takes in the value of the adder as input (aka instruction address) and spits it back out at the posedge of the clock

assign b = adder(.a(a), .b(num4), .y() ); //adder takes in current PC Counter addres & adds 4 to it

end


//Part 2 Instatiation of Instruction Memory

assign c = instructionmemory( 
                    .ra (a),//a is the pccounteraddress)
                    .rd () );

assign rs1 = c[19:15];
assign rs2 = c[24:20];
assign rsd = c[11:7];

//Part 3 Instatiation of register file 

regfile( .clk (clk),
            .rst(rst),
                .RegWrite(RegWrite),
                    .ra1(rs1), //the following lines form wires from InstructionMemory to RegisterFile linking rs1,rs2,and rd to the Resgisters
                        .ra2(rs2),
                            .wa(rd),
                                .wd(mux_b),               
                                    .rd1(ro1),//keep in mind these  variable (ro1 and ro2) are declared in Part 0
                                        .rd2(ro2) );
//Part 4 Instatiation of Immediate_gen
                                        
imm_Gen (.inst_code(c),
            .Imm_out(temp_imm));
            
//Part 5 First Multiplexer Instatiation


 mux2( d0(ro1), // ro1 is first register output 
                      d1(temp_imm), //temp imm is immediate gen output
                        s(ALUsrc), //the ALU signal from controller
                           y(mux_a), //not sure if the we should still specify the output port as mux 1, if we are assigning the output to mux1
                            );
// Part 6 ALU Instatiation

alu( SrcA(ro1),
            SrcB(mux_a),
                ALUCC(ALU_CC),
                    ALUResult(tempaluresult)
                  );
//Part 7 Data Memory Instatiation

datamemory( .MemWrite(MemWrite),
                .MemRead(MemRead),
                    .wd(ro2),
                        .a(tempaluresult[8:0]),
                            .rd(datamemoryresult)
                            );
// Part 8 2nd Mux Instatiation

mux2( .s(MemtoReg),
           .d0(datamemoryresult),
                .d1(tempaluresult),
                    .y(mux_b)
                    ); 

                        


// Your Code . **/
endmodule
