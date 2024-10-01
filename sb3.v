`timescale 1ns / 1ps

module sb3(x0,x1,x2,x3,y0,y1,y2,y3);
	input x0,x1,x2,x3;
	output y0,y1,y2,y3;
	assign y3 = ( x0 & x2 ) ^ x3;
	assign y2 = x2;
	assign y1 = x1;
	assign y0 = x0;
endmodule
