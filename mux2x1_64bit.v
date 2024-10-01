`timescale 1ns / 1ps

module mux2x1_16bit(a,b,s,c);
	input [0:15]a,b,s;
	output [0:15]c;
	assign c = ~s & a | s & b;
	initial begin
		$monitor("time  = %d, a,b,s,c = %x,%x,%x,%x, (mux)",$time,a,b,s,c);
	end
endmodule
