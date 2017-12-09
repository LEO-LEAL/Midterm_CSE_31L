module flopr #(
parameter WIDTH = 9
)(
input logic clk , reset ,
input logic [ WIDTH -1:0] d ,
output logic [ WIDTH -1:0] q
);

always @(posedge clk)begin
    if(reset)begin
        q <= 9'b0;
    end 
    else begin
        q <= d;
    end
end 

endmodule