`timescale 1ms / 1ps
module full_cir(clk,X_en,X_rst,X_sh16,X_sr,X_in,K0_en,cip,K0_rst,K0_in,K1_en,K1_rst,K1_in,K_sh16,K_sh5,RC_en,RC_rst,RC_sh16,RC_sh5,RC_in,sm,b0,b1,b2,b3,tw3);

	//common clock
	input clk;
	//1bit input from X
	input X_en,X_rst,X_sh16,X_sr;
	//bus input from X
	input [0:63]X_in;
	//output wire
	reg [0:63]X_out;
	
	//1bit input from K0
	input K0_en,K0_rst;
	//bus input from K0
	input [0:63]K0_in;
	//output wire
	wire [0:63]K0_out;
	
	//1bit input from K1
	input K1_en,K1_rst;
	//bus input from K1
	input [0:63]K1_in;
	//output wire
	wire [0:63]K1_out;
	//common input to K0_sh16/5 and K1_sh16/5;
	input K_sh16,K_sh5;
	//end here
	//1bit input from RC
	input RC_en,RC_rst,RC_sh16,RC_sh5;
	//bus input from RC
	input [0:63]RC_in;
	//output wire
	wire [0:63]RC_out;
	
	//round binary b0,b1,b2,b3
	input b0,b1,b2,b3;
	input sm;
	//output
	output [0:15]tw3;
	
//	output wire [0:63]XReg_in;
	//input vs feedback
//	wire [0:63] w5;
//	split1_64 sp5(.a(X_rst),.b(w5));
//	mux2x1_64bit_feedback mux_input(.b(X_in),.a({tw3,cip[16:63]}),.s(w5),.c(XReg_in));
	//Registers 
	always @(posedge clk) begin
		if (X_en) begin
			if (X_sr) begin
				$monitor("time  = %d, SHIFT-ROW...",$time);
				X_out[ 0 ] <= X_out[ 0 ];				X_out[ 1 ] <= X_out[ 1 ];				X_out[ 2 ] <= X_out[ 2 ];				X_out[ 3 ] <= X_out[ 3 ];
				X_out[ 4 ] <= X_out[ 52 ];				X_out[ 5 ] <= X_out[ 53 ];				X_out[ 6 ] <= X_out[ 54 ];				X_out[ 7 ] <= X_out[ 55 ];
				X_out[ 8 ] <= X_out[ 40 ];				X_out[ 9 ] <= X_out[ 41 ];				X_out[ 10 ] <= X_out[ 42 ];				X_out[ 11 ] <= X_out[ 43 ];
				X_out[ 12 ] <= X_out[ 28 ];				X_out[ 13 ] <= X_out[ 29 ];				X_out[ 14 ] <= X_out[ 30 ];				X_out[ 15 ] <= X_out[ 31 ];
				X_out[ 16 ] <= X_out[ 16 ];				X_out[ 17 ] <= X_out[ 17 ];				X_out[ 18 ] <= X_out[ 18 ];				X_out[ 19 ] <= X_out[ 19 ];
				X_out[ 20 ] <= X_out[ 4 ];				X_out[ 21 ] <= X_out[ 5 ];				X_out[ 22 ] <= X_out[ 6 ];				X_out[ 23 ] <= X_out[ 7 ];
				X_out[ 24 ] <= X_out[ 56 ];				X_out[ 25 ] <= X_out[ 57 ];				X_out[ 26 ] <= X_out[ 58 ];				X_out[ 27 ] <= X_out[ 59 ];
				X_out[ 28 ] <= X_out[ 44 ];				X_out[ 29 ] <= X_out[ 45 ];				X_out[ 30 ] <= X_out[ 46 ];				X_out[ 31 ] <= X_out[ 47 ];
				X_out[ 32 ] <= X_out[ 32 ];				X_out[ 33 ] <= X_out[ 33 ];				X_out[ 34 ] <= X_out[ 34 ];				X_out[ 35 ] <= X_out[ 35 ];
				X_out[ 36 ] <= X_out[ 20 ];				X_out[ 37 ] <= X_out[ 21 ];				X_out[ 38 ] <= X_out[ 22 ];				X_out[ 39 ] <= X_out[ 23 ];
				X_out[ 40 ] <= X_out[ 8 ];				X_out[ 41 ] <= X_out[ 9 ];				X_out[ 42 ] <= X_out[ 10 ];				X_out[ 43 ] <= X_out[ 11 ];
				X_out[ 44 ] <= X_out[ 60 ];				X_out[ 45 ] <= X_out[ 61 ];				X_out[ 46 ] <= X_out[ 62 ];				X_out[ 47 ] <= X_out[ 63 ];
				X_out[ 48 ] <= X_out[ 48 ];				X_out[ 49 ] <= X_out[ 49 ];				X_out[ 50 ] <= X_out[ 50 ];				X_out[ 51 ] <= X_out[ 51 ];
				X_out[ 52 ] <= X_out[ 36 ];				X_out[ 53 ] <= X_out[ 37 ];				X_out[ 54 ] <= X_out[ 38 ];				X_out[ 55 ] <= X_out[ 39 ];
				X_out[ 56 ] <= X_out[ 24 ];				X_out[ 57 ] <= X_out[ 25 ];				X_out[ 58 ] <= X_out[ 26 ];				X_out[ 59 ] <= X_out[ 27 ];
				X_out[ 60 ] <= X_out[ 12 ];				X_out[ 61 ] <= X_out[ 13 ];				X_out[ 62 ] <= X_out[ 14 ];				X_out[ 63 ] <= X_out[ 15 ];
			end
			if (X_sh16) begin
				X_out <= (X_out << 16) | (X_out >> 48);
				$monitor("time  = %d, 16SHFIT...",$time);
			end
			if (X_rst) begin
				X_out <= X_in;
				$monitor("time  = %d, ASSIGNED...",$time);
			end else begin
				X_out <= {tw3 , X_out [16:63]};
				$monitor("time  = %d, FEEDBACK...",$time);
			end
		end 
	end
	//Reg64bit XReg64bit(.clk(clk),.rst(X_rst),.en(X_en),.sh16(X_sh16),.sh5(1'b0),.sr(X_sr),.x(XReg_in),.y(X_out));//Register X
	Reg64bit K0Reg64bit(.clk(clk),.rst(K0_rst),.en(K0_en),.sh16(K_sh16 & ~b3),.sh5(K_sh5 & ~b3),.sr(1'b0),.x(K0_in),.y(K0_out));//Register K0
	Reg64bit K1Reg64bit(.clk(clk),.rst(K1_rst),.en(K1_en),.sh16(K_sh16 & b3),.sh5(K_sh5 & b3),.sr(1'b0),.x(K1_in),.y(K1_out));//Register K1
	Reg64bit RCReg64bit(.clk(clk),.rst(RC_rst),.en(RC_en),.sh16(RC_sh16),.sh5(1'b0),.sr(1'b0),.x(RC_in),.y(RC_out));//Register RC
	//Muxes
	wire [0:15] w1;
	wire [0:15] rk;
	split1_16 sp1(.a(b3),.b(w1));
	mux2x1_16bit mux1(.a(K0_out[0:15]),.b(K1_out[0:15]),.s(w1),.c(rk));
	
	wire [0:15] w2;
	wire [0:15] rc;
	split1_16 sp2(.a((b0 ^ b2)|(b1 ^ b3)),.b(w2));
	mux2x1_16bit mux2(.a(16'h0000),.b(RC_out[0:15]),.s(w2),.c(rc));
	
	//xors
	wire [0:15] tw1;
	wire [0:15] tw2;//temporary wires
	xor16bit xor1(.a(X_out[0:15]),.b(rk),.c(tw1));
	xor16bit xor2(.a(tw1),.b(rc),.c(tw2));
	
	wire [0:15]w3;
	wire [0:15] tw4;
	split1_16 sp3(.a(~(b0 & b2)),.b(w3));
	sbmx sboxMixSel(.a(X_out[0:15]),.s(w3),.c(tw4));
	
	wire [0:15] w4;
	split1_16 sp4(.a(sm),.b(w4));
	mux2x1_16bit mux0(.a(tw2),.b(tw4),.s(w4),.c(tw3));//tw3 is 16bit.	
	
	output [0:63] cip;
	assign cip = {tw3,X_out[16:63]};
endmodule
