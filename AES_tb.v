module AES_tb();
reg en;
reg [1:0]mod;
reg reset;
wire led128;
wire led192;
wire led256;
//reg [127:0] in = 128'h00112233445566778899aabbccddeeff;
//reg [127:0] key128 = 128'h000102030405060708090a0b0c0d0e0f;
//reg [191:0] key192 =192'h000102030405060708090a0b0c0d0e0f1011121314151617;
//reg [255:0] key256 = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;  
//reg [127:0] falsein1 = 128'h0011223344556677889aaabbccddeeff;
//reg [127:0] falsein2 = 128'h00112233445566778899aabbc4ddeeff;
AES UUT
(
en,
mod,
reset,
led128,
led192,
led256
);

initial begin
$display("Hello");

en=0;
#10
mod = 2'b00;
en=1;
#100
//if(UUT.dec128out== in)
//begin
//$display("AES for 128 key is a success");
//$display ("Output of encryption128 = %h\n",UUT.en128out);
//$display ("Output of decryption128 = %h \nexpected output = %h\n",UUT.dec128out,UUT.in);
//end
en=0;
reset = 1;
mod = 2'b01;
#100
en = 1;
#100
reset = 0;

#100
//if(led192 == 1)
//begin
//$display("AES for 192 key is a success");
//$display ("Output of encryption192 = %h\n",UUT.en192out);
//$display ("Output of decryption192 = %h \nexpected output = %h\n",UUT.dec192out,UUT.in);
//end
en=0;
mod = 2'b10;
#100
en=1;
reset = 1;
#100
reset = 0;

#100
if(led256 == 1)
begin
$display("AES for 256 key is a success");
$display ("Output of encryption256 = %h\n",UUT.en256out);
$display ("Output of decryption256 = %h \nexpected output = %h\n",UUT.dec256out,UUT.in);
end
 $finish;
end
endmodule 