module s_gen(
	clk,reset_n,
	
	m_in,p_in,

	s_out,dcode_flag_out,
	
	err_one_reg_out,err_two_reg_out,err_thr_reg_out
);

input 						clk;
input 						reset_n;

input [36:0]				m_in;
input [35:0]				p_in;

output reg [35:0]			s_out;
output reg					dcode_flag_out;
output reg [5:0]			err_one_reg_out;
output reg [5:0]			err_two_reg_out;
output reg [5:0]			err_thr_reg_out;

wire [35:0] S[36:0];
wire [35:0]	s1,s2,s3;
wire [35:0]	s;

wire weight_flag;

parameter 	S0  = 36'd25023207797,	S1  = 36'd50046415594,
				S2  = 36'd11249171617,	S3  = 36'd22498343234,
				S4  = 36'd44996686468,	S5  = 36'd4957289597,
				S6  = 36'd9914579194,	S7  = 36'd19829158388,
				S8  = 36'd39658316776,	S9  = 36'd32830660261,
				S10 = 36'd65661320522,	S11 = 36'd48319407073,
				S12 = 36'd14283742903,	S13 = 36'd28567485806,
				S14 = 36'd57134971612,	S15 = 36'd65640541389,
				S16 = 36'd48377725167,	S17 = 36'd14301321387,
				S18 = 36'd28602642774,	S19 = 36'd57205285548,
				S20 = 36'd66305203245,	S21 = 36'd48105382191,
				S22 = 36'd15936527147,	S23 = 36'd31873054294,
				S24 = 36'd63746108588,	S25 = 36'd36446339117,
				S26 = 36'd22208960815,	S27 = 36'd44417921630,
				S28 = 36'd6383254985,	S29 = 36'd12766509970,
				S30 = 36'd25533019940,	S31 = 36'd51066039880,
				S32 = 36'd8941471205,	S33 = 36'd17882942410,
				S34 = 36'd35765884820,	S35 = 36'd23435671133,
				S36 = 36'd46871342266;



assign S[0]  = m_in[0]  ? S0  : 36'b0;			assign S[1]  = m_in[1]  ? S1  : 36'b0;
assign S[2]  = m_in[2]  ? S2  : 36'b0;			assign S[3]  = m_in[3]  ? S3  : 36'b0;
assign S[4]  = m_in[4]  ? S4  : 36'b0;			assign S[5]  = m_in[5]  ? S5  : 36'b0;
assign S[6]  = m_in[6]  ? S6  : 36'b0;			assign S[7]  = m_in[7]  ? S7  : 36'b0;
assign S[8]  = m_in[8]  ? S8  : 36'b0;			assign S[9]  = m_in[9]  ? S9  : 36'b0;
assign S[10] = m_in[10] ? S10 : 36'b0;			assign S[11] = m_in[11] ? S11 : 36'b0;
assign S[12] = m_in[12] ? S12 : 36'b0;			assign S[13] = m_in[13] ? S13 : 36'b0;
assign S[14] = m_in[14] ? S14 : 36'b0;			assign S[15] = m_in[15] ? S15 : 36'b0;
assign S[16] = m_in[16] ? S16 : 36'b0;			assign S[17] = m_in[17] ? S17 : 36'b0;
assign S[18] = m_in[18] ? S18 : 36'b0;			assign S[19] = m_in[19] ? S19 : 36'b0;
assign S[20] = m_in[20] ? S20 : 36'b0;			assign S[21] = m_in[21] ? S21 : 36'b0;
assign S[22] = m_in[22] ? S22 : 36'b0;			assign S[23] = m_in[23] ? S23 : 36'b0;
assign S[24] = m_in[24] ? S24 : 36'b0;			assign S[25] = m_in[25] ? S25 : 36'b0;
assign S[26] = m_in[26] ? S26 : 36'b0;			assign S[27] = m_in[27] ? S27 : 36'b0;
assign S[28] = m_in[28] ? S28 : 36'b0;			assign S[29] = m_in[29] ? S29 : 36'b0;
assign S[30] = m_in[30] ? S30 : 36'b0;			assign S[31] = m_in[31] ? S31 : 36'b0;
assign S[32] = m_in[32] ? S32 : 36'b0;			assign S[33] = m_in[33] ? S33 : 36'b0;
assign S[34] = m_in[34] ? S34 : 36'b0;			assign S[35] = m_in[35] ? S35 : 36'b0;
assign S[36] = m_in[36] ? S35 : 36'b0;



assign s1 = S[0] ^S[1] ^S[2] ^S[3] ^S[4] ^S[5] ^S[6] ^S[7] ^S[8] ^S[9] ^S[10]^S[11];
assign s2 = S[12]^S[13]^S[14]^S[15]^S[16]^S[17]^S[18]^S[19]^S[20]^S[21]^S[22]^S[23];
assign s3 = S[24]^S[25]^S[26]^S[27]^S[28]^S[29]^S[30]^S[31]^S[32]^S[33]^S[34]^S[35];


assign s = p_in ^ s1 ^ s2 ^ s3 ^ S[36];



always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		dcode_flag_out <= 1'b0;
		s_out <= 36'b0;
		err_one_reg_out <= 6'd0;
		err_two_reg_out <= 6'd0;
		err_thr_reg_out <= 6'd0;
	end
	else
	begin
		s_out <= s;
		
		if(weight_flag == 1'b1)
		begin
			dcode_flag_out <= 1'b1;
			err_one_reg_out <= 6'd0;
			err_two_reg_out <= 6'd0;
			err_thr_reg_out <= 6'd40;
		end
		else		
		begin
			dcode_flag_out <= 1'b0;
			err_one_reg_out <= 6'd0;
			err_two_reg_out <= 6'd0;
			err_thr_reg_out <= 6'd0;
		end
	end
end


	
weight6 weight6(
 	.si				(s),
	.weight_flag	(weight_flag)
);


endmodule
