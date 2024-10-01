`timescale 1ns / 1ps

module sbmx(a,s,c);
	input [0:15]a,s;
	output [0:15]c;
	wire [0:15]t,b;
	
	initial begin
		$monitor("time  = %d, a,s,c = %x,%x,%x",$time,a,s,c);
	end
	sbox sb_inst1(.x0(a[0]),.x1(a[1]),.x2(a[2]),.x3(a[3]),.y0(t[0]),.y1(t[1]),.y2(t[2]),.y3(t[3]));
	sbox sb_inst2(.x0(a[4]),.x1(a[5]),.x2(a[6]),.x3(a[7]),.y0(t[4]),.y1(t[5]),.y2(t[6]),.y3(t[7]));
	sbox sb_inst3(.x0(a[8]),.x1(a[9]),.x2(a[10]),.x3(a[11]),.y0(t[8]),.y1(t[9]),.y2(t[10]),.y3(t[11]));
	sbox sb_inst4(.x0(a[12]),.x1(a[13]),.x2(a[14]),.x3(a[15]),.y0(t[12]),.y1(t[13]),.y2(t[14]),.y3(t[15]));
	m m_inst(.b0(t[0]),.b1(t[1]),.b2(t[2]),.b3(t[3]),.b4(t[4]),.b5(t[5]),.b6(t[6]),.b7(t[7]),.b8(t[8]),.b9(t[9]),.b10(t[10]),.b11(t[11]),.b12(t[12]),.b13(t[13]),.b14(t[14]),.b15(t[15]),.c0(b[0]),.c1(b[1]),.c2(b[2]),.c3(b[3]),.c4(b[4]),.c5(b[5]),.c6(b[6]),.c7(b[7]),.c8(b[8]),.c9(b[9]),.c10(b[10]),.c11(b[11]),.c12(b[12]),.c13(b[13]),.c14(b[14]),.c15(b[15]));
	//mux
	mux2x1 mux_inst1(t[0],b[0],s[0],c[0]);
	mux2x1 mux_inst2(t[1],b[1],s[1],c[1]);
	mux2x1 mux_inst3(t[2],b[2],s[2],c[2]);
	mux2x1 mux_inst4(t[3],b[3],s[3],c[3]);
	
	mux2x1 mux_inst5(t[4],b[4],s[4],c[4]);
	mux2x1 mux_inst6(t[5],b[5],s[5],c[5]);
	mux2x1 mux_inst7(t[6],b[6],s[6],c[6]);
	mux2x1 mux_inst8(t[7],b[7],s[7],c[7]);
	
	mux2x1 mux_inst9(t[8],b[8],s[8],c[8]);
	mux2x1 mux_inst10(t[9],b[9],s[9],c[9]);
	mux2x1 mux_inst11(t[10],b[10],s[10],c[10]);
	mux2x1 mux_inst12(t[11],b[11],s[11],c[11]);
	
	mux2x1 mux_inst13(t[12],b[12],s[12],c[12]);
	mux2x1 mux_inst14(t[13],b[13],s[13],c[13]);
	mux2x1 mux_inst15(t[14],b[14],s[14],c[14]);
	mux2x1 mux_inst16(t[15],b[15],s[15],c[15]);
endmodule
