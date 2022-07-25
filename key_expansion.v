module key_expansion(InKey,Rcon,OutKey);

input [127:0]InKey;
input [31:0]Rcon;
output [127:0]OutKey;
wire [127:0]OutKey;

//shifting operation
wire [127:0]key;
wire [31:0]key2;

assign key[127:32]=InKey[127:32];
assign key[31:24]=InKey[23:16];
assign key[23:16]=InKey[15:8];
assign key[15:8]=InKey[7:0];
assign key[7:0]=InKey[31:24];

//sub_bytes operation

sbox s1(key[31:28],key[27:24],key2[31:24]);
sbox s2(key[23:20],key[19:16],key2[23:16]);
sbox s3(key[15:12],key[11:8],key2[15:8]);
sbox s4(key[7:4],key[3:0],key2[7:0]);


assign OutKey[127:96]=key2[31:0]^InKey[127:96]^Rcon[31:0];
assign OutKey[95:64]=OutKey[127:96]^InKey[95:64]; 
assign OutKey[63:32]=OutKey[95:64]^InKey[63:32];
assign OutKey[31:0]=OutKey[63:32]^InKey[31:0];

endmodule





