module key_expansion_256(
input [255:0] key_input,
input [31:0] rcon,
output [255:0] key_output
);
wire [255:0] key;
wire [255:0] key2;
wire [255:0] key3;
//Rotword operation
assign key[255:32]=key_input[255:32];
assign key[31:24]=key_input[23:16];
assign key[23:16]=key_input[15:8];
assign key[15:8]=key_input[7:0];
assign key[7:0]=key_input[31:24];

//sBox

sbox s1(key[31:28],key[27:24],key2[31:24]);
sbox s2(key[23:20],key[19:16],key2[23:16]);
sbox s3(key[15:12],key[11:8],key2[15:8]);
sbox s4(key[7:4],key[3:0],key2[7:0]);
////////////////////////////////////////////////////


assign key_output[255:224]=key2[31:0]^rcon[31:0]^key_input[255:224];
assign key_output[223:192]=key_input[223:192]^key_output[255:224];
assign key_output[191:160]=key_input[191:160]^key_output[223:192];
assign key_output[159:128]=key_input[159:128]^key_output[191:160];
/////////////////////////////////////////////////////////////////////
sbox s5(key_output[159:156],key_output[155:152],key3[159:152]);
sbox s6(key_output[151:148],key_output[147:144],key3[151:144]);
sbox s7(key_output[143:140],key_output[139:136],key3[143:136]);
sbox s8(key_output[135:132],key_output[131:128],key3[135:128]);

/////////////////////////////////////////////////////////////////////
assign key_output[127:96]=key_input[127:96]^key3[159:128];
assign key_output[95:64]=key_input[95:64]^key_output[127:96];
assign key_output[63:32]=key_input[63:32]^key_output[95:64];
assign key_output[31:0]=key_input[31:0]^key_output[63:32];
/////////////////////////////////////////////////////////////////////
endmodule 