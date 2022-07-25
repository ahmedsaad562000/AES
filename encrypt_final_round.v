module encrypt_final_round(

input [127:0] Key,
input [127:0] StateIn,
output [127:0] StateOut
);
wire [127:0] sbout;
wire [127:0] srout;
wire [127:0] arout;

subByte sub_byte(.state(StateInput),.StateOut(sbout));
shift_rows shift_row(.in(sbout),.out(srout));
add_round_key add_round(.roundkey(key_round),.StateIn(srout),.StateOut(arout));

assign StateOut[127:0]=arout[127:0];


endmodule 