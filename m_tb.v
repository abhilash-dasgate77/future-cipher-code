`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:03:26 07/17/2024
// Design Name:   m
// Module Name:   D:/Verilog/future/m_tb.v
// Project Name:  future
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: m
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module m_tb;

	// Inputs
	reg b0;
	reg b1;
	reg b2;
	reg b3;
	reg b4;
	reg b5;
	reg b6;
	reg b7;
	reg b8;
	reg b9;
	reg b10;
	reg b11;
	reg b12;
	reg b13;
	reg b14;
	reg b15;

	// Outputs
	wire c0;
	wire c1;
	wire c2;
	wire c3;
	wire c4;
	wire c5;
	wire c6;
	wire c7;
	wire c8;
	wire c9;
	wire c10;
	wire c11;
	wire c12;
	wire c13;
	wire c14;
	wire c15;

	// Instantiate the Unit Under Test (UUT)
	m uut (
		.b0(b0), 
		.b1(b1), 
		.b2(b2), 
		.b3(b3), 
		.b4(b4), 
		.b5(b5), 
		.b6(b6), 
		.b7(b7), 
		.b8(b8), 
		.b9(b9), 
		.b10(b10), 
		.b11(b11), 
		.b12(b12), 
		.b13(b13), 
		.b14(b14), 
		.b15(b15), 
		.c0(c0), 
		.c1(c1), 
		.c2(c2), 
		.c3(c3), 
		.c4(c4), 
		.c5(c5), 
		.c6(c6), 
		.c7(c7), 
		.c8(c8), 
		.c9(c9), 
		.c10(c10), 
		.c11(c11), 
		.c12(c12), 
		.c13(c13), 
		.c14(c14), 
		.c15(c15)
	);

	initial begin
		// Initialize Inputs
		b0 = 1;
		b1 = 0;
		b2 = 0;
		b3 = 0;
		b4 = 0;
		b5 = 0;
		b6 = 0;
		b7 = 0;
		b8 = 0;
		b9 = 0;
		b10 = 0;
		b11 = 0;
		b12 = 0;
		b13 = 0;
		b14 = 0;
		b15 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

