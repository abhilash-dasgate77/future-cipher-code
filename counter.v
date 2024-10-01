`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:47:05 08/12/2024 
// Design Name: 
// Module Name:    counter 
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
module counter(clk,en,rst,b0,b1,b2,b3,B0,B1,Xr,X6,K6,K5,C6,sm,d0,d1,d2,d3,C0,C1,Yr,Y6,L6,L5,D6,sm1);
input clk,en,rst;
input b0,b1,b2,b3,B0,B1,Xr,X6,K6,K5,C6,sm;
output reg d0,d1,d2,d3,C0,C1,Yr,Y6,L6,L5,D6,sm1;

always @( posedge clk) begin
	if (en) begin
		if (rst) begin
			d0 <= b0;
			d1 <= b1;
			d2 <= b2;
			d3 <= b3;
			C0 <= B0;
			C1 <= B1;
			Yr <= Xr;
			Y6 <= X6;
			L6 <= K6;
			L5 <= K5;
			D6 <= C6;
			sm1 <= sm;
		end else begin
			d0 <= d0 & ~d1 & ~d2 & d3 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | d0 & ~d1 & ~d3 & C0 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 |d0 & ~d1 & ~d3 & C1 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 |d0 & ~d1 & ~d3 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & sm1 |d0 & ~d1 & ~d2 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 |d0 & ~d1 & ~d3 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 |d0 & ~d1 & ~d2 & C0 & C1 & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | d0 & ~d1 & ~d3 & C0 & C1 & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | d0 & ~d1 & ~d3 & ~C0 & ~C1 & ~Yr & ~Y6 & ~L6 & L5 & ~D6 & ~sm1 | ~d0 & d1 & d2 & d3 & C0 & C1 & Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1;
			d1 <= ~d0 & d1 & d3 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d0 & d1 & C0 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d0 & d1 & C1 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d0 & d1 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & sm1 |~d0 & d1 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1| ~d0 & d1 & ~d2 & C0 & C1 & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d0 & d1 & ~d3 & C0 & C1 & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d0 & d1 & ~d3 & ~C0 & ~C1 & ~Yr & ~Y6 & ~L6 & L5 & ~D6 & ~sm1 | ~d0 & ~d1 & d2 & d3 & C0 & C1 & Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1;
			d2 <= ~d0 & d2 & d3 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d0 & d2 & C0 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 |~d0 & d2 & C1 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d0 & d2 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & sm1 | ~d0 & d2 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d1 & d2 & ~d3 & C0 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d1 & d2 & ~d3 & C1 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d1 & d2 & ~d3 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & sm1 | ~d1 & d2 & ~d3 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d0 & d2 & ~d3 & C0 & C1 & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d1 & d2 & ~d3 & C0 & C1 & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d0 & d2 & ~d3 & ~C0 & ~C1 & ~Yr & ~Y6 & ~L6 & L5 & ~D6 & ~sm1 | ~d1 & d2 & ~d3 & ~C0 & ~C1 & ~Yr & ~Y6 & ~L6 & L5 & ~D6 & ~sm1 | ~d0 & ~d2 & d3 & C0 & C1 & Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d1 & ~d2 & d3 & C0 & C1 & Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1;
			d3 <= ~d0 & d3 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d1 & ~d2 & d3 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d0 & d3 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d1 & ~d2 & d3 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d0 & ~d3 & C0 & C1 & Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d1 & ~d2 & ~d3 & C0 & C1 & Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1;
			C0 <= ~d0 & C0 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d1 & ~d2 & C0  & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d1 & ~d3 & C0 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d0 & C0 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d0 & C1 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d1 & ~d2 & C0 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d1 & ~d3 & C0 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d1 & ~d2 & C1 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d1 & ~d3 & C1 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | d0 & ~d1 & d2 & ~d3 & C0 & C1 & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1;
			C1 <= ~d0 & C1 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d1 & ~d2 & C1 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d1 & ~d3 & C1 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 | ~d0 & C0 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d0 & ~C1 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d1 & ~d2 & C0 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d1 & ~d3 & C0 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d1 & ~d2 & ~C1 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d1 & ~d3 & ~C1 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | d0 & ~d1 & d2 & ~d3 & C0 & C1 & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1;
			Yr <= ~d0 & C0 & C1 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d1 & ~d2 & C0 & C1 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | ~d1 & ~d3 & C0 & C1 & ~Yr & Y6 & L6 & ~L5 & D6 & ~sm1 | d0 & ~d1 & d2 & ~d3 & C0 & C1 & Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1;
			Y6 <= ~d0 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & sm1 | ~d1 & ~d2 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & sm1 | ~d1 & ~d3 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & sm1;
			L6 <= ~d0 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & sm1 | ~d1 & ~d2 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & sm1 | ~d1 & ~d3 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & sm1;
			L5 <= ~d0 & d3 & C0 & C1 & Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d1 & ~d2 & d3 & C0 & C1 & Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1;
			D6 <= ~d0 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & sm1 | ~d1 & ~d2 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & sm1 | ~d1 & ~d3 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & sm1;
			sm1 <= ~d0 & d3 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d0 & C0 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d0 & C1 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d0 & ~d1 & ~d2 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d1 & ~d2 & d3 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d1 & ~d3 & C0 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d1 & ~d3 & C1 & ~Yr & ~Y6 & ~L6 & ~L5 & ~D6 & ~sm1 | ~d0 & d1 & ~d3 & ~C0 & ~C1 & ~Yr & ~Y6 & ~L6 & L5 & ~D6 & ~sm1 | d0 & ~d1 & ~d3 & ~C0 & ~C1 & ~Yr & ~Y6 & ~L6 & L5 & ~D6 & ~sm1 | ~d1 & d2 & ~d3 & ~C0 & ~C1 & ~Yr & ~Y6 & ~L6 & L5 & ~D6 & ~sm1;
		end
	end
end
endmodule
