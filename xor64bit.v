`timescale 1ns / 1ps
module xor16bit(
    input [0:15] a,
    input [0:15] b,
    output [0:15] c
    );
	assign c = a ^ b;
	initial begin
		$monitor("time = %d, a,b,c = %x,%x,%x (xored)", $time,a,b,c);
	end
endmodule
