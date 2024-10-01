`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:01:22 08/01/2024
// Design Name:   full_cir
// Module Name:   D:/Verilog/future_ver1/full_cir_tb.v
// Project Name:  future_ver1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_cir
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module full_cir_tb;

	// Inputs
	reg clk;
	reg X_en;
	reg X_rst;
	reg X_sh16;
	reg X_sr;
	reg [0:63] X_in;
	reg K0_en;
	reg K0_rst;
	reg [0:63] K0_in;
	reg K1_en;
	reg K1_rst;
	reg [0:63] K1_in;
	reg K_sh16;
	reg K_sh5;
	reg RC_en;
	reg RC_rst;
	reg RC_sh16;
	reg RC_sh5;
	reg [0:63] RC_in;
	reg sm;
	reg b0;
	reg b1;
	reg b2;
	reg b3;

	// Outputs
	wire [0:63] cip;

	// Instantiate the Unit Under Test (UUT)
	full_cir uut (
		.clk(clk), 
		.X_en(X_en), 
		.X_rst(X_rst), 
		.X_sh16(X_sh16), 
		.X_sr(X_sr), 
		.X_in(X_in), 
		.K0_en(K0_en), 
		.cip(cip), 
		.K0_rst(K0_rst), 
		.K0_in(K0_in), 
		.K1_en(K1_en), 
		.K1_rst(K1_rst), 
		.K1_in(K1_in),  
		.K_sh16(K_sh16), 
		.K_sh5(K_sh5), 
		.RC_en(RC_en), 
		.RC_rst(RC_rst), 
		.RC_sh16(RC_sh16), 
		.RC_sh5(RC_sh5), 
		.RC_in(RC_in),  
		.sm(sm), 
		.b0(b0), 
		.b1(b1), 
		.b2(b2), 
		.b3(b3)
	);
	initial
	$dumpfile("full_cir.vcd");
	initial
	$dumpvars();
	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end
   initial begin
		#20;
		X_en = 1; X_rst = 1; X_in = 64'h8327_abcd_6783_553c; #20;
		K0_en = 1; K0_rst = 1; K0_in = 64'h2382_bcde_3298_abcd; #20;
		K0_rst = 0;
		K1_en = 1; K1_rst = 1; K1_in = 64'h2382_bcde_3298_abcd; #20;
		K1_rst = 0;
		RC_en = 1; RC_rst = 1; RC_in = 64'h1248_2481_4812_8124; #20;
		RC_rst = 0;
		b0 = 0; b1 = 0 ; b2 = 0; b3 = 0; #20;
		sm = 0; #20;
		X_rst = 0; #20;
	end
endmodule

