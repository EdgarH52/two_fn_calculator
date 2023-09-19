module rca (
	input [7:0] A, B,
	input C0,
	output [7:0] S,
	output Cout, ovr);

	wire[7:0] C;
	wire[7:0] X;
		assign X[0]=C0^B[0];
		assign X[1]=C0^B[1];
		assign X[2]=C0^B[2];
		assign X[3]=C0^B[3];
		assign X[4]=C0^B[4];
		assign X[5]=C0^B[5];
		assign X[6]=C0^B[6];
		assign X[7]=C0^B[7];
		
	fulladdbehav s0 (A[0], X[0], C0, S[0], C[0]);
	fulladdbehav s1 (A[1], X[1], C[0], S[1], C[1]);
	fulladdbehav s2 (A[2], X[2], C[1], S[2], C[2]);
	fulladdbehav s3 (A[3], X[3], C[2], S[3], C[3]);
	fulladdbehav s4 (A[4], X[4], C[3], S[4], C[4]);
	fulladdbehav s5 (A[5], X[5], C[4], S[5], C[5]);
	fulladdbehav s6 (A[6], X[6], C[5], S[6], C[6]);
	fulladdbehav s7 (A[7], X[7], C[6], S[7], C[7]);
	
	assign Cout = C[7];
	assign ovr = C[7]^C[6];
endmodule 
	