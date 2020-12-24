module thr_pipe37(
	clk,reset_n,
	
	s_in,
	
	dcode_flag_in,err_one_reg_in,err_two_reg_in,err_thr_reg_in,
	
	//err_one_initial,err_two_initial,err_thr_initial,
	part_one_in,part_two_in,part_offset,
	
	dcode_flag_out,err_one_reg_out,err_two_reg_out,err_thr_reg_out,
	
	part_one_out,part_two_out,s_out
);

input 					clk;
input 					reset_n;

input [35:0]			s_in;

input 					dcode_flag_in;
input [5:0]				err_one_reg_in;
input [5:0]				err_two_reg_in;
input [5:0]				err_thr_reg_in;

input [5:0]				part_one_in;
input [5:0]				part_two_in;
input [5:0]				part_offset;

output reg 				dcode_flag_out;
output reg [5:0]		err_one_reg_out;
output reg [5:0]		err_two_reg_out;
output reg [5:0]		err_thr_reg_out;

output reg [5:0]		part_one_out;
output reg [5:0]		part_two_out;

output reg[35:0]			s_out;

wire 						dcode_flag_inside[36:0];
wire [5:0]				err_one_reg_inside[36:0];
wire [5:0]				err_two_reg_inside[36:0];
wire [5:0]				err_thr_reg_inside[36:0];

wire [5:0]				err_one_initial;
wire [5:0]				err_two_initial;
wire [5:0]				err_thr_initial;

