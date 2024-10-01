`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:58:12 08/12/2024
// Design Name:   counter
// Module Name:   D:/Verilog/future_ver1/counter_tb.v
// Project Name:  future_ver1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_tb;

	// Inputs
	reg clk;
	reg en;
	reg rst;
	reg b0;
	reg b1;
	reg b2;
	reg b3;
	reg B0;
	reg B1;
	reg Xr;
	reg X6;
	reg K6;
	reg K5;
	reg C6;
	reg sm;

	// Outputs
	wire d0;
	wire d1;
	wire d2;
	wire d3;
	wire C0;
	wire C1;
	wire Yr;
	wire Y6;
	wire L6;
	wire L5;
	wire D6;
	wire sm1;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk(clk), 
		.en(en), 
		.rst(rst), 
		.b0(b0), 
		.b1(b1), 
		.b2(b2), 
		.b3(b3), 
		.B0(B0), 
		.B1(B1), 
		.Xr(Xr), 
		.X6(X6), 
		.K6(K6), 
		.K5(K5), 
		.C6(C6), 
		.sm(sm), 
		.d0(d0), 
		.d1(d1), 
		.d2(d2), 
		.d3(d3), 
		.C0(C0), 
		.C1(C1), 
		.Yr(Yr), 
		.Y6(Y6), 
		.L6(L6), 
		.L5(L5), 
		.D6(D6), 
		.sm1(sm1)
	);
	initial begin
		clk = 0;
		forever #10 clk = ~clk ;
	end
	initial begin
		en = 1;
		rst = 1;
		b0 = 0;
		b1 = 0;
		b2 = 0;
		b3 = 0;
		B0 = 0;
		B1 = 0;
		Xr = 0;
		X6 = 0;
		K6 = 0;
		K5 = 0;
		C6 = 0;
		sm = 0;

		// Wait 100 ns for global reset to finish
		#20;
		rst = 0;
        
		// Add stimulus here

	end
      
endmodule

