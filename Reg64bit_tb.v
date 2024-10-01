`timescale 1ns / 1ps
module Reg64bit_tb;

	// Inputs
	reg clk;
	reg rst;
	reg en;
	reg sh16;
	reg sh5;
	reg sr;
	reg [0:63] x;

	// Outputs
	wire [0:63] y;

	// Instantiate the Unit Under Test (UUT)
	Reg64bit uut (
		.clk(clk), 
		.rst(rst), 
		.en(en), 
		.sh16(sh16), 
		.sh5(sh5), 
		.sr(sr),
		.x(x), 
		.y(y)
	);

	initial begin
		clk = 0;
		forever  #10 clk = ~clk;
	end
	
	initial begin
		#20
		en=0;#20
		en=1;rst=1;sh16=0;sh5=0;x=64'h1234_5678_9abc_def0;#20;
		rst=0;sh16=1;sh5=0;#20;
		#20;
		sh16=0;sh5=1;#20;
		sh5=1;sr=1;#20;
		en=0;
		
	end
endmodule

