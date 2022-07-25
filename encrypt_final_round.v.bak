module encrypt_final_round(

input [127:0] key_round,
input [127:0] state_in,
output [127:0] state_out
);
wire [127:0] sub_byte_output;
wire [127:0] shift_row_output;
wire [127:0] add_round_key_output;

subByte sub_byte(.state(state_input),.state_out(sub_byte_output));
shift_rows shift_row(.in(sub_byte_output),.out(shift_row_output));
add_round_key add_round(.roundkey(key_round),.state_in(shift_row_output),.state_out(add_round_key_output));

assign state_out[127:0]=add_round_key_output[127:0];


endmodule 