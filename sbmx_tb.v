`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:19:18 07/26/2024
// Design Name:   sbmx
// Module Name:   D:/Verilog/future_ver1/sbmx_tb.v
// Project Name:  future_ver1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sbmx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sbmx_tb;

	// Inputs
	reg [0:15] a;
	reg [0:15] s;

	// Outputs
	wire [0:15] c;

	// Instantiate the Unit Under Test (UUT)
	sbmx uut (
		.a(a), 
		.s(s), 
		.c(c)
	);

	initial begin
		a = 16'h1244;s = 16'hffff; #100;
        
		// Add stimulus here

	end
      
endmodule

