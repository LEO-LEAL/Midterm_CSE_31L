module mux2 #(
parameter WIDTH = 64
)(
input logic [ WIDTH -1:0] d0 , d1 ,
input logic s ,
output logic [ WIDTH -1:0] y
);

assign y = s ? d0 : d1;

endmodule
