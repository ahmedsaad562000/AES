module AES 
(
input en,
input [1:0]mod,
input reset,
output reg led128,
output reg led192,
output reg led256
);
reg [127:0] in = 128'h00112233665566775599aabbccddeeff;
reg [127:0] key128 = 128'h000102030405060708090a0b0c0d0e0f;
reg [127:0] keydec128 = 128'h000102030705060708090a0b0c0d0e0f;
reg [191:0] key192 =192'h000102030405060708090a0b0c0d0e0f1011121314151617;
reg [191:0] keydec192 =192'h000102030205060708090a0b0c0d0e0f1011121314151617;
reg [255:0] key256 = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;  
reg [255:0] keydec256 = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;  
wire [127:0] en128out;
wire [127:0] en192out;
wire [127:0] en256out;
wire [127:0] dec128out;
wire [127:0] dec192out;
wire [127:0] dec256out;
enc128 el128(

.key(key128),
.in(in),
.out(en128out)
);

dec128 dl128(
.in(en128out),
.key(keydec128),
.out(dec128out)
);

enc192 el192(
.in(in),
.key(key192),
.out(en192out)
);

dec192 dl192(
.in(en192out),
.key(keydec192),
.out(dec192out)
);

enc256 el256(
.in(in),
.key(key256),
.out(en256out)
);

dec256 dl256(
.in(en256out),
.key(keydec256),
.out(dec256out)
);
always @(en or reset or mod)
	begin
if(reset)
begin
 led128=1'b0;
 led192=1'b0;
 led256=1'b0;
end
else
begin	
if(en)
begin
	if(mod==2'b00)
	begin
		if(dec128out == in)
			begin
			led128=1'b1;
			led192=1'b0;
			led256=1'b0;
			
			end
			else
			begin
			led128=1'b0;
			led192=1'b0;
			led256=1'b0;
			end
	end
	else if (mod==2'b01)
	begin
			if(dec192out == in)
			begin
			led128=1'b0;
			led192=1'b1;
			led256=1'b0;
			end
			else
			begin
			led128=1'b0;
			led192=1'b0;
			led256=1'b0;
			end
	end
	else if (mod==2'b10)
	begin 
			if(dec256out == in)
			begin
			led128=1'b0;
			led192=1'b0;
			led256=1'b1;
	      end
			else
			begin
			led128=1'b0;
			led192=1'b0;
			led256=1'b0;
			end
	end
	else 
	begin 
   led128=1'b0;
	led192=1'b0;
	led256=1'b0;
	end
end
else
begin
   led128=1'b0;
	led192=1'b0;
	led256=1'b0;
end

end

	end
	


endmodule  
