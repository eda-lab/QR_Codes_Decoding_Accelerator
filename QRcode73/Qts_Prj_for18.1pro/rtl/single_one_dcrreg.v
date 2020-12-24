module single_one_dcrreg(
	s_in,
	
	err_one_pos,
	
	dcode_flag_out,err_one_out_reg
);

input [35:0]			s_in;

input [5:0]				err_one_pos;

output reg				dcode_flag_out;
output reg[5:0]		err_one_out_reg;


wire [35:0]				S[36:0];					//校验子
wire [35:0]				s_pro_one;				//翻转2个位置后的校验子
wire 						weight_flag_one;		//翻转2个位置后校验子的重量

assign 	S[0] = 36'd25023207797;		assign 	S[1] = 36'd50046415594;
assign 	S[2] = 36'd11249171617;		assign 	S[3] = 36'd22498343234;
assign 	S[4] = 36'd44996686468;		assign	S[5] = 36'd4957289597;
assign	S[6] = 36'd9914579194;		assign	S[7] = 36'd19829158388;
assign	S[8] = 36'd39658316776;		assign	S[9] = 36'd32830660261;
assign	S[10] = 36'd65661320522;	assign	S[11] = 36'd48319407073;
assign	S[12] = 36'd14283742903;	assign	S[13] = 36'd28567485806;
assign	S[14] = 36'd57134971612;	assign	S[15] = 36'd65640541389;
assign	S[16] = 36'd48377725167;	assign	S[17] = 36'd14301321387;
assign	S[18] = 36'd28602642774;	assign	S[19] = 36'd57205285548;
assign	S[20] = 36'd66305203245;	assign	S[21] = 36'd48105382191;
assign	S[22] = 36'd15936527147;	assign	S[23] = 36'd31873054294;
assign	S[24] = 36'd63746108588;	assign	S[25] = 36'd36446339117;
assign	S[26] = 36'd22208960815;	assign	S[27] = 36'd44417921630;
assign	S[28] = 36'd6383254985;		assign	S[29] = 36'd12766509970;
assign	S[30] = 36'd25533019940;	assign	S[31] = 36'd51066039880;
assign	S[32] = 36'd8941471205;		assign	S[33] = 36'd17882942410;
assign	S[34] = 36'd35765884820;	assign	S[35] = 36'd23435671133;
assign	S[36] = 36'd46871342266;

/******************计算重量*****************/

wire [5:0]			err_pos_temp;

assign err_pos_temp = (err_one_pos < 6'd37) ? err_one_pos : 6'd36;

assign	s_pro_one = s_in ^ S[err_pos_temp];

weight5 weight(
	.si				(s_pro_one),
	.weight_flag	(weight_flag_one)
);

/****************判断校验是否完成，若完成输出错误位置******************/

always @ (*)
begin
	if(weight_flag_one)
	begin
		err_one_out_reg = err_one_pos;
		dcode_flag_out = 1'b1;
	end
	else
	begin
		err_one_out_reg = 6'd0;
		dcode_flag_out = 1'b0;
	end
end








endmodule
