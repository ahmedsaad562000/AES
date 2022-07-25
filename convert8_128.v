module convert8_128 
(
input clk,
input [1:0] mod,
input [7:0]state_in,
input [7:0]state_in2,
output [127:0] state_out,
output [127:0] state_out2

);

reg [127:0] finput=128'b0;
reg [127:0] finput2=128'b0; 
integer k=0;
	
always @(posedge clk)
	begin
	if(mod==2'b0)
	begin
	if(k==0)
	begin 
   finput[127:120]<=state_in;
	finput2[127:120]<=state_in2;

	end
	else if (k==1)
	begin 
	finput[119:112]<=state_in;
	finput2[119:112]<=state_in2;

	end
	else if (k==2)
	begin 
	finput[111:104]<=state_in;
		finput2[111:104]<=state_in2;

	end
	else if (k==3)
	begin 
	finput[103:96]<=state_in;
		finput2[103:96]<=state_in2;

	end
	else if (k==4)
	begin 
	finput[95:88]<=state_in;
		finput2[95:88]<=state_in2;

	end
	else if (k==5)
	begin 
	finput[87:80]<=state_in;
		finput2[87:80]<=state_in2;

	end
	else if (k==6)
	begin 
	finput[79:72]<=state_in;
		finput2[79:72]<=state_in2;

	end
	else if (k==7)
	begin 
	finput[71:64]<=state_in;
		finput2[71:64]<=state_in2;

	end
	else if (k==8)
	begin 
	finput[63:56]<=state_in;
		finput2[63:56]<=state_in2;

	end
	else if (k==9)
	begin 
	finput[55:48]<=state_in;
		finput2[55:48]<=state_in2;

	end
	else if (k==10)
	begin 
	finput[47:40]<=state_in;
		finput2[47:40]<=state_in2;

	end
	else if (k==11)
	begin 
	finput[39:32]<=state_in;
		finput2[39:32]<=state_in2;

	end
	else if (k==12)
	begin 
	finput[31:24]<=state_in;
		finput2[31:24]<=state_in2;

	end
	else if (k==13)
	begin 
	finput[23:16]<=state_in;
		finput2[23:16]<=state_in2;

	end
	else if (k==14)
	begin 
	finput[15:8]<=state_in;
		finput2[15:8]<=state_in2;

	end
	else if (k==15)
	begin 
	finput[7:0]<=state_in;
	finput2[7:0]<=state_in2;

	end
	else 
	begin
	
	end
	k<=k+1;
	
	end
	end
	
	assign state_out=finput;
	assign state_out2=finput2;

	endmodule 