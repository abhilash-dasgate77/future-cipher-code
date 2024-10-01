`timescale 1ns / 1ps

module XKRC(clk,K0_rst,K0_en,K0_sh16,K0_sh5,K1_rst,K1_en,K1_sh16,K1_sh5,RC1_rst,RC1_en,RC1_sh16,RC1_sh5,K0_in,K1_in,sel_K0K1,RC1_in,sel_RC01,X,Y);
	input clk,K0_rst,K0_en,K0_sh16,K0_sh5;//K0
	input K1_rst,K1_en,K1_sh16,K1_sh5;//K1
	input RC1_rst,RC1_en,RC1_sh16,RC1_sh5;//RC1
	input [0:63]X,K0_in,K1_in,RC1_in;//all inputs , 64 bit input
	input [0:15] sel_K0K1,sel_RC01;// 16 bits inputs
	wire [0:15]sel_Ki,sel_RCi;//select wire from mux
	wire [0:63] K0_out, K1_out, RC1_out;
	wire [0:15] tmp0;
	output [0:15]Y;//output
	//K0//
	Reg64bit reg64bit_inst1(.clk(clk),.rst(K0_rst),.en(K0_en),.sh16(K0_sh16),.sh5(K0_sh5),.sr(1'b0),.x(K0_in),.y(K0_out));
	//K1//
	Reg64bit reg64bit_inst2(.clk(clk),.rst(K1_rst),.en(K1_en),.sh16(K1_sh16),.sh5(K1_sh5),.sr(1'b0),.x(K1_in),.y(K1_out));
	//mux K0 and K1
	mux2x1_16bit muxK0K1(.a(K0_out[0:15]),.b(K1_out[0:15]),.s(sel_K0K1),.c(sel_Ki));
	//RC1
	Reg64bit reg64bit_inst3(.clk(clk),.rst(RC1_rst),.en(RC1_en),.sh16(RC1_sh16),.sh5(RC1_sh5),.sr(1'b0),.x(RC1_in),.y(RC1_out));
	//mux RC1 and 64'h0000_0000_0000_0000
	mux2x1_16bit muxRC01(.a(16'h0000),.b(RC1_out[0:15]),.s(sel_RC01),.c(sel_RCi));
	//xor X, Ki and RCi
	xor16bit xor16bit_inst1(.a(sel_Ki),.b(sel_RCi),.c(tmp0));
	xor16bit xor16bit_inst2(.a(X[0:15]),.b(tmp0),.c(Y));
endmodule
