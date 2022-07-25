module decryption_layer128
(
input [127:0] in,
input [127:0] key,
output [127:0] out
);

//////////////////////////////////////initialization//////////////////////////////
wire[127:0] keyex0,keyex1,keyex2,keyex3,keyex4,keyex5,keyex6,keyex7,keyex8,keyex9;
wire[127:0] out0,out1,out2,out3,out4,out5,out6,out7,out8,out9;
wire [127:0] sh0,sh1,sh2,sh3,sh4,sh5,sh6,sh7,sh8,sh9;
wire [127:0] sb0,sb1,sb2,sb3,sb4,sb5,sb6,sb7,sb8,sb9;
wire [127:0] mx1,mx2,mx3,mx4,mx5,mx6,mx7,mx8,mx9;

///////////////////////////////////////////////////////////////////////////////////

key_expansion k0 (key,32'h01000000,keyex0);
key_expansion k1 (keyex0,32'h02000000,keyex1);
key_expansion k2 (keyex1,32'h04000000,keyex2);
key_expansion k3 (keyex2,32'h08000000,keyex3);
key_expansion k4 (keyex3,32'h10000000,keyex4);
key_expansion k5 (keyex4,32'h20000000,keyex5);
key_expansion k6 (keyex5,32'h40000000,keyex6);
key_expansion k7 (keyex6,32'h80000000,keyex7);
key_expansion k8 (keyex7,32'h1b000000,keyex8);
key_expansion k9 (keyex8,32'h36000000,keyex9);



/////////////////////////////////////round1//////////////////////////////////////
add_round_key a0 (keyex9,in,out0);
inv_shift_rows r0(out0,sh0);
inv_subByte s0(sh0,sb0);
////////////////////////////////////round2///////////////////////////////////////
add_round_key a1 (keyex8,sb0,out1);
inv_mix_columns m1(out1,mx1);
inv_shift_rows r1(mx1,sh1);
inv_subByte s1(sh1,sb1);
////////////////////////////////////round3///////////////////////////////////////
add_round_key a2 (keyex7,sb1,out2);
inv_mix_columns m2(out2,mx2);
inv_shift_rows r2(mx2,sh2);
inv_subByte s2(sh2,sb2);
////////////////////////////////////round4///////////////////////////////////////
add_round_key a3 (keyex6,sb2,out3);
inv_mix_columns m3(out3,mx3);
inv_shift_rows r3(mx3,sh3);
inv_subByte s3(sh3,sb3);
////////////////////////////////////round5///////////////////////////////////////
add_round_key a4 (keyex5,sb3,out4);
inv_mix_columns m4(out4,mx4);
inv_shift_rows r4(mx4,sh4);
inv_subByte s4(sh4,sb4);
////////////////////////////////////round6///////////////////////////////////////
add_round_key a5 (keyex4,sb4,out5);
inv_mix_columns m5(out5,mx5);
inv_shift_rows r5(mx5,sh5);
inv_subByte s5(sh5,sb5);
////////////////////////////////////round7///////////////////////////////////////
add_round_key a6 (keyex3,sb5,out6);
inv_mix_columns m6(out6,mx6);
inv_shift_rows r6(mx6,sh6);
inv_subByte s6(sh6,sb6);
////////////////////////////////////round8///////////////////////////////////////
add_round_key a7 (keyex2,sb6,out7);
inv_mix_columns m7(out7,mx7);
inv_shift_rows r7(mx7,sh7);
inv_subByte s7(sh7,sb7);
////////////////////////////////////round9///////////////////////////////////////
add_round_key a8 (keyex1,sb7,out8);
inv_mix_columns m8(out8,mx8);
inv_shift_rows r8(mx8,sh8);
inv_subByte s8(sh8,sb8);
////////////////////////////////////round10///////////////////////////////////////
add_round_key a9 (keyex0,sb8,out9);
inv_mix_columns m9(out9,mx9);
inv_shift_rows r9(mx9,sh9);
inv_subByte s9(sh9,sb9);
//////////////////////////////////////////////////////////////////////////////////
add_round_key a10(key,sb9,out);

endmodule 