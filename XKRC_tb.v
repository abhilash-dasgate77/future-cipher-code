`timescale 1ns / 1ps
module XKRC_tb;
	// Inputs
	reg clk;
	reg K0_rst;
	reg K0_en;
	reg K0_sh16;
	reg K0_sh5;
	reg K1_rst;
	reg K1_en;
	reg K1_sh16;
	reg K1_sh5;
	reg RC1_rst;
	reg RC1_en;
	reg RC1_sh16;
	reg RC1_sh5;
	reg [0:63] K0_in;
	reg [0:63] K1_in;
	reg [0:15] sel_K0K1;
	reg [0:63] RC1_in;
	reg [0:15] sel_RC01;
	reg [0:63] X;

	// Outputs
	wire [0:15] Y;

	// Instantiate the Unit Under Test (UUT)
	XKRC uut (
		.clk(clk),
		.K0_rst(K0_rst), 
		.K0_en(K0_en), 
		.K0_sh16(K0_sh16), 
		.K0_sh5(K0_sh5), 
		.K1_rst(K1_rst), 
		.K1_en(K1_en), 
		.K1_sh16(K1_sh16), 
		.K1_sh5(K1_sh5), 
		.RC1_rst(RC1_rst), 
		.RC1_en(RC1_en), 
		.RC1_sh16(RC1_sh16), 
		.RC1_sh5(RC1_sh5), 
		.K0_in(K0_in), 
		.K1_in(K1_in), 
		.sel_K0K1(sel_K0K1), 
		.RC1_in(RC1_in), 
		.sel_RC01(sel_RC01), 
		.X(X), 
		.Y(Y)
	);

	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end
	initial begin
		// Initialize Inputs
		K0_rst = 1;
		K0_en = 1;
		K0_sh16 = 0;
		K0_sh5 = 0;
		K1_rst = 1;
		K1_en = 1;
		K1_sh16 = 0;
		K1_sh5 = 0;
		RC1_rst = 1;
		RC1_en = 1;
		RC1_sh16 = 0;
		RC1_sh5 = 0;
		K0_in = 64'h0001_0001_0001_0001;
		K1_in = 64'h0021_0021_0021_0021;
		sel_K0K1 = 0;
		RC1_in = 64'h0003_0003_0003_0003;
		sel_RC01 = 0;
		X = 64'h0005_0005_0005_0005;

		// Wait 100 ns for global reset to finish
		#20;
		
		// Initialize Inputs
		K0_rst = 0;
		K1_rst = 0;
		RC1_rst = 0;
		
		// Wait 100 ns for global reset to finish
		#20;
		
		K0_sh5 = 1; #20;
        
		// Add stimulus here

	end
      
endmodule

