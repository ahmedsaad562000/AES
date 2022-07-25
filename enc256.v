module enc256
(
input [255:0] key,
input [127:0] in,
output [127:0] out

);
//////////////////////////////////////////////////
wire [255:0] keyex0,keyex1,keyex2,keyex3,keyex4,keyex5,keyex6;
wire [127:0]pr_key;
wire [127:0] sb0,sb1,sb2,sb3,sb4,sb5,sb6,sb7,sb8,sb9,sb10,sb11,sb12,sb13;
wire [127:0] shr0,shr1,shr2,shr3,shr4,shr5,shr6,shr7,shr8,shr9,shr10,shr11,shr12,shr13;
wire [127:0] mxc0,mxc1,mxc2,mxc3,mxc4,mxc5,mxc6,mxc7,mxc8,mxc9,mxc10,mxc11,mxc12;
wire [127:0] out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13;

/////////////////////////////////////////////////
key_expansion_256 k0 (key,32'h01000000,keyex0);
key_expansion_256 k1 (keyex0,32'h02000000,keyex1);
key_expansion_256 k2 (keyex1,32'h04000000,keyex2);
key_expansion_256 k3 (keyex2,32'h08000000,keyex3);
key_expansion_256 k4 (keyex3,32'h10000000,keyex4);
key_expansion_256 k5 (keyex4,32'h20000000,keyex5);
key_expansion_256 k6 (keyex5,32'h40000000,keyex6);



///////////////////////////////round0//////////////////////////////////////
assign pr_key = in^key[255:128] ;

//////////////////////////////round1///////////////////////////////////////
subByte s0 (pr_key,sb0);
shift_rows r0 (sb0,shr0);
mix_columns m0 (shr0,mxc0);
add_round_key a0 (key[127:0],mxc0,out0);
/////////////////////////////round2///////////////////////////////////////
subByte s1 (out0,sb1);
shift_rows r1 (sb1,shr1);
mix_columns m1(shr1,mxc1);
add_round_key a1 (keyex0[255:128],mxc1,out1);
/////////////////////////////round3///////////////////////////////////////
subByte s2 (out1,sb2);
shift_rows r2 (sb2,shr2);
mix_columns m2(shr2,mxc2);
add_round_key a2 (keyex0[127:0],mxc2,out2);
/////////////////////////////round4///////////////////////////////////////
subByte s3 (out2,sb3);
shift_rows r3 (sb3,shr3);
mix_columns m3(shr3,mxc3);
add_round_key a3 (keyex1[255:128],mxc3,out3);
/////////////////////////////round5///////////////////////////////////////
subByte s4 (out3,sb4);
shift_rows r4 (sb4,shr4);
mix_columns m4(shr4,mxc4);
add_round_key a4 (keyex1[127:0],mxc4,out4);
/////////////////////////////round6///////////////////////////////////////
subByte s5 (out4,sb5);
shift_rows r5 (sb5,shr5);
mix_columns m5(shr5,mxc5);
add_round_key a5 (keyex2[255:128],mxc5,out5);
/////////////////////////////round7///////////////////////////////////////
subByte s6 (out5,sb6);
shift_rows r6 (sb6,shr6);
mix_columns m6(shr6,mxc6);
add_round_key a6 (keyex2[127:0],mxc6,out6);
/////////////////////////////round8///////////////////////////////////////
subByte s7 (out6,sb7);
shift_rows r7 (sb7,shr7);
mix_columns m7(shr7,mxc7);
add_round_key a7 (keyex3[255:128],mxc7,out7);
/////////////////////////////round9///////////////////////////////////////
subByte s8 (out7,sb8);
shift_rows r8 (sb8,shr8);
mix_columns m8(shr8,mxc8);
add_round_key a8 (keyex3[127:0],mxc8,out8);
/////////////////////////////round10///////////////////////////////////////
subByte s9 (out8,sb9);
shift_rows r9 (sb9,shr9);
mix_columns m9(shr9,mxc9);
add_round_key a9 (keyex4[255:128],mxc9,out9);
/////////////////////////////round11///////////////////////////////////////
subByte s10 (out9,sb10);
shift_rows r10 (sb10,shr10);
mix_columns m10(shr10,mxc10);
add_round_key a10 (keyex4[127:0],mxc10,out10);
/////////////////////////////round12///////////////////////////////////////
subByte s11 (out10,sb11);
shift_rows r11 (sb11,shr11);
mix_columns m11(shr11,mxc11);
add_round_key a11 (keyex5[255:128],mxc11,out11);
/////////////////////////////round13///////////////////////////////////////
subByte s12 (out11,sb12);
shift_rows r12 (sb12,shr12);
mix_columns m12(shr12,mxc12);
add_round_key a12 (keyex5[127:0],mxc12,out12);
/////////////////////////////round14///////////////////////////////////////
subByte s13 (out12,sb13);
shift_rows r13 (sb13,shr13);
//mix_columns m13(shr13,mxc13);
add_round_key a13 (keyex6[255:128],shr13,out13);
//////////////////////////////////////////////////////////////////////////
assign out=out13;

endmodule 