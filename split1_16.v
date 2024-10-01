`timescale 1ns / 1ps

module split1_16(a,b);
	input a;
	output [0:15]b;
	assign b = {a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a};
endmodule
