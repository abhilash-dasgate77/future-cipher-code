`timescale 1ns / 1ps


module sb_tb;

	// Inputs
	reg x0;
	reg x1;
	reg x2;
	reg x3;

	// Outputs
	wire y0;
	wire y1;
	wire y2;
	wire y3;

	// Instantiate the Unit Under Test (UUT)
	sb uut (
		.x0(x0), 
		.x1(x1), 
		.x2(x2), 
		.x3(x3), 
		.y0(y0), 
		.y1(y1), 
		.y2(y2), 
		.y3(y3)
	);

	initial begin
		// Initialize Inputs
		x0 = 0;
		x1 = 0;
		x2 = 0;
		x3 = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		x0 = 1;
		x1 = 0;
		x2 = 0;
		x3 = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 0;
		x1 = 1;
		x2 = 0;
		x3 = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 1;
		x1 = 1;
		x2 = 0;
		x3 = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 0;
		x1 = 0;
		x2 = 1;
		x3 = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 1;
		x1 = 0;
		x2 = 1;
		x3 = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 0;
		x1 = 1;
		x2 = 1;
		x3 = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 1;
		x1 = 1;
		x2 = 1;
		x3 = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 0;
		x1 = 0;
		x2 = 0;
		x3 = 1;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 1;
		x1 = 0;
		x2 = 0;
		x3 = 1;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 0;
		x1 = 1;
		x2 = 0;
		x3 = 1;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 1;
		x1 = 1;
		x2 = 0;
		x3 = 1;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 0;
		x1 = 0;
		x2 = 1;
		x3 = 1;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 1;
		x1 = 0;
		x2 = 1;
		x3 = 1;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 0;
		x1 = 1;
		x2 = 1;
		x3 = 1;

		// Wait 100 ns for global reset to finish
		#10;
		
		x0 = 1;
		x1 = 1;
		x2 = 1;
		x3 = 1;

		// Wait 100 ns for global reset to finish
		#10;
	end
      
endmodule

