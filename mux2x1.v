`timescale 1ns / 1ps

module mux2x1(a,b,s,c);
	input a,b,s;
	output c;
	assign c = ~s & a | s & b;
endmodule
