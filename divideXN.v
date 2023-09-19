module divideXN #(parameter N=10, parameter M=4)
	(
	input clk, clr,
	output reg [M-1:0] count,
	output reg out
	);
	always@(negedge clk, negedge clr)
		if(clr==1'b0) count<=0;
			else
			begin
				if(count==N-2'd2) begin out<=1'b1;count<=N-1'd1;end
					else
				if(count==N-1'd1) begin out<=1'b0;count<=0;end
					else begin out<=1'b0;count<=count+1'b1;end
			end
endmodule 