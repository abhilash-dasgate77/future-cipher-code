`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:20:32 07/27/2024
// Design Name:   xor64bit
// Module Name:   D:/Verilog/future_ver1/xor64bit_tb.v
// Project Name:  future_ver1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: xor64bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module xor64bit_tb;

	// Inputs
	reg [0:63] a;
	reg [0:63] b;

	// Outputs
	wire [0:63] c;

	// Instantiate the Unit Under Test (UUT)
	xor64bit uut (
		.a(a), 
		.b(b), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 64'h3423_6732_abcd_2331;
		b = 64'h0000_0000_0000_0001;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

