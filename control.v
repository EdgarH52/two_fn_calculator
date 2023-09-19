module control 
(
	input clk, enter, clr,
	output reg reset, loadA, loadB, loadZ, loadOU, IUAU,
	output st1, st0
);

reg [1:0] state, nextstate;
parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
wire in, clock;
assign st1 = state[1];
assign st0 = state[0];
divideXN #(6'd50, 3'd6) divideXN_1Mhz 
(
	.clk(clk) ,	// input  clk_sig
	.clr(clr) ,	// input  clr_sig	// output [M-1:0] count_sig
	.out(clock) 	// output  out_sig
);

edgedetect edgedetect_inst
(
	.in(enter) ,	// input  in_sig
	.clock(clock) ,	// input  clock_sig
	.out(in) 	// output  out_sig
);

always @(posedge in, negedge clr)
	if(clr==0) state <= s0;
		else state <= nextstate;  

	
always @(state, in)
	case(state)
		s0:if (~in)begin reset=1'b0;loadA=1'b1;loadB=1'b1;loadZ=1'b1;loadOU=1'b1;IUAU=1'b0;nextstate=s1;end 
		s1:if (~in)begin reset=1'b1;loadA=1'b0;loadB=1'b1;loadZ=1'b1;loadOU=1'b0;IUAU=1'b0;nextstate=s2;end
		s2:if (~in)begin reset=1'b1;loadA=1'b1;loadB=1'b0;loadZ=1'b1;loadOU=1'b0;IUAU=1'b0;nextstate=s3;end
		s3:if (~in)begin reset=1'b1;loadA=1'b1;loadB=1'b1;loadZ=1'b0;loadOU=1'b0;IUAU=1'b1;nextstate=s3;end
	endcase 
	
endmodule
