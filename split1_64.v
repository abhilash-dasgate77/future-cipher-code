`timescale 1ns / 1ps
module split1_64(a,b);
	input a;
	output [0:63]b;
	assign b = {a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a, a,a,a,a};
endmodule
