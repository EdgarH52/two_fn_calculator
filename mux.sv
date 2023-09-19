module mux
(
	input [7:0] A, B,   //declare data inputs
	input S, //declare select input
	output [7:0] Y //declare output
);
assign Y = S==0 ? A : B; //select input
endmodule 