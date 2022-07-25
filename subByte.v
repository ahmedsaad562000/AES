module subByte(in,out);
input [127:0] in;
output [127:0] out;


sbox sb1(in[7:4],in[3:0],out[7:0]);
sbox sb2(in[47:44],in[43:40],out[47:40]);
sbox sb3(in[87:84],in[83:80],out[87:80]);
sbox sb4(in[127:124],in[123:120],out[127:120]);

sbox sb5(in[39:36],in[35:32],out[39:32]);
sbox sb6(in[79:76],in[75:72],out[79:72]);
sbox sb7(in[119:116],in[115:112],out[119:112]);
sbox sb8(in[31:28],in[27:24],out[31:24]);

sbox sb9(in[71:68],in[67:64],out[71:64]);
sbox sb10(in[111:108],in[107:104],out[111:104]);
sbox sb11(in[23:20],in[19:16],out[23:16]);
sbox sb12(in[63:60],in[59:56],out[63:56]);

sbox sb13(in[103:100],in[99:96],out[103:96]);
sbox sb14(in[15:12],in[11:8],out[15:8]);
sbox sb15(in[55:52],in[51:48],out[55:48]);
sbox sb26(in[95:92],in[91:88],out[95:88]);


endmodule