assign 	err_one_initial = 6'd0;
assign	err_two_initial = (((part_one_in << 1'b1) + part_offset) > (6'd36 - part_one_in)) ? part_two_in : part_one_in;
assign 	err_thr_initial = (((part_one_in << 1'b1) + part_offset) > (6'd36 - part_one_in)) ? ((part_two_in << 1'b1) 
+ part_offset - (6'd37 - part_one_in - (part_one_in << 1'b1))) : (part_one_in << 1'b1) + part_offset;

reg [5:0]				part_one_temp,part_two_temp;
reg [35:0]				s_temp;

always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		part_one_temp <= 6'd0;
		part_two_temp <= 6'd0;
		s_temp <= 36'd0;
		part_one_out <= 6'd0;
		part_two_out <= 6'd0;
		s_out <= 36'd0;
	end
	else
	begin
		part_one_temp <= part_one_in;  part_one_out <= part_one_temp;
		part_two_temp <= part_two_in;  part_two_out <= part_two_temp;
		s_temp <= s_in;  s_out <= s_temp;
	end
end


single_three_drcreg single_three_drcreg_inst_0
(
	.s_in					(s_in) ,	// input [35:0] s_in
	.err_one_pos		(((err_one_initial + 6'd0) > 6'd36) ? ((err_one_initial + 6'd0) - 6'd37) : (err_one_initial + 6'd0)) ,	// input [5:0] err_one_pos
	.err_two_pos		(((err_two_initial + 6'd0) > 6'd36) ? ((err_two_initial + 6'd0) - 6'd37) : (err_two_initial + 6'd0)) ,	// input [5:0] err_two_pos
	.err_thr_pos		(((err_thr_initial + 6'd0) > 6'd36) ? ((err_thr_initial + 6'd0) - 6'd37) : (err_thr_initial + 6'd0)) ,	// input [5:0] err_thr_pos
	.dcode_flag_out	(dcode_flag_inside[0]) ,	// output  dcode_flag_out
	.err_one_reg_out	(err_one_reg_inside[0]) ,	// output [5:0] err_one_reg_out
	.err_two_reg_out	(err_two_reg_inside[0]) ,	// output [5:0] err_two_reg_out
	.err_thr_reg_out	(err_thr_reg_inside[0]) 	// output [5:0] err_thr_reg_out
);

single_three_drcreg single_three_drcreg_inst_1(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd1) > 6'd36) ? ((err_one_initial + 6'd1) - 6'd37) : (err_one_initial + 6'd1)) ,
	.err_two_pos		(((err_two_initial + 6'd1) > 6'd36) ? ((err_two_initial + 6'd1) - 6'd37) : (err_two_initial + 6'd1)) ,
	.err_thr_pos		(((err_thr_initial + 6'd1) > 6'd36) ? ((err_thr_initial + 6'd1) - 6'd37) : (err_thr_initial + 6'd1)) ,
	.dcode_flag_out	(dcode_flag_inside[1]) ,
	.err_one_reg_out	(err_one_reg_inside[1]) ,
	.err_two_reg_out	(err_two_reg_inside[1]) ,
	.err_thr_reg_out	(err_thr_reg_inside[1])
);

single_three_drcreg single_three_drcreg_inst_2(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd2) > 6'd36) ? ((err_one_initial + 6'd2) - 6'd37) : (err_one_initial + 6'd2)) ,
	.err_two_pos		(((err_two_initial + 6'd2) > 6'd36) ? ((err_two_initial + 6'd2) - 6'd37) : (err_two_initial + 6'd2)) ,
	.err_thr_pos		(((err_thr_initial + 6'd2) > 6'd36) ? ((err_thr_initial + 6'd2) - 6'd37) : (err_thr_initial + 6'd2)) ,
	.dcode_flag_out	(dcode_flag_inside[2]) ,
	.err_one_reg_out	(err_one_reg_inside[2]) ,
	.err_two_reg_out	(err_two_reg_inside[2]) ,
	.err_thr_reg_out	(err_thr_reg_inside[2])
);

single_three_drcreg single_three_drcreg_inst_3(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd3) > 6'd36) ? ((err_one_initial + 6'd3) - 6'd37) : (err_one_initial + 6'd3)) ,
	.err_two_pos		(((err_two_initial + 6'd3) > 6'd36) ? ((err_two_initial + 6'd3) - 6'd37) : (err_two_initial + 6'd3)) ,
	.err_thr_pos		(((err_thr_initial + 6'd3) > 6'd36) ? ((err_thr_initial + 6'd3) - 6'd37) : (err_thr_initial + 6'd3)) ,
	.dcode_flag_out	(dcode_flag_inside[3]) ,
	.err_one_reg_out	(err_one_reg_inside[3]) ,
	.err_two_reg_out	(err_two_reg_inside[3]) ,
	.err_thr_reg_out	(err_thr_reg_inside[3])
);

single_three_drcreg single_three_drcreg_inst_4(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd4) > 6'd36) ? ((err_one_initial + 6'd4) - 6'd37) : (err_one_initial + 6'd4)) ,
	.err_two_pos		(((err_two_initial + 6'd4) > 6'd36) ? ((err_two_initial + 6'd4) - 6'd37) : (err_two_initial + 6'd4)) ,
	.err_thr_pos		(((err_thr_initial + 6'd4) > 6'd36) ? ((err_thr_initial + 6'd4) - 6'd37) : (err_thr_initial + 6'd4)) ,
	.dcode_flag_out	(dcode_flag_inside[4]) ,
	.err_one_reg_out	(err_one_reg_inside[4]) ,
	.err_two_reg_out	(err_two_reg_inside[4]) ,
	.err_thr_reg_out	(err_thr_reg_inside[4])
);

single_three_drcreg single_three_drcreg_inst_5(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd5) > 6'd36) ? ((err_one_initial + 6'd5) - 6'd37) : (err_one_initial + 6'd5)) ,
	.err_two_pos		(((err_two_initial + 6'd5) > 6'd36) ? ((err_two_initial + 6'd5) - 6'd37) : (err_two_initial + 6'd5)) ,
	.err_thr_pos		(((err_thr_initial + 6'd5) > 6'd36) ? ((err_thr_initial + 6'd5) - 6'd37) : (err_thr_initial + 6'd5)) ,
	.dcode_flag_out	(dcode_flag_inside[5]) ,
	.err_one_reg_out	(err_one_reg_inside[5]) ,
	.err_two_reg_out	(err_two_reg_inside[5]) ,
	.err_thr_reg_out	(err_thr_reg_inside[5])
);

single_three_drcreg single_three_drcreg_inst_6(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd6) > 6'd36) ? ((err_one_initial + 6'd6) - 6'd37) : (err_one_initial + 6'd6)) ,
	.err_two_pos		(((err_two_initial + 6'd6) > 6'd36) ? ((err_two_initial + 6'd6) - 6'd37) : (err_two_initial + 6'd6)) ,
	.err_thr_pos		(((err_thr_initial + 6'd6) > 6'd36) ? ((err_thr_initial + 6'd6) - 6'd37) : (err_thr_initial + 6'd6)) ,
	.dcode_flag_out	(dcode_flag_inside[6]) ,
	.err_one_reg_out	(err_one_reg_inside[6]) ,
	.err_two_reg_out	(err_two_reg_inside[6]) ,
	.err_thr_reg_out	(err_thr_reg_inside[6])
);

single_three_drcreg single_three_drcreg_inst_7(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd7) > 6'd36) ? ((err_one_initial + 6'd7) - 6'd37) : (err_one_initial + 6'd7)) ,
	.err_two_pos		(((err_two_initial + 6'd7) > 6'd36) ? ((err_two_initial + 6'd7) - 6'd37) : (err_two_initial + 6'd7)) ,
	.err_thr_pos		(((err_thr_initial + 6'd7) > 6'd36) ? ((err_thr_initial + 6'd7) - 6'd37) : (err_thr_initial + 6'd7)) ,
	.dcode_flag_out	(dcode_flag_inside[7]) ,
	.err_one_reg_out	(err_one_reg_inside[7]) ,
	.err_two_reg_out	(err_two_reg_inside[7]) ,
	.err_thr_reg_out	(err_thr_reg_inside[7])
);

single_three_drcreg single_three_drcreg_inst_8(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd8) > 6'd36) ? ((err_one_initial + 6'd8) - 6'd37) : (err_one_initial + 6'd8)) ,
	.err_two_pos		(((err_two_initial + 6'd8) > 6'd36) ? ((err_two_initial + 6'd8) - 6'd37) : (err_two_initial + 6'd8)) ,
	.err_thr_pos		(((err_thr_initial + 6'd8) > 6'd36) ? ((err_thr_initial + 6'd8) - 6'd37) : (err_thr_initial + 6'd8)) ,
	.dcode_flag_out	(dcode_flag_inside[8]) ,
	.err_one_reg_out	(err_one_reg_inside[8]) ,
	.err_two_reg_out	(err_two_reg_inside[8]) ,
	.err_thr_reg_out	(err_thr_reg_inside[8])
);

single_three_drcreg single_three_drcreg_inst_9(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd9) > 6'd36) ? ((err_one_initial + 6'd9) - 6'd37) : (err_one_initial + 6'd9)) ,
	.err_two_pos		(((err_two_initial + 6'd9) > 6'd36) ? ((err_two_initial + 6'd9) - 6'd37) : (err_two_initial + 6'd9)) ,
	.err_thr_pos		(((err_thr_initial + 6'd9) > 6'd36) ? ((err_thr_initial + 6'd9) - 6'd37) : (err_thr_initial + 6'd9)) ,
	.dcode_flag_out	(dcode_flag_inside[9]) ,
	.err_one_reg_out	(err_one_reg_inside[9]) ,
	.err_two_reg_out	(err_two_reg_inside[9]) ,
	.err_thr_reg_out	(err_thr_reg_inside[9])
);

single_three_drcreg single_three_drcreg_inst_10(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd10) > 6'd36) ? ((err_one_initial + 6'd10) - 6'd37) : (err_one_initial + 6'd10)) ,
	.err_two_pos		(((err_two_initial + 6'd10) > 6'd36) ? ((err_two_initial + 6'd10) - 6'd37) : (err_two_initial + 6'd10)) ,
	.err_thr_pos		(((err_thr_initial + 6'd10) > 6'd36) ? ((err_thr_initial + 6'd10) - 6'd37) : (err_thr_initial + 6'd10)) ,
	.dcode_flag_out	(dcode_flag_inside[10]) ,
	.err_one_reg_out	(err_one_reg_inside[10]) ,
	.err_two_reg_out	(err_two_reg_inside[10]) ,
	.err_thr_reg_out	(err_thr_reg_inside[10])
);

single_three_drcreg single_three_drcreg_inst_11(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd11) > 6'd36) ? ((err_one_initial + 6'd11) - 6'd37) : (err_one_initial + 6'd11)) ,
	.err_two_pos		(((err_two_initial + 6'd11) > 6'd36) ? ((err_two_initial + 6'd11) - 6'd37) : (err_two_initial + 6'd11)) ,
	.err_thr_pos		(((err_thr_initial + 6'd11) > 6'd36) ? ((err_thr_initial + 6'd11) - 6'd37) : (err_thr_initial + 6'd11)) ,
	.dcode_flag_out	(dcode_flag_inside[11]) ,
	.err_one_reg_out	(err_one_reg_inside[11]) ,
	.err_two_reg_out	(err_two_reg_inside[11]) ,
	.err_thr_reg_out	(err_thr_reg_inside[11])
);

single_three_drcreg single_three_drcreg_inst_12(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd12) > 6'd36) ? ((err_one_initial + 6'd12) - 6'd37) : (err_one_initial + 6'd12)) ,
	.err_two_pos		(((err_two_initial + 6'd12) > 6'd36) ? ((err_two_initial + 6'd12) - 6'd37) : (err_two_initial + 6'd12)) ,
	.err_thr_pos		(((err_thr_initial + 6'd12) > 6'd36) ? ((err_thr_initial + 6'd12) - 6'd37) : (err_thr_initial + 6'd12)) ,
	.dcode_flag_out	(dcode_flag_inside[12]) ,
	.err_one_reg_out	(err_one_reg_inside[12]) ,
	.err_two_reg_out	(err_two_reg_inside[12]) ,
	.err_thr_reg_out	(err_thr_reg_inside[12])
);

single_three_drcreg single_three_drcreg_inst_13(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd13) > 6'd36) ? ((err_one_initial + 6'd13) - 6'd37) : (err_one_initial + 6'd13)) ,
	.err_two_pos		(((err_two_initial + 6'd13) > 6'd36) ? ((err_two_initial + 6'd13) - 6'd37) : (err_two_initial + 6'd13)) ,
	.err_thr_pos		(((err_thr_initial + 6'd13) > 6'd36) ? ((err_thr_initial + 6'd13) - 6'd37) : (err_thr_initial + 6'd13)) ,
	.dcode_flag_out	(dcode_flag_inside[13]) ,
	.err_one_reg_out	(err_one_reg_inside[13]) ,
	.err_two_reg_out	(err_two_reg_inside[13]) ,
	.err_thr_reg_out	(err_thr_reg_inside[13])
);

single_three_drcreg single_three_drcreg_inst_14(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd14) > 6'd36) ? ((err_one_initial + 6'd14) - 6'd37) : (err_one_initial + 6'd14)) ,
	.err_two_pos		(((err_two_initial + 6'd14) > 6'd36) ? ((err_two_initial + 6'd14) - 6'd37) : (err_two_initial + 6'd14)) ,
	.err_thr_pos		(((err_thr_initial + 6'd14) > 6'd36) ? ((err_thr_initial + 6'd14) - 6'd37) : (err_thr_initial + 6'd14)) ,
	.dcode_flag_out	(dcode_flag_inside[14]) ,
	.err_one_reg_out	(err_one_reg_inside[14]) ,
	.err_two_reg_out	(err_two_reg_inside[14]) ,
	.err_thr_reg_out	(err_thr_reg_inside[14])
);

single_three_drcreg single_three_drcreg_inst_15(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd15) > 6'd36) ? ((err_one_initial + 6'd15) - 6'd37) : (err_one_initial + 6'd15)) ,
	.err_two_pos		(((err_two_initial + 6'd15) > 6'd36) ? ((err_two_initial + 6'd15) - 6'd37) : (err_two_initial + 6'd15)) ,
	.err_thr_pos		(((err_thr_initial + 6'd15) > 6'd36) ? ((err_thr_initial + 6'd15) - 6'd37) : (err_thr_initial + 6'd15)) ,
	.dcode_flag_out	(dcode_flag_inside[15]) ,
	.err_one_reg_out	(err_one_reg_inside[15]) ,
	.err_two_reg_out	(err_two_reg_inside[15]) ,
	.err_thr_reg_out	(err_thr_reg_inside[15])
);

single_three_drcreg single_three_drcreg_inst_16(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd16) > 6'd36) ? ((err_one_initial + 6'd16) - 6'd37) : (err_one_initial + 6'd16)) ,
	.err_two_pos		(((err_two_initial + 6'd16) > 6'd36) ? ((err_two_initial + 6'd16) - 6'd37) : (err_two_initial + 6'd16)) ,
	.err_thr_pos		(((err_thr_initial + 6'd16) > 6'd36) ? ((err_thr_initial + 6'd16) - 6'd37) : (err_thr_initial + 6'd16)) ,
	.dcode_flag_out	(dcode_flag_inside[16]) ,
	.err_one_reg_out	(err_one_reg_inside[16]) ,
	.err_two_reg_out	(err_two_reg_inside[16]) ,
	.err_thr_reg_out	(err_thr_reg_inside[16])
);

single_three_drcreg single_three_drcreg_inst_17(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd17) > 6'd36) ? ((err_one_initial + 6'd17) - 6'd37) : (err_one_initial + 6'd17)) ,
	.err_two_pos		(((err_two_initial + 6'd17) > 6'd36) ? ((err_two_initial + 6'd17) - 6'd37) : (err_two_initial + 6'd17)) ,
	.err_thr_pos		(((err_thr_initial + 6'd17) > 6'd36) ? ((err_thr_initial + 6'd17) - 6'd37) : (err_thr_initial + 6'd17)) ,
	.dcode_flag_out	(dcode_flag_inside[17]) ,
	.err_one_reg_out	(err_one_reg_inside[17]) ,
	.err_two_reg_out	(err_two_reg_inside[17]) ,
	.err_thr_reg_out	(err_thr_reg_inside[17])
);

single_three_drcreg single_three_drcreg_inst_18(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd18) > 6'd36) ? ((err_one_initial + 6'd18) - 6'd37) : (err_one_initial + 6'd18)) ,
	.err_two_pos		(((err_two_initial + 6'd18) > 6'd36) ? ((err_two_initial + 6'd18) - 6'd37) : (err_two_initial + 6'd18)) ,
	.err_thr_pos		(((err_thr_initial + 6'd18) > 6'd36) ? ((err_thr_initial + 6'd18) - 6'd37) : (err_thr_initial + 6'd18)) ,
	.dcode_flag_out	(dcode_flag_inside[18]) ,
	.err_one_reg_out	(err_one_reg_inside[18]) ,
	.err_two_reg_out	(err_two_reg_inside[18]) ,
	.err_thr_reg_out	(err_thr_reg_inside[18])
);

single_three_drcreg single_three_drcreg_inst_19(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd19) > 6'd36) ? ((err_one_initial + 6'd19) - 6'd37) : (err_one_initial + 6'd19)) ,
	.err_two_pos		(((err_two_initial + 6'd19) > 6'd36) ? ((err_two_initial + 6'd19) - 6'd37) : (err_two_initial + 6'd19)) ,
	.err_thr_pos		(((err_thr_initial + 6'd19) > 6'd36) ? ((err_thr_initial + 6'd19) - 6'd37) : (err_thr_initial + 6'd19)) ,
	.dcode_flag_out	(dcode_flag_inside[19]) ,
	.err_one_reg_out	(err_one_reg_inside[19]) ,
	.err_two_reg_out	(err_two_reg_inside[19]) ,
	.err_thr_reg_out	(err_thr_reg_inside[19])
);

single_three_drcreg single_three_drcreg_inst_20(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd20) > 6'd36) ? ((err_one_initial + 6'd20) - 6'd37) : (err_one_initial + 6'd20)) ,
	.err_two_pos		(((err_two_initial + 6'd20) > 6'd36) ? ((err_two_initial + 6'd20) - 6'd37) : (err_two_initial + 6'd20)) ,
	.err_thr_pos		(((err_thr_initial + 6'd20) > 6'd36) ? ((err_thr_initial + 6'd20) - 6'd37) : (err_thr_initial + 6'd20)) ,
	.dcode_flag_out	(dcode_flag_inside[20]) ,
	.err_one_reg_out	(err_one_reg_inside[20]) ,
	.err_two_reg_out	(err_two_reg_inside[20]) ,
	.err_thr_reg_out	(err_thr_reg_inside[20])
);

single_three_drcreg single_three_drcreg_inst_21(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd21) > 6'd36) ? ((err_one_initial + 6'd21) - 6'd37) : (err_one_initial + 6'd21)) ,
	.err_two_pos		(((err_two_initial + 6'd21) > 6'd36) ? ((err_two_initial + 6'd21) - 6'd37) : (err_two_initial + 6'd21)) ,
	.err_thr_pos		(((err_thr_initial + 6'd21) > 6'd36) ? ((err_thr_initial + 6'd21) - 6'd37) : (err_thr_initial + 6'd21)) ,
	.dcode_flag_out	(dcode_flag_inside[21]) ,
	.err_one_reg_out	(err_one_reg_inside[21]) ,
	.err_two_reg_out	(err_two_reg_inside[21]) ,
	.err_thr_reg_out	(err_thr_reg_inside[21])
);

single_three_drcreg single_three_drcreg_inst_22(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd22) > 6'd36) ? ((err_one_initial + 6'd22) - 6'd37) : (err_one_initial + 6'd22)) ,
	.err_two_pos		(((err_two_initial + 6'd22) > 6'd36) ? ((err_two_initial + 6'd22) - 6'd37) : (err_two_initial + 6'd22)) ,
	.err_thr_pos		(((err_thr_initial + 6'd22) > 6'd36) ? ((err_thr_initial + 6'd22) - 6'd37) : (err_thr_initial + 6'd22)) ,
	.dcode_flag_out	(dcode_flag_inside[22]) ,
	.err_one_reg_out	(err_one_reg_inside[22]) ,
	.err_two_reg_out	(err_two_reg_inside[22]) ,
	.err_thr_reg_out	(err_thr_reg_inside[22])
);

single_three_drcreg single_three_drcreg_inst_23(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd23) > 6'd36) ? ((err_one_initial + 6'd23) - 6'd37) : (err_one_initial + 6'd23)) ,
	.err_two_pos		(((err_two_initial + 6'd23) > 6'd36) ? ((err_two_initial + 6'd23) - 6'd37) : (err_two_initial + 6'd23)) ,
	.err_thr_pos		(((err_thr_initial + 6'd23) > 6'd36) ? ((err_thr_initial + 6'd23) - 6'd37) : (err_thr_initial + 6'd23)) ,
	.dcode_flag_out	(dcode_flag_inside[23]) ,
	.err_one_reg_out	(err_one_reg_inside[23]) ,
	.err_two_reg_out	(err_two_reg_inside[23]) ,
	.err_thr_reg_out	(err_thr_reg_inside[23])
);

single_three_drcreg single_three_drcreg_inst_24(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd24) > 6'd36) ? ((err_one_initial + 6'd24) - 6'd37) : (err_one_initial + 6'd24)) ,
	.err_two_pos		(((err_two_initial + 6'd24) > 6'd36) ? ((err_two_initial + 6'd24) - 6'd37) : (err_two_initial + 6'd24)) ,
	.err_thr_pos		(((err_thr_initial + 6'd24) > 6'd36) ? ((err_thr_initial + 6'd24) - 6'd37) : (err_thr_initial + 6'd24)) ,
	.dcode_flag_out	(dcode_flag_inside[24]) ,
	.err_one_reg_out	(err_one_reg_inside[24]) ,
	.err_two_reg_out	(err_two_reg_inside[24]) ,
	.err_thr_reg_out	(err_thr_reg_inside[24])
);

single_three_drcreg single_three_drcreg_inst_25(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd25) > 6'd36) ? ((err_one_initial + 6'd25) - 6'd37) : (err_one_initial + 6'd25)) ,
	.err_two_pos		(((err_two_initial + 6'd25) > 6'd36) ? ((err_two_initial + 6'd25) - 6'd37) : (err_two_initial + 6'd25)) ,
	.err_thr_pos		(((err_thr_initial + 6'd25) > 6'd36) ? ((err_thr_initial + 6'd25) - 6'd37) : (err_thr_initial + 6'd25)) ,
	.dcode_flag_out	(dcode_flag_inside[25]) ,
	.err_one_reg_out	(err_one_reg_inside[25]) ,
	.err_two_reg_out	(err_two_reg_inside[25]) ,
	.err_thr_reg_out	(err_thr_reg_inside[25])
);

single_three_drcreg single_three_drcreg_inst_26(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd26) > 6'd36) ? ((err_one_initial + 6'd26) - 6'd37) : (err_one_initial + 6'd26)) ,
	.err_two_pos		(((err_two_initial + 6'd26) > 6'd36) ? ((err_two_initial + 6'd26) - 6'd37) : (err_two_initial + 6'd26)) ,
	.err_thr_pos		(((err_thr_initial + 6'd26) > 6'd36) ? ((err_thr_initial + 6'd26) - 6'd37) : (err_thr_initial + 6'd26)) ,
	.dcode_flag_out	(dcode_flag_inside[26]) ,
	.err_one_reg_out	(err_one_reg_inside[26]) ,
	.err_two_reg_out	(err_two_reg_inside[26]) ,
	.err_thr_reg_out	(err_thr_reg_inside[26])
);

single_three_drcreg single_three_drcreg_inst_27(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd27) > 6'd36) ? ((err_one_initial + 6'd27) - 6'd37) : (err_one_initial + 6'd27)) ,
	.err_two_pos		(((err_two_initial + 6'd27) > 6'd36) ? ((err_two_initial + 6'd27) - 6'd37) : (err_two_initial + 6'd27)) ,
	.err_thr_pos		(((err_thr_initial + 6'd27) > 6'd36) ? ((err_thr_initial + 6'd27) - 6'd37) : (err_thr_initial + 6'd27)) ,
	.dcode_flag_out	(dcode_flag_inside[27]) ,
	.err_one_reg_out	(err_one_reg_inside[27]) ,
	.err_two_reg_out	(err_two_reg_inside[27]) ,
	.err_thr_reg_out	(err_thr_reg_inside[27])
);

single_three_drcreg single_three_drcreg_inst_28(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd28) > 6'd36) ? ((err_one_initial + 6'd28) - 6'd37) : (err_one_initial + 6'd28)) ,
	.err_two_pos		(((err_two_initial + 6'd28) > 6'd36) ? ((err_two_initial + 6'd28) - 6'd37) : (err_two_initial + 6'd28)) ,
	.err_thr_pos		(((err_thr_initial + 6'd28) > 6'd36) ? ((err_thr_initial + 6'd28) - 6'd37) : (err_thr_initial + 6'd28)) ,
	.dcode_flag_out	(dcode_flag_inside[28]) ,
	.err_one_reg_out	(err_one_reg_inside[28]) ,
	.err_two_reg_out	(err_two_reg_inside[28]) ,
	.err_thr_reg_out	(err_thr_reg_inside[28])
);

single_three_drcreg single_three_drcreg_inst_29(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd29) > 6'd36) ? ((err_one_initial + 6'd29) - 6'd37) : (err_one_initial + 6'd29)) ,
	.err_two_pos		(((err_two_initial + 6'd29) > 6'd36) ? ((err_two_initial + 6'd29) - 6'd37) : (err_two_initial + 6'd29)) ,
	.err_thr_pos		(((err_thr_initial + 6'd29) > 6'd36) ? ((err_thr_initial + 6'd29) - 6'd37) : (err_thr_initial + 6'd29)) ,
	.dcode_flag_out	(dcode_flag_inside[29]) ,
	.err_one_reg_out	(err_one_reg_inside[29]) ,
	.err_two_reg_out	(err_two_reg_inside[29]) ,
	.err_thr_reg_out	(err_thr_reg_inside[29])
);

single_three_drcreg single_three_drcreg_inst_30(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd30) > 6'd36) ? ((err_one_initial + 6'd30) - 6'd37) : (err_one_initial + 6'd30)) ,
	.err_two_pos		(((err_two_initial + 6'd30) > 6'd36) ? ((err_two_initial + 6'd30) - 6'd37) : (err_two_initial + 6'd30)) ,
	.err_thr_pos		(((err_thr_initial + 6'd30) > 6'd36) ? ((err_thr_initial + 6'd30) - 6'd37) : (err_thr_initial + 6'd30)) ,
	.dcode_flag_out	(dcode_flag_inside[30]) ,
	.err_one_reg_out	(err_one_reg_inside[30]) ,
	.err_two_reg_out	(err_two_reg_inside[30]) ,
	.err_thr_reg_out	(err_thr_reg_inside[30])
);

single_three_drcreg single_three_drcreg_inst_31(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd31) > 6'd36) ? ((err_one_initial + 6'd31) - 6'd37) : (err_one_initial + 6'd31)) ,
	.err_two_pos		(((err_two_initial + 6'd31) > 6'd36) ? ((err_two_initial + 6'd31) - 6'd37) : (err_two_initial + 6'd31)) ,
	.err_thr_pos		(((err_thr_initial + 6'd31) > 6'd36) ? ((err_thr_initial + 6'd31) - 6'd37) : (err_thr_initial + 6'd31)) ,
	.dcode_flag_out	(dcode_flag_inside[31]) ,
	.err_one_reg_out	(err_one_reg_inside[31]) ,
	.err_two_reg_out	(err_two_reg_inside[31]) ,
	.err_thr_reg_out	(err_thr_reg_inside[31])
);

single_three_drcreg single_three_drcreg_inst_32(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd32) > 6'd36) ? ((err_one_initial + 6'd32) - 6'd37) : (err_one_initial + 6'd32)) ,
	.err_two_pos		(((err_two_initial + 6'd32) > 6'd36) ? ((err_two_initial + 6'd32) - 6'd37) : (err_two_initial + 6'd32)) ,
	.err_thr_pos		(((err_thr_initial + 6'd32) > 6'd36) ? ((err_thr_initial + 6'd32) - 6'd37) : (err_thr_initial + 6'd32)) ,
	.dcode_flag_out	(dcode_flag_inside[32]) ,
	.err_one_reg_out	(err_one_reg_inside[32]) ,
	.err_two_reg_out	(err_two_reg_inside[32]) ,
	.err_thr_reg_out	(err_thr_reg_inside[32])
);

single_three_drcreg single_three_drcreg_inst_33(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd33) > 6'd36) ? ((err_one_initial + 6'd33) - 6'd37) : (err_one_initial + 6'd33)) ,
	.err_two_pos		(((err_two_initial + 6'd33) > 6'd36) ? ((err_two_initial + 6'd33) - 6'd37) : (err_two_initial + 6'd33)) ,
	.err_thr_pos		(((err_thr_initial + 6'd33) > 6'd36) ? ((err_thr_initial + 6'd33) - 6'd37) : (err_thr_initial + 6'd33)) ,
	.dcode_flag_out	(dcode_flag_inside[33]) ,
	.err_one_reg_out	(err_one_reg_inside[33]) ,
	.err_two_reg_out	(err_two_reg_inside[33]) ,
	.err_thr_reg_out	(err_thr_reg_inside[33])
);

single_three_drcreg single_three_drcreg_inst_34(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd34) > 6'd36) ? ((err_one_initial + 6'd34) - 6'd37) : (err_one_initial + 6'd34)) ,
	.err_two_pos		(((err_two_initial + 6'd34) > 6'd36) ? ((err_two_initial + 6'd34) - 6'd37) : (err_two_initial + 6'd34)) ,
	.err_thr_pos		(((err_thr_initial + 6'd34) > 6'd36) ? ((err_thr_initial + 6'd34) - 6'd37) : (err_thr_initial + 6'd34)) ,
	.dcode_flag_out	(dcode_flag_inside[34]) ,
	.err_one_reg_out	(err_one_reg_inside[34]) ,
	.err_two_reg_out	(err_two_reg_inside[34]) ,
	.err_thr_reg_out	(err_thr_reg_inside[34])
);

single_three_drcreg single_three_drcreg_inst_35(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd35) > 6'd36) ? ((err_one_initial + 6'd35) - 6'd37) : (err_one_initial + 6'd35)) ,
	.err_two_pos		(((err_two_initial + 6'd35) > 6'd36) ? ((err_two_initial + 6'd35) - 6'd37) : (err_two_initial + 6'd35)) ,
	.err_thr_pos		(((err_thr_initial + 6'd35) > 6'd36) ? ((err_thr_initial + 6'd35) - 6'd37) : (err_thr_initial + 6'd35)) ,
	.dcode_flag_out	(dcode_flag_inside[35]) ,
	.err_one_reg_out	(err_one_reg_inside[35]) ,
	.err_two_reg_out	(err_two_reg_inside[35]) ,
	.err_thr_reg_out	(err_thr_reg_inside[35])
);

single_three_drcreg single_three_drcreg_inst_36(
	.s_in					(s_in) ,
	.err_one_pos		(((err_one_initial + 6'd36) > 6'd36) ? ((err_one_initial + 6'd36) - 6'd37) : (err_one_initial + 6'd36)) ,
	.err_two_pos		(((err_two_initial + 6'd36) > 6'd36) ? ((err_two_initial + 6'd36) - 6'd37) : (err_two_initial + 6'd36)) ,
	.err_thr_pos		(((err_thr_initial + 6'd36) > 6'd36) ? ((err_thr_initial + 6'd36) - 6'd37) : (err_thr_initial + 6'd36)) ,
	.dcode_flag_out	(dcode_flag_inside[36]) ,
	.err_one_reg_out	(err_one_reg_inside[36]) ,
	.err_two_reg_out	(err_two_reg_inside[36]) ,
	.err_thr_reg_out	(err_thr_reg_inside[36])
);

reg [5:0]				err_one_temp[5:0];
reg [5:0]				err_two_temp[5:0];
reg [5:0]				err_thr_temp[5:0];
reg 						dcode_flag_temp[5:0];


genvar i;

generate
	for(i = 0; i < 6; i = i + 1)
	begin : chose1
		if(i < 5)
		begin
			always @ (posedge clk or negedge reset_n)
			begin
				if(!reset_n)
				begin
					err_one_temp[i] <= 6'd0;
					err_two_temp[i] <= 6'd0;
					err_thr_temp[i] <= 6'd0;
					dcode_flag_temp[i] <= 1'b0;
				end
				else
				begin
					if(dcode_flag_inside[i*6])
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6];
						err_two_temp[i] <= err_two_reg_inside[i*6];
						err_thr_temp[i] <= err_thr_reg_inside[i*6];
						dcode_flag_temp[i] <= 1'b1;
					end
					else if(dcode_flag_inside[i*6+1])
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6+1];
						err_two_temp[i] <= err_two_reg_inside[i*6+1];
						err_thr_temp[i] <= err_thr_reg_inside[i*6+1];
						dcode_flag_temp[i] <= 1'b1;
					end
					else if(dcode_flag_inside[i*6+2])
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6+2];
						err_two_temp[i] <= err_two_reg_inside[i*6+2];
						err_thr_temp[i] <= err_thr_reg_inside[i*6+2];
						dcode_flag_temp[i] <= 1'b1;
					end
					else if(dcode_flag_inside[i*6+3])
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6+3];
						err_two_temp[i] <= err_two_reg_inside[i*6+3];
						err_thr_temp[i] <= err_thr_reg_inside[i*6+3];
						dcode_flag_temp[i] <= 1'b1;
					end
					else if(dcode_flag_inside[i*6+4])
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6+4];
						err_two_temp[i] <= err_two_reg_inside[i*6+4];
						err_thr_temp[i] <= err_thr_reg_inside[i*6+4];
						dcode_flag_temp[i] <= 1'b1;
					end
					else if(dcode_flag_inside[i*6+5])
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6+5];
						err_two_temp[i] <= err_two_reg_inside[i*6+5];
						err_thr_temp[i] <= err_thr_reg_inside[i*6+5];
						dcode_flag_temp[i] <= 1'b1;
					end
					else
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6+5];
						err_two_temp[i] <= err_two_reg_inside[i*6+5];
						err_thr_temp[i] <= err_thr_reg_inside[i*6+5];
						dcode_flag_temp[i] <= 1'b0;
					end
				end
			end
		end
		else
		begin
			always @ (posedge clk or negedge reset_n)
			begin
				if(!reset_n)
				begin
					err_one_temp[i] <= 6'd0;
					err_two_temp[i] <= 6'd0;
					err_thr_temp[i] <= 6'd0;
					dcode_flag_temp[i] <= 1'b0;
				end
				else
				begin
					if(dcode_flag_inside[i*6])
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6];
						err_two_temp[i] <= err_two_reg_inside[i*6];
						err_thr_temp[i] <= err_thr_reg_inside[i*6];
						dcode_flag_temp[i] <= 1'b1;
					end
					else if(dcode_flag_inside[i*6+1])
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6+1];
						err_two_temp[i] <= err_two_reg_inside[i*6+1];
						err_thr_temp[i] <= err_thr_reg_inside[i*6+1];
						dcode_flag_temp[i] <= 1'b1;
					end
					else if(dcode_flag_inside[i*6+2])
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6+2];
						err_two_temp[i] <= err_two_reg_inside[i*6+2];
						err_thr_temp[i] <= err_thr_reg_inside[i*6+2];
						dcode_flag_temp[i] <= 1'b1;
					end
					else if(dcode_flag_inside[i*6+3])
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6+3];
						err_two_temp[i] <= err_two_reg_inside[i*6+3];
						err_thr_temp[i] <= err_thr_reg_inside[i*6+3];
						dcode_flag_temp[i] <= 1'b1;
					end
					else if(dcode_flag_inside[i*6+4])
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6+4];
						err_two_temp[i] <= err_two_reg_inside[i*6+4];
						err_thr_temp[i] <= err_thr_reg_inside[i*6+4];
						dcode_flag_temp[i] <= 1'b1;
					end
					else if(dcode_flag_inside[i*6+5])
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6+5];
						err_two_temp[i] <= err_two_reg_inside[i*6+5];
						err_thr_temp[i] <= err_thr_reg_inside[i*6+5];
						dcode_flag_temp[i] <= 1'b1;
					end
					else if(dcode_flag_inside[i*6+6])
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6+6];
						err_two_temp[i] <= err_two_reg_inside[i*6+6];
						err_thr_temp[i] <= err_thr_reg_inside[i*6+6];
						dcode_flag_temp[i] <= 1'b1;
					end
					else
					begin
						err_one_temp[i] <= err_one_reg_inside[i*6+6];
						err_two_temp[i] <= err_two_reg_inside[i*6+6];
						err_thr_temp[i] <= err_thr_reg_inside[i*6+6];
						dcode_flag_temp[i] <= 1'b0;
					end
				end
			end
		end
	end
endgenerate


reg 				dcode_flag_in_temp;

always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		dcode_flag_in_temp <= 1'b0;
	end
	else
	begin
		dcode_flag_in_temp <= dcode_flag_in;
	end
end

reg [5:0]			err_one_in_temp;
reg [5:0]			err_two_in_temp;
reg [5:0]			err_thr_in_temp;

always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		err_one_in_temp <= 6'd0;
		err_two_in_temp <= 6'd0;
		err_thr_in_temp <= 6'd0;
	end
	else
	begin
		err_one_in_temp <= err_one_reg_in;
		err_two_in_temp <= err_two_reg_in;
		err_thr_in_temp <= err_thr_reg_in;
	end
end

always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		err_one_reg_out <= 6'd0;
		err_two_reg_out <= 6'd0;
		err_thr_reg_out <= 6'd0;
		dcode_flag_out <= 1'd0;
	end
	else if(dcode_flag_temp[0])
	begin
		err_one_reg_out <= err_one_temp[0];
		err_two_reg_out <= err_two_temp[0];
		err_thr_reg_out <= err_thr_temp[0];
		dcode_flag_out <= 1'b1;
	end
	else if(dcode_flag_temp[1])
	begin
		err_one_reg_out <= err_one_temp[1];
		err_two_reg_out <= err_two_temp[1];
		err_thr_reg_out <= err_thr_temp[1];
		dcode_flag_out <= 1'b1;
	end
	else if(dcode_flag_temp[2])
	begin
		err_one_reg_out <= err_one_temp[2];
		err_two_reg_out <= err_two_temp[2];
		err_thr_reg_out <= err_thr_temp[2];
		dcode_flag_out <= 1'b1;
	end
	else if(dcode_flag_temp[3])
	begin
		err_one_reg_out <= err_one_temp[3];
		err_two_reg_out <= err_two_temp[3];
		err_thr_reg_out <= err_thr_temp[3];
		dcode_flag_out <= 1'b1;
	end
	else if(dcode_flag_temp[4])
	begin
		err_one_reg_out <= err_one_temp[4];
		err_two_reg_out <= err_two_temp[4];
		err_thr_reg_out <= err_thr_temp[4];
		dcode_flag_out <= 1'b1;
	end
	else if(dcode_flag_temp[5])
	begin
		err_one_reg_out <= err_one_temp[5];
		err_two_reg_out <= err_two_temp[5];
		err_thr_reg_out <= err_thr_temp[5];
		dcode_flag_out <= 1'b1;
	end
	else
	begin
		if(dcode_flag_in_temp)
		begin
			err_one_reg_out <= err_one_in_temp;
			err_two_reg_out <= err_two_in_temp;
			err_thr_reg_out <= err_thr_in_temp;
			dcode_flag_out <= 1'b1;
		end
		else
		begin
			err_one_reg_out <= err_one_temp[5];
			err_two_reg_out <= err_two_temp[5];
			err_thr_reg_out <= err_thr_temp[5];
			dcode_flag_out <= 1'b0;
		end
	end
end
















endmodule
