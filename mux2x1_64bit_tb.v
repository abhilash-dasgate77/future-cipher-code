`timescale 1ns / 1ps


module mux2x1_64bit_tb;

	// Inputs
	reg [0:63] a;
	reg [0:63] b;
	reg [0:63] s;

	// Outputs
	wire [0:63] c;

	// Instantiate the Unit Under Test (UUT)
	mux2x1_64bit uut (
		.a(a), 
		.b(b), 
		.s(s), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 64'h4384_7844_1712_0101;
		b = 64'h5584_7844_1712_0101;
		s = 64'hffff_ffff_ffff_ffff;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

