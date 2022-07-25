module shift_rows(
input [127:0] in,
output [127:0] out

);
//Logic of shift rows--->
//The first row is unaffected
//The second row is shifted by 1 to the left
//The third row is shifted by 2 to the left
//The fourth row is shifted by 3 to the left

//////////////////////////
assign out[7:0]=in[39:32];
assign out[15:8]=in[79:72];    // The fourth column is updated
assign out[23:16]=in[119:112];
assign out[31:24]=in[31:24];
///////////////////////////
assign out[39:32]=in[71:64];
assign out[47:40]=in[111:104];
assign out[55:48]=in[23:16];    // The third column is updated
assign out[63:56]=in[63:56];
///////////////////////////
assign out[71:64]=in[103:96];
assign out[79:72]=in[15:8];
assign out[87:80]=in[55:48];    // The second column is updated
assign out[95:88]=in[95:88];
///////////////////////////
assign out[103:96]=in[7:0];
assign out[111:104]=in[47:40];
assign out[119:112]=in[87:80];    // The first column is updated
assign out[127:120]=in[127:120];
////////////////////////////
endmodule 