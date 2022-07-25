module inv_mix_columns(
input [127:0]in,
output [127:0]out
);



assign out[127:120] = multip14(in[127:120])^multip11(in[119:112])^multip13(in[111:104])^multip9(in[103:96]);
assign out[95:88] =  multip14(in[95:88])^multip11(in[87:80])^multip13(in[79:72])^multip9(in[71:64]);
assign out[63:56] =  multip14(in[63:56])^multip11(in[55:48])^multip13(in[47:40])^multip9(in[39:32]);
assign out[31:24] =  multip14(in[31:24])^multip11(in[23:16])^multip13(in[15:8])^multip9(in[7:0]);

assign out[119:112] = multip9(in[127:120])^multip14(in[119:112])^multip11(in[111:104])^multip13(in[103:96]);
assign out[87:80] = multip9(in[95:88])^multip14(in[87:80])^multip11(in[79:72])^multip13(in[71:64]);
assign out[55:48] = multip9(in[63:56])^multip14(in[55:48])^multip11(in[47:40])^multip13(in[39:32]);
assign out[23:16] = multip9(in[31:24])^multip14(in[23:16])^multip11(in[15:8])^multip13(in[7:0]);

assign out[111:104] = multip13(in[127:120])^multip9(in[119:112])^multip14(in[111:104])^multip11(in[103:96]);
assign out[79:72] = multip13(in[95:88])^multip9(in[87:80])^multip14(in[79:72])^multip11(in[71:64]);
assign out[47:40] = multip13(in[63:56])^multip9(in[55:48])^multip14(in[47:40])^multip11(in[39:32]);
assign out[15:8] =multip13(in[31:24])^multip9(in[23:16])^multip14(in[15:8])^multip11(in[7:0]);

assign out[103:96] = multip11(in[127:120])^multip13(in[119:112])^multip9(in[111:104])^multip14(in[103:96]);
assign out[71:64] = multip11(in[95:88])^multip13(in[87:80])^multip9(in[79:72])^multip14(in[71:64]);
assign out[39:32] = multip11(in[63:56])^multip13(in[55:48])^multip9(in[47:40])^multip14(in[39:32]);
assign out[7:0] = multip11(in[31:24])^multip13(in[23:16])^multip9(in[15:8])^multip14(in[7:0]);


function [7:0]multip2;
input [7:0]i;
begin
if(i[7]==0)
multip2 = {i[6:0],1'b0};
else
multip2 = {i[6:0],1'b0}^8'h1b;
end
endfunction


function [7:0]multip4;
input [7:0]i;
reg var1;
reg [7:0] var2;
begin
var1=i[6];
if(i[7]==0)
var2 = {i[5:0],2'b00};
else
var2 = {i[5:0],2'b00}^8'h36;
if(var1==1)
multip4=var2^8'h1b;
else
multip4=var2;
end
endfunction


function [7:0]multip8;
input [7:0]i;
reg var1,var2;
reg [7:0] var3;
begin
var1=i[6];
var2=i[5];

if(i[7]==0)
var3 = {i[4:0],3'b000};
else
var3 = {i[4:0],3'b000}^8'h6c;

if(var1==1)
var3=var3^8'h36;
else
var3=var3;

if(var2==1)
multip8=var3^8'h1b;
else
multip8=var3;

end
endfunction

function [7:0]multip9;
input [7:0]j;
reg [7:0] var1;
begin
var1=multip8(j);
var1=var1^j[7:0];
multip9=var1;
end
endfunction

function [7:0]multip11;
input [7:0]j;
reg [7:0] var1,var2,var3;
begin
var1=multip8(j);
var2=multip2(j);
var3=var1^var2^j[7:0];
multip11=var3;
end
endfunction

function [7:0]multip13;
input [7:0]j;
reg [7:0] var1,var2,var3;
begin
var1=multip8(j);
var2=multip4(j);
var3=var1^var2^j[7:0];
multip13=var3;
end
endfunction



function [7:0]multip14;
input [7:0]j;
reg [7:0] var1,var2,var3,var4;
begin
var1=multip8(j);
var2=multip4(j);
var3=multip2(j);
var4=var1^var2^var3;
multip14=var4;
end
endfunction







endmodule 