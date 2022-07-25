module enc128
(
input [127:0] key,
input [127:0] in,
output [127:0] out

);
//////////////////////////////intialization////////////////////////////////





wire [127:0] pr_key;
wire [127:0] sb0,sb1,sb2,sb3,sb4,sb5,sb6,sb7,sb8,sb9;
wire [127:0] shr0,shr1,shr2,shr3,shr4,shr5,shr6,shr7,shr8,shr9;
wire [127:0] mxc0,mxc1,mxc2,mxc3,mxc4,mxc5,mxc6,mxc7,mxc8;
wire [127:0] keyex0,keyex1,keyex2,keyex3,keyex4,keyex5,keyex6,keyex7,keyex8,keyex9;
wire [127:0] out0,out1,out2,out3,out4,out5,out6,out7,out8,out9;





///////////////////////////////round0//////////////////////////////////////
assign pr_key = in^key ;

//////////////////////////////round1///////////////////////////////////////

subByte s0 (pr_key,sb0);
shift_rows r0 (sb0,shr0);
mix_columns m0 (shr0,mxc0);
key_expansion k0 (key,32'h01000000,keyex0);
add_round_key a0 (keyex0,mxc0,out0);

//////////////////////////////round2///////////////////////////////////////
subByte s1 (out0,sb1);
shift_rows r1 (sb1,shr1);
mix_columns m1 (shr1,mxc1);
key_expansion k1 (keyex0,32'h02000000,keyex1);
add_round_key a1 (keyex1,mxc1,out1);
//////////////////////////////round3///////////////////////////////////////
subByte s2 (out1,sb2);
shift_rows r2 (sb2,shr2);
mix_columns m2 (shr2,mxc2);
key_expansion k2 (keyex1,32'h04000000,keyex2);
add_round_key a2 (keyex2,mxc2,out2);
//////////////////////////////round4///////////////////////////////////////
subByte s3 (out2,sb3);
shift_rows r3 (sb3,shr3);
mix_columns m3 (shr3,mxc3);
key_expansion k3 (keyex2,32'h08000000,keyex3);
add_round_key a3 (keyex3,mxc3,out3);
//////////////////////////////round5///////////////////////////////////////
subByte s4 (out3,sb4);
shift_rows r4 (sb4,shr4);
mix_columns m4 (shr4,mxc4);
key_expansion k4 (keyex3,32'h10000000,keyex4);
add_round_key a4 (keyex4,mxc4,out4);
//////////////////////////////round6///////////////////////////////////////
subByte s5 (out4,sb5);
shift_rows r5 (sb5,shr5);
mix_columns m5 (shr5,mxc5);
key_expansion k5 (keyex4,32'h20000000,keyex5);
add_round_key a5 (keyex5,mxc5,out5);
//////////////////////////////round7///////////////////////////////////////
subByte s6 (out5,sb6);
shift_rows r6 (sb6,shr6);
mix_columns m6 (shr6,mxc6);
key_expansion k6 (keyex5,32'h40000000,keyex6);
add_round_key a6 (keyex6,mxc6,out6);
//////////////////////////////round8///////////////////////////////////////
subByte s7 (out6,sb7);
shift_rows r7 (sb7,shr7);
mix_columns m7 (shr7,mxc7);
key_expansion k7 (keyex6,32'h80000000,keyex7);
add_round_key a7 (keyex7,mxc7,out7);
//////////////////////////////round9///////////////////////////////////////
subByte s8 (out7,sb8);
shift_rows r8 (sb8,shr8);
mix_columns m8 (shr8,mxc8);
key_expansion k8 (keyex7,32'h1b000000,keyex8);
add_round_key a8 (keyex8,mxc8,out8);
//////////////////////////////Final////////////////////////////////////////

subByte s9 (out8,sb9);
shift_rows r9 (sb9,shr9);                       
key_expansion k9 (keyex8,32'h36000000,keyex9);     
add_round_key a9 (keyex9,shr9,out9);


///////////////////////////////////////////////////////////////////////////
assign out = out9;

endmodule 