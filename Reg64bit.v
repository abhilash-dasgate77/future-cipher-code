`timescale 1ns / 1ps
module Reg64bit(clk,rst,en,sh16,sh5,sr,x,y);
	input clk,rst,en,sh16,sh5,sr;
	input [0:63]x;
	output reg [0:63]y;
	always@(posedge clk)begin
		if (~en) begin
			$monitor("not enabled...");
			y <= y;
		end else begin
			if (rst) begin
				y <= x;
				$monitor("time  = %d, y = %x (assigned from input)",$time,y);
			end else begin
				if (sh16) begin
					y <= (y << 16)|(y >> 48);
					$monitor("time  = %d, y = %x (<< 16)",$time,y);
				end
				if (sh5) begin
					y <= (y << 5)|(y >> 59);
					$monitor("time  = %d, y = %x (<< 5)",$time,y);
				end
				if (sr) begin
					y[ 0 ] <= y[ 0 ];
					y[ 1 ] <= y[ 1 ];
					y[ 2 ] <= y[ 2 ];
					y[ 3 ] <= y[ 3 ];
					y[ 4 ] <= y[ 52 ];
					y[ 5 ] <= y[ 53 ];
					y[ 6 ] <= y[ 54 ];
					y[ 7 ] <= y[ 55 ];
					y[ 8 ] <= y[ 40 ];
					y[ 9 ] <= y[ 41 ];
					y[ 10 ] <= y[ 42 ];
					y[ 11 ] <= y[ 43 ];
					y[ 12 ] <= y[ 28 ];
					y[ 13 ] <= y[ 29 ];
					y[ 14 ] <= y[ 30 ];
					y[ 15 ] <= y[ 31 ];
					y[ 16 ] <= y[ 16 ];
					y[ 17 ] <= y[ 17 ];
					y[ 18 ] <= y[ 18 ];
					y[ 19 ] <= y[ 19 ];
					y[ 20 ] <= y[ 4 ];
					y[ 21 ] <= y[ 5 ];
					y[ 22 ] <= y[ 6 ];
					y[ 23 ] <= y[ 7 ];
					y[ 24 ] <= y[ 56 ];
					y[ 25 ] <= y[ 57 ];
					y[ 26 ] <= y[ 58 ];
					y[ 27 ] <= y[ 59 ];
					y[ 28 ] <= y[ 44 ];
					y[ 29 ] <= y[ 45 ];
					y[ 30 ] <= y[ 46 ];
					y[ 31 ] <= y[ 47 ];
					y[ 32 ] <= y[ 32 ];
					y[ 33 ] <= y[ 33 ];
					y[ 34 ] <= y[ 34 ];
					y[ 35 ] <= y[ 35 ];
					y[ 36 ] <= y[ 20 ];
					y[ 37 ] <= y[ 21 ];
					y[ 38 ] <= y[ 22 ];
					y[ 39 ] <= y[ 23 ];
					y[ 40 ] <= y[ 8 ];
					y[ 41 ] <= y[ 9 ];
					y[ 42 ] <= y[ 10 ];
					y[ 43 ] <= y[ 11 ];
					y[ 44 ] <= y[ 60 ];
					y[ 45 ] <= y[ 61 ];
					y[ 46 ] <= y[ 62 ];
					y[ 47 ] <= y[ 63 ];
					y[ 48 ] <= y[ 48 ];
					y[ 49 ] <= y[ 49 ];
					y[ 50 ] <= y[ 50 ];
					y[ 51 ] <= y[ 51 ];
					y[ 52 ] <= y[ 36 ];
					y[ 53 ] <= y[ 37 ];
					y[ 54 ] <= y[ 38 ];
					y[ 55 ] <= y[ 39 ];
					y[ 56 ] <= y[ 24 ];
					y[ 57 ] <= y[ 25 ];
					y[ 58 ] <= y[ 26 ];
					y[ 59 ] <= y[ 27 ];
					y[ 60 ] <= y[ 12 ];
					y[ 61 ] <= y[ 13 ];
					y[ 62 ] <= y[ 14 ];
					y[ 63 ] <= y[ 15 ];
					$monitor("time  = %d, y = %x (shift Rows)",$time,y);
				end
			end
		end
	end
endmodule
