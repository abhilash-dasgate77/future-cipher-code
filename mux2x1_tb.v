`timescale 1ns / 1ps


module mux2x1_tb;

	// Inputs
	reg a;
	reg b;
	reg s;

	// Outputs
	wire c;

	// Instantiate the Unit Under Test (UUT)
	mux2x1 uut (
		.a(a), 
		.b(b), 
		.s(s), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 1;
		s = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

