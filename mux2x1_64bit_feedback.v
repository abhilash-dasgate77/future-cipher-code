`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:29 07/31/2024 
// Design Name: 
// Module Name:    mux2x1_64bit_feedback 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux2x1_64bit_feedback(a,b,s,c);
	input [0:63]a,b,s;
	output [0:63]c;
	assign c = ~s & a | s & b;
	initial begin
		$monitor("time  = %d, a,b,s,c = %x,%x,%x,%x, (mux)",$time,a,b,s,c);
	end
endmodule
