module OU 
(
	input [7:0] A,
	output [6:0] hex0, hex1, hex2, hex3
);

reg [7:0] B;
wire [3:0] o, t;
wire [1:0] h;


binarysm binarysm_inst
(
	.A(A) ,	// input [7:0] A_sig
	.B(B) 	// output [7:0] B_sig
);

binary2bcd binary2bcd_inst
(
	.A({1'b0,B[6:0]}) ,	// input [7:0] A_sig
	.ONES(o) ,	// output [3:0] ONES_sig
	.TENS(t) ,	// output [3:0] TENS_sig
	.HUNDREDS(h) 	// output [1:0] HUNDREDS_sig
);

assign sign = A[7];
assign hex3 = sign == 1 ? 7'b0111111:7'b1111111;

sevenseg sevenseg_ones
(
	.w(o[3]) ,	// input  w_sig
	.x(o[2]) ,	// input  x_sig
	.y(o[1]) ,	// input  y_sig
	.z(o[0]) ,	// input  z_sig
	.a(hex0[0]) ,	// output  a_sig
	.b(hex0[1]) ,	// output  b_sig
	.c(hex0[2]) ,	// output  c_sig
	.d(hex0[3]) ,	// output  d_sig
	.e(hex0[4]) ,	// output  e_sig
	.f(hex0[5]) ,	// output  f_sig
	.g(hex0[6]) 	// output  g_sig
);

sevenseg sevenseg_tens
(
	.w(t[3]) ,	// input  w_sig
	.x(t[2]) ,	// input  x_sig
	.y(t[1]) ,	// input  y_sig
	.z(t[0]) ,	// input  z_sig
	.a(hex1[0]) ,	// output  a_sig
	.b(hex1[1]) ,	// output  b_sig
	.c(hex1[2]) ,	// output  c_sig
	.d(hex1[3]) ,	// output  d_sig
	.e(hex1[4]) ,	// output  e_sig
	.f(hex1[5]) ,	// output  f_sig
	.g(hex1[6]) 	// output  g_sig
);

sevenseg sevenseg_hundreds
(
	.w(0) ,	// input  w_sig
	.x(0) ,	// input  x_sig
	.y(h[1]) ,	// input  y_sig
	.z(h[0]) ,	// input  z_sig
	.a(hex2[0]) ,	// output  a_sig
	.b(hex2[1]) ,	// output  b_sig
	.c(hex2[2]) ,	// output  c_sig
	.d(hex2[3]) ,	// output  d_sig
	.e(hex2[4]) ,	// output  e_sig
	.f(hex2[5]) ,	// output  f_sig
	.g(hex2[6]) 	// output  g_sig
);
endmodule 