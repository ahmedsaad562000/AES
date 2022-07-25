module mix_columns(
input [127:0] in ,
output [127:0] out 
);



//////////////////////////////////

assign out [127:120]=multip(in[127:120])^multip(in[119:112])^in[119:112]^in[111:104]^in[103:96]; 
assign out [95:88]=multip(in[95:88])^multip(in[87:80])^in[87:80]^in[79:72]^in[71:64];
assign out [63:56]=multip(in[63:56])^multip(in[55:48])^in[55:48]^in[47:40]^in[39:32];
assign out [31:24]=multip(in[31:24])^multip(in[23:16])^in[23:16]^in[15:8]^in[7:0];

//////////////////////////////////

assign out [119:112]=in[127:120]^multip(in[119:112])^multip(in[111:104])^(in[111:104])^in[103:96];
assign out [87:80]=in[95:88]^multip(in[87:80])^multip(in[79:72])^(in[79:72])^in[71:64];
assign out [55:48]=in[63:56]^multip(in[55:48])^multip(in[47:40])^(in[47:40])^in[39:32];
assign out [23:16]=in[31:24]^multip(in[23:16])^multip(in[15:8])^(in[15:8])^in[7:0];

//////////////////////////////////

assign out [111:104]=in[127:120]^in[119:112]^multip(in[111:104])^multip(in[103:96])^in[103:96];
assign out [79:72]=in[95:88]^in[87:80]^multip(in[79:72])^multip(in[71:64])^in[71:64];
assign out [47:40]=in[63:56]^in[55:48]^multip(in[47:40])^multip(in[39:32])^in[39:32];
assign out [15:8]=in[31:24]^in[23:16]^multip(in[15:8])^multip(in[7:0])^in[7:0];

//////////////////////////////////

assign out [103:96]=multip(in[127:120])^in[127:120]^in[119:112]^in[111:104]^multip(in[103:96]);
assign out [71:64]=multip(in[95:88])^in[95:88]^in[87:80]^in[79:72]^multip(in[71:64]);
assign out [39:32]=multip(in[63:56])^in[63:56]^in[55:48]^in[47:40]^multip(in[39:32]);
assign out [7:0]=multip(in[31:24])^in[31:24]^in[23:16]^in[15:8]^multip(in[7:0]);

//////////////////////////////////

function [7:0] multip ;
input [7:0]i;
begin
if (i[7]==0)

multip={i[6:0],1'b0};
                                            
else 
multip={i[6:0],1'b0}^(8'h1b);

end

endfunction
//////////////////////////////////

endmodule 