module twofnau1 (
	input [7:0] in,
	input loadA, loadB, loadZ, reset,
	input C0,
	output Cout, ovr,
	output [7:0] Z, A, B,
	output [0:6] hex0, hex1, hex2, hex3, hex4, hex5
	);
	
	wire [7:0] S;
	wire wa, wb, wz, wr;
	assign wa = ~loadA, wb = ~loadB, wz = ~loadZ;
	
	pipo pipo_0
(
	.D(in) ,	// input [N-1:0] D_sig
	.Q(A) ,	// output [N-1:0] Q_sig
	.CLK(wa) ,	// input  CLK_sig
	.CLR(reset) 	// input  CLR_sig
);

	pipo pipo_1
(
	.D(in) ,	// input [N-1:0] D_sig
	.Q(B) ,	// output [N-1:0] Q_sig
	.CLK(wb) ,	// input  CLK_sig
	.CLR(reset) 	// input  CLR_sig
);

rca rca_inst
(
	.A(A) ,	// input [7:0] A_sig
	.B(B) ,	// input [7:0] B_sig
	.C0(C0) ,	// input  C0_sig
	.S(S) ,	// output [7:0] S_sig
	.Cout(Cout) ,	// output  Cout_sig
	.ovr(ovr) 	// output  ovr_sig
);
	
	pipo pipo_2
(
	.D(S) ,	// input [N-1:0] D_sig
	.Q(Z) ,	// output [N-1:0] Q_sig
	.CLK(wz) ,	// input  CLK_sig
	.CLR(reset) 	// input  CLR_sig
);

sevenhex sevenhex_A0
(
	.w(A[7]) ,	// input  w_sig
	.x(A[6]) ,	// input  x_sig
	.y(A[5]) ,	// input  y_sig
	.z(A[4]) ,	// input  z_sig
	.a(hex0[0]) ,	// output  a_sig
	.b(hex0[1]) ,	// output  b_sig
	.c(hex0[2]) ,	// output  c_sig
	.d(hex0[3]) ,	// output  d_sig
	.e(hex0[4]) ,	// output  e_sig
	.f(hex0[5]) ,	// output  f_sig
	.g(hex0[6]) 	// output  g_sig
);

sevenhex sevenhex_A1
(
	.w(A[3]) ,	// input  w_sig
	.x(A[2]) ,	// input  x_sig
	.y(A[1]) ,	// input  y_sig
	.z(A[0]) ,	// input  z_sig
	.a(hex1[0]) ,	// output  a_sig
	.b(hex1[1]) ,	// output  b_sig
	.c(hex1[2]) ,	// output  c_sig
	.d(hex1[3]) ,	// output  d_sig
	.e(hex1[4]) ,	// output  e_sig
	.f(hex1[5]) ,	// output  f_sig
	.g(hex1[6]) 	// output  g_sig
);

sevenhex sevenhex_B0
(
	.w(B[7]) ,	// input  w_sig
	.x(B[6]) ,	// input  x_sig
	.y(B[5]) ,	// input  y_sig
	.z(B[4]) ,	// input  z_sig
	.a(hex2[0]) ,	// output  a_sig
	.b(hex2[1]) ,	// output  b_sig
	.c(hex2[2]) ,	// output  c_sig
	.d(hex2[3]) ,	// output  d_sig
	.e(hex2[4]) ,	// output  e_sig
	.f(hex2[5]) ,	// output  f_sig
	.g(hex2[6]) 	// output  g_sig
);

sevenhex sevenhex_B1
(
	.w(B[3]) ,	// input  w_sig
	.x(B[2]) ,	// input  x_sig
	.y(B[1]) ,	// input  y_sig
	.z(B[0]) ,	// input  z_sig
	.a(hex3[0]) ,	// output  a_sig
	.b(hex3[1]) ,	// output  b_sig
	.c(hex3[2]) ,	// output  c_sig
	.d(hex3[3]) ,	// output  d_sig
	.e(hex3[4]) ,	// output  e_sig
	.f(hex3[5]) ,	// output  f_sig
	.g(hex3[6]) 	// output  g_sig
);

sevenhex sevenhex_Z0
(
	.w(Z[7]) ,	// input  w_sig
	.x(Z[6]) ,	// input  x_sig
	.y(Z[5]) ,	// input  y_sig
	.z(Z[4]) ,	// input  z_sig
	.a(hex4[0]) ,	// output  a_sig
	.b(hex4[1]) ,	// output  b_sig
	.c(hex4[2]) ,	// output  c_sig
	.d(hex4[3]) ,	// output  d_sig
	.e(hex4[4]) ,	// output  e_sig
	.f(hex4[5]) ,	// output  f_sig
	.g(hex4[6]) 	// output  g_sig
);

sevenhex sevenhex_Z1
(
	.w(Z[3]) ,	// input  w_sig
	.x(Z[2]) ,	// input  x_sig
	.y(Z[1]) ,	// input  y_sig
	.z(Z[0]) ,	// input  z_sig
	.a(hex5[0]) ,	// output  a_sig
	.b(hex5[1]) ,	// output  b_sig
	.c(hex5[2]) ,	// output  c_sig
	.d(hex5[3]) ,	// output  d_sig
	.e(hex5[4]) ,	// output  e_sig
	.f(hex5[5]) ,	// output  f_sig
	.g(hex5[6]) 	// output  g_sig
);


endmodule 