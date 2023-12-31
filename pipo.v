module pipo (D, Q, CLK, CLR);
	parameter N=8;
	input [N-1:0] D;
	input CLK, CLR;
	output reg [N-1:0] Q;
		always @(posedge CLK, negedge CLR)
			begin
				if(CLR==1'b0) Q<=0;
					else if(CLK==1'b1) Q<=D;
			end
endmodule 