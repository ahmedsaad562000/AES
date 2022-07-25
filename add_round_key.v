module add_round_key
(
    input wire [127:0] round_key,
    input wire [127:0] state_in,
    output wire [127:0] state_out
	);
	
	
	
 assign state_out=round_key^state_in;

	
	
	
endmodule 