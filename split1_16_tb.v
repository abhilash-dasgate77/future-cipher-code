`timescale 1ns / 1ps

module split1_16_tb;

	// Inputs
	reg a;

	// Outputs
	wire [0:15] b;

	// Instantiate the Unit Under Test (UUT)
	split1_16 uut (
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

