
module inv_shift_rows(
input[127:0] in,
output [127:0] out
);

assign out = {in[127:120] , in[23:16] , in[47:40] , in[71:64] , in[95:88] ,in[119:112] , in[15:8] , in[39:32] , in[63:56] , in[87:80] , in[111:104] , in[7:0] , in[31:24] , in[55:48] , in[79:72] , in[103:96]};



endmodule	