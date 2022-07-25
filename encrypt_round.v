module encrypt_round(

input [127:0] Key,
input [127:0] StateIn,
output [127:0] StateOut
);
wire [127:0] sbout;
wire [127:0] srout;
wire [127:0] mcout;
wire [127:0] arout;

subByte sub_byte(.state(StateIn),.state_out(sbout));
shift_rows shift_row(.in(sbout),.out(srout));
mix_columns mix_column(.in(srout),.out(mcout));
add_round_key add_round(.roundkey(Key),.state_in(mcout),.state_out(arout));
assign StateOut[127:0]=arout[127:0];

endmodule 