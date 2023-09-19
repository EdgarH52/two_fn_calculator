module IU
(
	input clk,
	input reset,
	input [3:0] ROW,
	output [3:0] COL, VAL,
	output [7:0] twos,
	output trig
);

wire [15:0] bcd;
wire [7:0] sm;

keypad_input #(3'd4) keypad_input_0 
(
	.clk(clk) ,	// input  clk_sig
	.reset(reset) ,	// input  reset_sig
	.row(ROW) ,	// input [3:0] row_sig
	.col(COL) ,	// output [3:0] col_sig
	.out(bcd) ,	// output [DIGITS*4-1:0] out_sig
	.value(VAL) ,	// output [3:0] value_sig
	.trig(trig) 	// output  trig_sig
);

BCD_SM #(4'd8) BCD_SM_inst 
(
	.BCD(bcd) ,	// input [15:0] BCD_sig
	.binarySM(sm) 	// output [N-1:0] binarySM_sig
);

binarysm binarysm_inst
(
	.A(sm) ,	// input [7:0] A_sig
	.B(twos) 	// output [7:0] B_sig
);

endmodule 