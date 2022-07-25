module dec256
(
input [127:0] in,
input [255:0] key,
output [127:0] out
);

//////////////////////////////////////initialization//////////////////////////////
wire[255:0] keyex0,keyex1,keyex2,keyex3,keyex4,keyex5,keyex6;
wire[127:0] out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13;
wire [127:0] sh0,sh1,sh2,sh3,sh4,sh5,sh6,sh7,sh8,sh9,sh10,sh11,sh12,sh13;
wire [127:0] sb0,sb1,sb2,sb3,sb4,sb5,sb6,sb7,sb8,sb9,sb10,sb11,sb12,sb13;
wire [127:0] mx1,mx2,mx3,mx4,mx5,mx6,mx7,mx8,mx9,mx10,mx11,mx12,mx13;

///////////////////////////////////////////////////////////////////////////////////

key_expansion_256 k0 (key,32'h01000000,keyex0);
key_expansion_256 k1 (keyex0,32'h02000000,keyex1);
key_expansion_256 k2 (keyex1,32'h04000000,keyex2);
key_expansion_256 k3 (keyex2,32'h08000000,keyex3);
key_expansion_256 k4 (keyex3,32'h10000000,keyex4);
key_expansion_256 k5 (keyex4,32'h20000000,keyex5);
key_expansion_256 k6 (keyex5,32'h40000000,keyex6);


/////////////////////////////////////round1//////////////////////////////////////
add_round_key a0 (keyex6[255:128],in,out0);
inv_shift_rows r0(out0,sh0);
inv_subByte s0(sh0,sb0);
////////////////////////////////////round2///////////////////////////////////////
add_round_key a1 (keyex5[127:0],sb0,out1);
inv_mix_columns m1(out1,mx1);
inv_shift_rows r1(mx1,sh1);
inv_subByte s1(sh1,sb1);
////////////////////////////////////round3///////////////////////////////////////
add_round_key a2 (keyex5[255:128],sb1,out2);
inv_mix_columns m2(out2,mx2);
inv_shift_rows r2(mx2,sh2);
inv_subByte s2(sh2,sb2);
////////////////////////////////////round4///////////////////////////////////////
add_round_key a3 (keyex4[127:0],sb2,out3);
inv_mix_columns m3(out3,mx3);
inv_shift_rows r3(mx3,sh3);
inv_subByte s3(sh3,sb3);
////////////////////////////////////round5///////////////////////////////////////
add_round_key a4 (keyex4[255:128],sb3,out4);
inv_mix_columns m4(out4,mx4);
inv_shift_rows r4(mx4,sh4);
inv_subByte s4(sh4,sb4);
////////////////////////////////////round6///////////////////////////////////////
add_round_key a5 (keyex3[127:0],sb4,out5);
inv_mix_columns m5(out5,mx5);
inv_shift_rows r5(mx5,sh5);
inv_subByte s5(sh5,sb5);
////////////////////////////////////round7///////////////////////////////////////
add_round_key a6 (keyex3[255:128],sb5,out6);
inv_mix_columns m6(out6,mx6);
inv_shift_rows r6(mx6,sh6);
inv_subByte s6(sh6,sb6);
////////////////////////////////////round8///////////////////////////////////////
add_round_key a7 (keyex2[127:0],sb6,out7);
inv_mix_columns m7(out7,mx7);
inv_shift_rows r7(mx7,sh7);
inv_subByte s7(sh7,sb7);
////////////////////////////////////round9///////////////////////////////////////
add_round_key a8 (keyex2[255:128],sb7,out8);
inv_mix_columns m8(out8,mx8);
inv_shift_rows r8(mx8,sh8);
inv_subByte s8(sh8,sb8);
////////////////////////////////////round10///////////////////////////////////////
add_round_key a9 (keyex1[127:0],sb8,out9);
inv_mix_columns m9(out9,mx9);
inv_shift_rows r9(mx9,sh9);
inv_subByte s9(sh9,sb9);
////////////////////////////////////round11///////////////////////////////////////
add_round_key a10 (keyex1[255:128],sb9,out10);
inv_mix_columns m10(out10,mx10);
inv_shift_rows r10(mx10,sh10);
inv_subByte s10(sh10,sb10);
////////////////////////////////////round12///////////////////////////////////////
add_round_key a11 (keyex0[127:0],sb10,out11);
inv_mix_columns m11(out11,mx11);
inv_shift_rows r11(mx11,sh11);
inv_subByte s11(sh11,sb11);
////////////////////////////////////round13///////////////////////////////////////
add_round_key a12 (keyex0[255:128],sb11,out12);
inv_mix_columns m12(out12,mx12);
inv_shift_rows r12(mx12,sh12);
inv_subByte s12(sh12,sb12);
////////////////////////////////////round14///////////////////////////////////////
add_round_key a13 (key[127:0],sb12,out13);
inv_mix_columns m13(out13,mx13);
inv_shift_rows r13(mx13,sh13);
inv_subByte s13(sh13,sb13);
///////////////////////////////////////////////////////////////////////////////////


add_round_key a14 (key[255:128],sb13,out);





endmodule 