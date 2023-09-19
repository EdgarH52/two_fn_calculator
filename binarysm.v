module binarysm (
	input [7:0] A,
	output reg [7:0] B);
	
	wire [7:0] c;
	wire [6:0] in;
	
	xor(in[0], A[7], A[0]);
	xor(in[1], A[7], A[1]);
	xor(in[2], A[7], A[2]);
	xor(in[3], A[7], A[3]);
	xor(in[4], A[7], A[4]);
	xor(in[5], A[7], A[5]);
	xor(in[6], A[7], A[6]);
	
	halfadder halfadder_0
(
	.s(B[0]) ,	// output  s_sig
	.cout(c[0]) ,	// output  cout_sig
	.a(in[0]) ,	// input  a_sig
	.b(A[7]) 	// input  b_sig
);
	halfadder halfadder_1
(
	.s(B[1]) ,	// output  s_sig
	.cout(c[1]) ,	// output  cout_sig
	.a(in[1]) ,	// input  a_sig
	.b(c[0]) 	// input  b_sig
);
	halfadder halfadder_2
(
	.s(B[2]) ,	// output  s_sig
	.cout(c[2]) ,	// output  cout_sig
	.a(in[2]) ,	// input  a_sig
	.b(c[1]) 	// input  b_sig
);
	halfadder halfadder_3
(
	.s(B[3]) ,	// output  s_sig
	.cout(c[3]) ,	// output  cout_sig
	.a(in[3]) ,	// input  a_sig
	.b(c[2]) 	// input  b_sig
);
	halfadder halfadder_4
(
	.s(B[4]) ,	// output  s_sig
	.cout(c[4]) ,	// output  cout_sig
	.a(in[4]) ,	// input  a_sig
	.b(c[3]) 	// input  b_sig
);
	halfadder halfadder_5
(
	.s(B[5]) ,	// output  s_sig
	.cout(c[5]) ,	// output  cout_sig
	.a(in[5]) ,	// input  a_sig
	.b(c[4]) 	// input  b_sig
);
	halfadder halfadder_6
(
	.s(B[6]) ,	// output  s_sig
	.cout(c[6]) ,	// output  cout_sig
	.a(in[6]) ,	// input  a_sig
	.b(c[5]) 	// input  b_sig
);
	halfadder halfadder_7
(
	.s(B[7]) ,	// output  s_sig
	.cout(c[7]) ,	// output  cout_sig
	.a(A[7]) ,	// input  a_sig
	.b(0) 	// input  b_sig
);

endmodule 