module pipe_part_thr(
	clk,reset_n,
	
	s_in,	dcode_flag_in,
	
	err_one_reg_in,err_two_reg_in,err_thr_reg_in,
	
	dcode_flag_out,err_one_out,err_two_out,err_thr_out,s_out,
	
	part_one_in,part_two_in,part_one_out,part_two_out
);

input 						clk;
input 						reset_n;

input [35:0]				s_in;
input 						dcode_flag_in;

input [5:0]					err_one_reg_in;
input [5:0]					err_two_reg_in;
input [5:0]					err_thr_reg_in;

output 						dcode_flag_out;

output [5:0]				err_one_out;
output [5:0]				err_two_out;
output [5:0]				err_thr_out;

output [35:0]				s_out;

input [5:0]					part_one_in;
input [5:0]					part_two_in;

output [5:0]				part_one_out;
output [5:0]				part_two_out;

wire  						dcode_flag_inside[33:0];

wire [5:0]					err_one_inside[33:0];
wire [5:0]					err_two_inside[33:0];
wire [5:0]					err_thr_inside[33:0];

wire [5:0]					part_one_inside[33:0];
wire [5:0]					part_two_inside[33:0];

wire [35:0]					s_inside[33:0];




thr_pipe37 thr_pipe37_inst_0
(
	.clk						(clk) ,	// input  clk
	.reset_n					(reset_n) ,	// input  reset_n
	.s_in						(s_in) ,	// input [35:0] s_in
	.dcode_flag_in			(dcode_flag_in) ,	// input  dcode_flag_in
	.err_one_reg_in		(err_one_reg_in) ,	// input [5:0] err_one_reg_in
	.err_two_reg_in		(err_two_reg_in) ,	// input [5:0] err_two_reg_in
	.err_thr_reg_in		(err_thr_reg_in) ,	// input [5:0] err_thr_reg_in
	.part_one_in			(part_one_in) ,	// input [5:0] part_one_in
	.part_two_in			(part_two_in) ,	// input [5:0] part_two_in
	.part_offset			(6'd0) ,	// input [5:0] part_offset
	.dcode_flag_out		(dcode_flag_inside[0]) ,	// output  dcode_flag_out
	.err_one_reg_out		(err_one_inside[0]) ,	// output [5:0] err_one_reg_out
	.err_two_reg_out		(err_two_inside[0]) ,	// output [5:0] err_two_reg_out
	.err_thr_reg_out		(err_thr_inside[0]) ,	// output [5:0] err_thr_reg_out
	.part_one_out			(part_one_inside[0]) ,	// output [5:0] part_one_out
	.part_two_out			(part_two_inside[0]) ,	// output [5:0] part_two_out
	.s_out					(s_inside[0]) 	// output [35:0] s_out
);

thr_pipe37 		thr_pipe37_inst_1(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[0]) ,
	.dcode_flag_in			(dcode_flag_inside[0]) ,	
	.err_one_reg_in		(err_one_inside[0]) ,
	.err_two_reg_in		(err_two_inside[0]) ,
	.err_thr_reg_in		(err_thr_inside[0]) ,
	.part_one_in			(part_one_inside[0]) ,
	.part_two_in			(part_two_inside[0]) ,
	.part_offset			(6'd1) ,
	.dcode_flag_out		(dcode_flag_inside[1]) ,
	.err_one_reg_out		(err_one_inside[1]) ,
	.err_two_reg_out		(err_two_inside[1]) ,
	.err_thr_reg_out		(err_thr_inside[1]) ,
	.part_one_out			(part_one_inside[1]) ,
	.part_two_out			(part_two_inside[1]) ,
	.s_out					(s_inside[1])
);

thr_pipe37 		thr_pipe37_inst_2(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[1]) ,
	.dcode_flag_in			(dcode_flag_inside[1]) ,	
	.err_one_reg_in		(err_one_inside[1]) ,
	.err_two_reg_in		(err_two_inside[1]) ,
	.err_thr_reg_in		(err_thr_inside[1]) ,
	.part_one_in			(part_one_inside[1]) ,
	.part_two_in			(part_two_inside[1]) ,
	.part_offset			(6'd2) ,
	.dcode_flag_out		(dcode_flag_inside[2]) ,
	.err_one_reg_out		(err_one_inside[2]) ,
	.err_two_reg_out		(err_two_inside[2]) ,
	.err_thr_reg_out		(err_thr_inside[2]) ,
	.part_one_out			(part_one_inside[2]) ,
	.part_two_out			(part_two_inside[2]) ,
	.s_out					(s_inside[2])
);

thr_pipe37 		thr_pipe37_inst_3(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[2]) ,
	.dcode_flag_in			(dcode_flag_inside[2]) ,	
	.err_one_reg_in		(err_one_inside[2]) ,
	.err_two_reg_in		(err_two_inside[2]) ,
	.err_thr_reg_in		(err_thr_inside[2]) ,
	.part_one_in			(part_one_inside[2]) ,
	.part_two_in			(part_two_inside[2]) ,
	.part_offset			(6'd3) ,
	.dcode_flag_out		(dcode_flag_inside[3]) ,
	.err_one_reg_out		(err_one_inside[3]) ,
	.err_two_reg_out		(err_two_inside[3]) ,
	.err_thr_reg_out		(err_thr_inside[3]) ,
	.part_one_out			(part_one_inside[3]) ,
	.part_two_out			(part_two_inside[3]) ,
	.s_out					(s_inside[3])
);

thr_pipe37 		thr_pipe37_inst_4(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[3]) ,
	.dcode_flag_in			(dcode_flag_inside[3]) ,	
	.err_one_reg_in		(err_one_inside[3]) ,
	.err_two_reg_in		(err_two_inside[3]) ,
	.err_thr_reg_in		(err_thr_inside[3]) ,
	.part_one_in			(part_one_inside[3]) ,
	.part_two_in			(part_two_inside[3]) ,
	.part_offset			(6'd4) ,
	.dcode_flag_out		(dcode_flag_inside[4]) ,
	.err_one_reg_out		(err_one_inside[4]) ,
	.err_two_reg_out		(err_two_inside[4]) ,
	.err_thr_reg_out		(err_thr_inside[4]) ,
	.part_one_out			(part_one_inside[4]) ,
	.part_two_out			(part_two_inside[4]) ,
	.s_out					(s_inside[4])
);

thr_pipe37 		thr_pipe37_inst_5(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[4]) ,
	.dcode_flag_in			(dcode_flag_inside[4]) ,	
	.err_one_reg_in		(err_one_inside[4]) ,
	.err_two_reg_in		(err_two_inside[4]) ,
	.err_thr_reg_in		(err_thr_inside[4]) ,
	.part_one_in			(part_one_inside[4]) ,
	.part_two_in			(part_two_inside[4]) ,
	.part_offset			(6'd5) ,
	.dcode_flag_out		(dcode_flag_inside[5]) ,
	.err_one_reg_out		(err_one_inside[5]) ,
	.err_two_reg_out		(err_two_inside[5]) ,
	.err_thr_reg_out		(err_thr_inside[5]) ,
	.part_one_out			(part_one_inside[5]) ,
	.part_two_out			(part_two_inside[5]) ,
	.s_out					(s_inside[5])
);

thr_pipe37 		thr_pipe37_inst_6(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[5]) ,
	.dcode_flag_in			(dcode_flag_inside[5]) ,	
	.err_one_reg_in		(err_one_inside[5]) ,
	.err_two_reg_in		(err_two_inside[5]) ,
	.err_thr_reg_in		(err_thr_inside[5]) ,
	.part_one_in			(part_one_inside[5]) ,
	.part_two_in			(part_two_inside[5]) ,
	.part_offset			(6'd6) ,
	.dcode_flag_out		(dcode_flag_inside[6]) ,
	.err_one_reg_out		(err_one_inside[6]) ,
	.err_two_reg_out		(err_two_inside[6]) ,
	.err_thr_reg_out		(err_thr_inside[6]) ,
	.part_one_out			(part_one_inside[6]) ,
	.part_two_out			(part_two_inside[6]) ,
	.s_out					(s_inside[6])
);

thr_pipe37 		thr_pipe37_inst_7(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[6]) ,
	.dcode_flag_in			(dcode_flag_inside[6]) ,	
	.err_one_reg_in		(err_one_inside[6]) ,
	.err_two_reg_in		(err_two_inside[6]) ,
	.err_thr_reg_in		(err_thr_inside[6]) ,
	.part_one_in			(part_one_inside[6]) ,
	.part_two_in			(part_two_inside[6]) ,
	.part_offset			(6'd7) ,
	.dcode_flag_out		(dcode_flag_inside[7]) ,
	.err_one_reg_out		(err_one_inside[7]) ,
	.err_two_reg_out		(err_two_inside[7]) ,
	.err_thr_reg_out		(err_thr_inside[7]) ,
	.part_one_out			(part_one_inside[7]) ,
	.part_two_out			(part_two_inside[7]) ,
	.s_out					(s_inside[7])
);

thr_pipe37 		thr_pipe37_inst_8(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[7]) ,
	.dcode_flag_in			(dcode_flag_inside[7]) ,	
	.err_one_reg_in		(err_one_inside[7]) ,
	.err_two_reg_in		(err_two_inside[7]) ,
	.err_thr_reg_in		(err_thr_inside[7]) ,
	.part_one_in			(part_one_inside[7]) ,
	.part_two_in			(part_two_inside[7]) ,
	.part_offset			(6'd8) ,
	.dcode_flag_out		(dcode_flag_inside[8]) ,
	.err_one_reg_out		(err_one_inside[8]) ,
	.err_two_reg_out		(err_two_inside[8]) ,
	.err_thr_reg_out		(err_thr_inside[8]) ,
	.part_one_out			(part_one_inside[8]) ,
	.part_two_out			(part_two_inside[8]) ,
	.s_out					(s_inside[8])
);

thr_pipe37 		thr_pipe37_inst_9(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[8]) ,
	.dcode_flag_in			(dcode_flag_inside[8]) ,	
	.err_one_reg_in		(err_one_inside[8]) ,
	.err_two_reg_in		(err_two_inside[8]) ,
	.err_thr_reg_in		(err_thr_inside[8]) ,
	.part_one_in			(part_one_inside[8]) ,
	.part_two_in			(part_two_inside[8]) ,
	.part_offset			(6'd9) ,
	.dcode_flag_out		(dcode_flag_inside[9]) ,
	.err_one_reg_out		(err_one_inside[9]) ,
	.err_two_reg_out		(err_two_inside[9]) ,
	.err_thr_reg_out		(err_thr_inside[9]) ,
	.part_one_out			(part_one_inside[9]) ,
	.part_two_out			(part_two_inside[9]) ,
	.s_out					(s_inside[9])
);

thr_pipe37 		thr_pipe37_inst_10(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[9]) ,
	.dcode_flag_in			(dcode_flag_inside[9]) ,	
	.err_one_reg_in		(err_one_inside[9]) ,
	.err_two_reg_in		(err_two_inside[9]) ,
	.err_thr_reg_in		(err_thr_inside[9]) ,
	.part_one_in			(part_one_inside[9]) ,
	.part_two_in			(part_two_inside[9]) ,
	.part_offset			(6'd10) ,
	.dcode_flag_out		(dcode_flag_inside[10]) ,
	.err_one_reg_out		(err_one_inside[10]) ,
	.err_two_reg_out		(err_two_inside[10]) ,
	.err_thr_reg_out		(err_thr_inside[10]) ,
	.part_one_out			(part_one_inside[10]) ,
	.part_two_out			(part_two_inside[10]) ,
	.s_out					(s_inside[10])
);

thr_pipe37 		thr_pipe37_inst_11(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[10]) ,
	.dcode_flag_in			(dcode_flag_inside[10]) ,	
	.err_one_reg_in		(err_one_inside[10]) ,
	.err_two_reg_in		(err_two_inside[10]) ,
	.err_thr_reg_in		(err_thr_inside[10]) ,
	.part_one_in			(part_one_inside[10]) ,
	.part_two_in			(part_two_inside[10]) ,
	.part_offset			(6'd11) ,
	.dcode_flag_out		(dcode_flag_inside[11]) ,
	.err_one_reg_out		(err_one_inside[11]) ,
	.err_two_reg_out		(err_two_inside[11]) ,
	.err_thr_reg_out		(err_thr_inside[11]) ,
	.part_one_out			(part_one_inside[11]) ,
	.part_two_out			(part_two_inside[11]) ,
	.s_out					(s_inside[11])
);

thr_pipe37 		thr_pipe37_inst_12(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[11]) ,
	.dcode_flag_in			(dcode_flag_inside[11]) ,	
	.err_one_reg_in		(err_one_inside[11]) ,
	.err_two_reg_in		(err_two_inside[11]) ,
	.err_thr_reg_in		(err_thr_inside[11]) ,
	.part_one_in			(part_one_inside[11]) ,
	.part_two_in			(part_two_inside[11]) ,
	.part_offset			(6'd12) ,
	.dcode_flag_out		(dcode_flag_inside[12]) ,
	.err_one_reg_out		(err_one_inside[12]) ,
	.err_two_reg_out		(err_two_inside[12]) ,
	.err_thr_reg_out		(err_thr_inside[12]) ,
	.part_one_out			(part_one_inside[12]) ,
	.part_two_out			(part_two_inside[12]) ,
	.s_out					(s_inside[12])
);

thr_pipe37 		thr_pipe37_inst_13(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[12]) ,
	.dcode_flag_in			(dcode_flag_inside[12]) ,	
	.err_one_reg_in		(err_one_inside[12]) ,
	.err_two_reg_in		(err_two_inside[12]) ,
	.err_thr_reg_in		(err_thr_inside[12]) ,
	.part_one_in			(part_one_inside[12]) ,
	.part_two_in			(part_two_inside[12]) ,
	.part_offset			(6'd13) ,
	.dcode_flag_out		(dcode_flag_inside[13]) ,
	.err_one_reg_out		(err_one_inside[13]) ,
	.err_two_reg_out		(err_two_inside[13]) ,
	.err_thr_reg_out		(err_thr_inside[13]) ,
	.part_one_out			(part_one_inside[13]) ,
	.part_two_out			(part_two_inside[13]) ,
	.s_out					(s_inside[13])
);

thr_pipe37 		thr_pipe37_inst_14(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[13]) ,
	.dcode_flag_in			(dcode_flag_inside[13]) ,	
	.err_one_reg_in		(err_one_inside[13]) ,
	.err_two_reg_in		(err_two_inside[13]) ,
	.err_thr_reg_in		(err_thr_inside[13]) ,
	.part_one_in			(part_one_inside[13]) ,
	.part_two_in			(part_two_inside[13]) ,
	.part_offset			(6'd14) ,
	.dcode_flag_out		(dcode_flag_inside[14]) ,
	.err_one_reg_out		(err_one_inside[14]) ,
	.err_two_reg_out		(err_two_inside[14]) ,
	.err_thr_reg_out		(err_thr_inside[14]) ,
	.part_one_out			(part_one_inside[14]) ,
	.part_two_out			(part_two_inside[14]) ,
	.s_out					(s_inside[14])
);

thr_pipe37 		thr_pipe37_inst_15(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[14]) ,
	.dcode_flag_in			(dcode_flag_inside[14]) ,	
	.err_one_reg_in		(err_one_inside[14]) ,
	.err_two_reg_in		(err_two_inside[14]) ,
	.err_thr_reg_in		(err_thr_inside[14]) ,
	.part_one_in			(part_one_inside[14]) ,
	.part_two_in			(part_two_inside[14]) ,
	.part_offset			(6'd15) ,
	.dcode_flag_out		(dcode_flag_inside[15]) ,
	.err_one_reg_out		(err_one_inside[15]) ,
	.err_two_reg_out		(err_two_inside[15]) ,
	.err_thr_reg_out		(err_thr_inside[15]) ,
	.part_one_out			(part_one_inside[15]) ,
	.part_two_out			(part_two_inside[15]) ,
	.s_out					(s_inside[15])
);

thr_pipe37 		thr_pipe37_inst_16(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[15]) ,
	.dcode_flag_in			(dcode_flag_inside[15]) ,	
	.err_one_reg_in		(err_one_inside[15]) ,
	.err_two_reg_in		(err_two_inside[15]) ,
	.err_thr_reg_in		(err_thr_inside[15]) ,
	.part_one_in			(part_one_inside[15]) ,
	.part_two_in			(part_two_inside[15]) ,
	.part_offset			(6'd16) ,
	.dcode_flag_out		(dcode_flag_inside[16]) ,
	.err_one_reg_out		(err_one_inside[16]) ,
	.err_two_reg_out		(err_two_inside[16]) ,
	.err_thr_reg_out		(err_thr_inside[16]) ,
	.part_one_out			(part_one_inside[16]) ,
	.part_two_out			(part_two_inside[16]) ,
	.s_out					(s_inside[16])
);

thr_pipe37 		thr_pipe37_inst_17(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[16]) ,
	.dcode_flag_in			(dcode_flag_inside[16]) ,	
	.err_one_reg_in		(err_one_inside[16]) ,
	.err_two_reg_in		(err_two_inside[16]) ,
	.err_thr_reg_in		(err_thr_inside[16]) ,
	.part_one_in			(part_one_inside[16]) ,
	.part_two_in			(part_two_inside[16]) ,
	.part_offset			(6'd17) ,
	.dcode_flag_out		(dcode_flag_inside[17]) ,
	.err_one_reg_out		(err_one_inside[17]) ,
	.err_two_reg_out		(err_two_inside[17]) ,
	.err_thr_reg_out		(err_thr_inside[17]) ,
	.part_one_out			(part_one_inside[17]) ,
	.part_two_out			(part_two_inside[17]) ,
	.s_out					(s_inside[17])
);

thr_pipe37 		thr_pipe37_inst_18(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[17]) ,
	.dcode_flag_in			(dcode_flag_inside[17]) ,	
	.err_one_reg_in		(err_one_inside[17]) ,
	.err_two_reg_in		(err_two_inside[17]) ,
	.err_thr_reg_in		(err_thr_inside[17]) ,
	.part_one_in			(part_one_inside[17]) ,
	.part_two_in			(part_two_inside[17]) ,
	.part_offset			(6'd18) ,
	.dcode_flag_out		(dcode_flag_inside[18]) ,
	.err_one_reg_out		(err_one_inside[18]) ,
	.err_two_reg_out		(err_two_inside[18]) ,
	.err_thr_reg_out		(err_thr_inside[18]) ,
	.part_one_out			(part_one_inside[18]) ,
	.part_two_out			(part_two_inside[18]) ,
	.s_out					(s_inside[18])
);

thr_pipe37 		thr_pipe37_inst_19(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[18]) ,
	.dcode_flag_in			(dcode_flag_inside[18]) ,	
	.err_one_reg_in		(err_one_inside[18]) ,
	.err_two_reg_in		(err_two_inside[18]) ,
	.err_thr_reg_in		(err_thr_inside[18]) ,
	.part_one_in			(part_one_inside[18]) ,
	.part_two_in			(part_two_inside[18]) ,
	.part_offset			(6'd19) ,
	.dcode_flag_out		(dcode_flag_inside[19]) ,
	.err_one_reg_out		(err_one_inside[19]) ,
	.err_two_reg_out		(err_two_inside[19]) ,
	.err_thr_reg_out		(err_thr_inside[19]) ,
	.part_one_out			(part_one_inside[19]) ,
	.part_two_out			(part_two_inside[19]) ,
	.s_out					(s_inside[19])
);

thr_pipe37 		thr_pipe37_inst_20(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[19]) ,
	.dcode_flag_in			(dcode_flag_inside[19]) ,	
	.err_one_reg_in		(err_one_inside[19]) ,
	.err_two_reg_in		(err_two_inside[19]) ,
	.err_thr_reg_in		(err_thr_inside[19]) ,
	.part_one_in			(part_one_inside[19]) ,
	.part_two_in			(part_two_inside[19]) ,
	.part_offset			(6'd20) ,
	.dcode_flag_out		(dcode_flag_inside[20]) ,
	.err_one_reg_out		(err_one_inside[20]) ,
	.err_two_reg_out		(err_two_inside[20]) ,
	.err_thr_reg_out		(err_thr_inside[20]) ,
	.part_one_out			(part_one_inside[20]) ,
	.part_two_out			(part_two_inside[20]) ,
	.s_out					(s_inside[20])
);

thr_pipe37 		thr_pipe37_inst_21(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[20]) ,
	.dcode_flag_in			(dcode_flag_inside[20]) ,	
	.err_one_reg_in		(err_one_inside[20]) ,
	.err_two_reg_in		(err_two_inside[20]) ,
	.err_thr_reg_in		(err_thr_inside[20]) ,
	.part_one_in			(part_one_inside[20]) ,
	.part_two_in			(part_two_inside[20]) ,
	.part_offset			(6'd21) ,
	.dcode_flag_out		(dcode_flag_inside[21]) ,
	.err_one_reg_out		(err_one_inside[21]) ,
	.err_two_reg_out		(err_two_inside[21]) ,
	.err_thr_reg_out		(err_thr_inside[21]) ,
	.part_one_out			(part_one_inside[21]) ,
	.part_two_out			(part_two_inside[21]) ,
	.s_out					(s_inside[21])
);

thr_pipe37 		thr_pipe37_inst_22(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[21]) ,
	.dcode_flag_in			(dcode_flag_inside[21]) ,	
	.err_one_reg_in		(err_one_inside[21]) ,
	.err_two_reg_in		(err_two_inside[21]) ,
	.err_thr_reg_in		(err_thr_inside[21]) ,
	.part_one_in			(part_one_inside[21]) ,
	.part_two_in			(part_two_inside[21]) ,
	.part_offset			(6'd22) ,
	.dcode_flag_out		(dcode_flag_inside[22]) ,
	.err_one_reg_out		(err_one_inside[22]) ,
	.err_two_reg_out		(err_two_inside[22]) ,
	.err_thr_reg_out		(err_thr_inside[22]) ,
	.part_one_out			(part_one_inside[22]) ,
	.part_two_out			(part_two_inside[22]) ,
	.s_out					(s_inside[22])
);

thr_pipe37 		thr_pipe37_inst_23(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[22]) ,
	.dcode_flag_in			(dcode_flag_inside[22]) ,	
	.err_one_reg_in		(err_one_inside[22]) ,
	.err_two_reg_in		(err_two_inside[22]) ,
	.err_thr_reg_in		(err_thr_inside[22]) ,
	.part_one_in			(part_one_inside[22]) ,
	.part_two_in			(part_two_inside[22]) ,
	.part_offset			(6'd23) ,
	.dcode_flag_out		(dcode_flag_inside[23]) ,
	.err_one_reg_out		(err_one_inside[23]) ,
	.err_two_reg_out		(err_two_inside[23]) ,
	.err_thr_reg_out		(err_thr_inside[23]) ,
	.part_one_out			(part_one_inside[23]) ,
	.part_two_out			(part_two_inside[23]) ,
	.s_out					(s_inside[23])
);

thr_pipe37 		thr_pipe37_inst_24(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[23]) ,
	.dcode_flag_in			(dcode_flag_inside[23]) ,	
	.err_one_reg_in		(err_one_inside[23]) ,
	.err_two_reg_in		(err_two_inside[23]) ,
	.err_thr_reg_in		(err_thr_inside[23]) ,
	.part_one_in			(part_one_inside[23]) ,
	.part_two_in			(part_two_inside[23]) ,
	.part_offset			(6'd24) ,
	.dcode_flag_out		(dcode_flag_inside[24]) ,
	.err_one_reg_out		(err_one_inside[24]) ,
	.err_two_reg_out		(err_two_inside[24]) ,
	.err_thr_reg_out		(err_thr_inside[24]) ,
	.part_one_out			(part_one_inside[24]) ,
	.part_two_out			(part_two_inside[24]) ,
	.s_out					(s_inside[24])
);

thr_pipe37 		thr_pipe37_inst_25(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[24]) ,
	.dcode_flag_in			(dcode_flag_inside[24]) ,	
	.err_one_reg_in		(err_one_inside[24]) ,
	.err_two_reg_in		(err_two_inside[24]) ,
	.err_thr_reg_in		(err_thr_inside[24]) ,
	.part_one_in			(part_one_inside[24]) ,
	.part_two_in			(part_two_inside[24]) ,
	.part_offset			(6'd25) ,
	.dcode_flag_out		(dcode_flag_inside[25]) ,
	.err_one_reg_out		(err_one_inside[25]) ,
	.err_two_reg_out		(err_two_inside[25]) ,
	.err_thr_reg_out		(err_thr_inside[25]) ,
	.part_one_out			(part_one_inside[25]) ,
	.part_two_out			(part_two_inside[25]) ,
	.s_out					(s_inside[25])
);

thr_pipe37 		thr_pipe37_inst_26(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[25]) ,
	.dcode_flag_in			(dcode_flag_inside[25]) ,	
	.err_one_reg_in		(err_one_inside[25]) ,
	.err_two_reg_in		(err_two_inside[25]) ,
	.err_thr_reg_in		(err_thr_inside[25]) ,
	.part_one_in			(part_one_inside[25]) ,
	.part_two_in			(part_two_inside[25]) ,
	.part_offset			(6'd26) ,
	.dcode_flag_out		(dcode_flag_inside[26]) ,
	.err_one_reg_out		(err_one_inside[26]) ,
	.err_two_reg_out		(err_two_inside[26]) ,
	.err_thr_reg_out		(err_thr_inside[26]) ,
	.part_one_out			(part_one_inside[26]) ,
	.part_two_out			(part_two_inside[26]) ,
	.s_out					(s_inside[26])
);

thr_pipe37 		thr_pipe37_inst_27(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[26]) ,
	.dcode_flag_in			(dcode_flag_inside[26]) ,	
	.err_one_reg_in		(err_one_inside[26]) ,
	.err_two_reg_in		(err_two_inside[26]) ,
	.err_thr_reg_in		(err_thr_inside[26]) ,
	.part_one_in			(part_one_inside[26]) ,
	.part_two_in			(part_two_inside[26]) ,
	.part_offset			(6'd27) ,
	.dcode_flag_out		(dcode_flag_inside[27]) ,
	.err_one_reg_out		(err_one_inside[27]) ,
	.err_two_reg_out		(err_two_inside[27]) ,
	.err_thr_reg_out		(err_thr_inside[27]) ,
	.part_one_out			(part_one_inside[27]) ,
	.part_two_out			(part_two_inside[27]) ,
	.s_out					(s_inside[27])
);

thr_pipe37 		thr_pipe37_inst_28(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[27]) ,
	.dcode_flag_in			(dcode_flag_inside[27]) ,	
	.err_one_reg_in		(err_one_inside[27]) ,
	.err_two_reg_in		(err_two_inside[27]) ,
	.err_thr_reg_in		(err_thr_inside[27]) ,
	.part_one_in			(part_one_inside[27]) ,
	.part_two_in			(part_two_inside[27]) ,
	.part_offset			(6'd28) ,
	.dcode_flag_out		(dcode_flag_inside[28]) ,
	.err_one_reg_out		(err_one_inside[28]) ,
	.err_two_reg_out		(err_two_inside[28]) ,
	.err_thr_reg_out		(err_thr_inside[28]) ,
	.part_one_out			(part_one_inside[28]) ,
	.part_two_out			(part_two_inside[28]) ,
	.s_out					(s_inside[28])
);

thr_pipe37 		thr_pipe37_inst_29(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[28]) ,
	.dcode_flag_in			(dcode_flag_inside[28]) ,	
	.err_one_reg_in		(err_one_inside[28]) ,
	.err_two_reg_in		(err_two_inside[28]) ,
	.err_thr_reg_in		(err_thr_inside[28]) ,
	.part_one_in			(part_one_inside[28]) ,
	.part_two_in			(part_two_inside[28]) ,
	.part_offset			(6'd29) ,
	.dcode_flag_out		(dcode_flag_inside[29]) ,
	.err_one_reg_out		(err_one_inside[29]) ,
	.err_two_reg_out		(err_two_inside[29]) ,
	.err_thr_reg_out		(err_thr_inside[29]) ,
	.part_one_out			(part_one_inside[29]) ,
	.part_two_out			(part_two_inside[29]) ,
	.s_out					(s_inside[29])
);

thr_pipe37 		thr_pipe37_inst_30(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[29]) ,
	.dcode_flag_in			(dcode_flag_inside[29]) ,	
	.err_one_reg_in		(err_one_inside[29]) ,
	.err_two_reg_in		(err_two_inside[29]) ,
	.err_thr_reg_in		(err_thr_inside[29]) ,
	.part_one_in			(part_one_inside[29]) ,
	.part_two_in			(part_two_inside[29]) ,
	.part_offset			(6'd30) ,
	.dcode_flag_out		(dcode_flag_inside[30]) ,
	.err_one_reg_out		(err_one_inside[30]) ,
	.err_two_reg_out		(err_two_inside[30]) ,
	.err_thr_reg_out		(err_thr_inside[30]) ,
	.part_one_out			(part_one_inside[30]) ,
	.part_two_out			(part_two_inside[30]) ,
	.s_out					(s_inside[30])
);

thr_pipe37 		thr_pipe37_inst_31(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[30]) ,
	.dcode_flag_in			(dcode_flag_inside[30]) ,	
	.err_one_reg_in		(err_one_inside[30]) ,
	.err_two_reg_in		(err_two_inside[30]) ,
	.err_thr_reg_in		(err_thr_inside[30]) ,
	.part_one_in			(part_one_inside[30]) ,
	.part_two_in			(part_two_inside[30]) ,
	.part_offset			(6'd31) ,
	.dcode_flag_out		(dcode_flag_inside[31]) ,
	.err_one_reg_out		(err_one_inside[31]) ,
	.err_two_reg_out		(err_two_inside[31]) ,
	.err_thr_reg_out		(err_thr_inside[31]) ,
	.part_one_out			(part_one_inside[31]) ,
	.part_two_out			(part_two_inside[31]) ,
	.s_out					(s_inside[31])
);

thr_pipe37 		thr_pipe37_inst_32(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[31]) ,
	.dcode_flag_in			(dcode_flag_inside[31]) ,	
	.err_one_reg_in		(err_one_inside[31]) ,
	.err_two_reg_in		(err_two_inside[31]) ,
	.err_thr_reg_in		(err_thr_inside[31]) ,
	.part_one_in			(part_one_inside[31]) ,
	.part_two_in			(part_two_inside[31]) ,
	.part_offset			(6'd32) ,
	.dcode_flag_out		(dcode_flag_inside[32]) ,
	.err_one_reg_out		(err_one_inside[32]) ,
	.err_two_reg_out		(err_two_inside[32]) ,
	.err_thr_reg_out		(err_thr_inside[32]) ,
	.part_one_out			(part_one_inside[32]) ,
	.part_two_out			(part_two_inside[32]) ,
	.s_out					(s_inside[32])
);

thr_pipe37 		thr_pipe37_inst_33(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[32]) ,
	.dcode_flag_in			(dcode_flag_inside[32]) ,	
	.err_one_reg_in		(err_one_inside[32]) ,
	.err_two_reg_in		(err_two_inside[32]) ,
	.err_thr_reg_in		(err_thr_inside[32]) ,
	.part_one_in			(part_one_inside[32]) ,
	.part_two_in			(part_two_inside[32]) ,
	.part_offset			(6'd33) ,
	.dcode_flag_out		(dcode_flag_inside[33]) ,
	.err_one_reg_out		(err_one_inside[33]) ,
	.err_two_reg_out		(err_two_inside[33]) ,
	.err_thr_reg_out		(err_thr_inside[33]) ,
	.part_one_out			(part_one_inside[33]) ,
	.part_two_out			(part_two_inside[33]) ,
	.s_out					(s_inside[33])
);

thr_pipe37 		thr_pipe37_inst_34(
	.clk						(clk) ,
	.reset_n					(reset_n) ,
	.s_in						(s_inside[33]) ,
	.dcode_flag_in			(dcode_flag_inside[33]) ,	
	.err_one_reg_in		(err_one_inside[33]) ,
	.err_two_reg_in		(err_two_inside[33]) ,
	.err_thr_reg_in		(err_thr_inside[33]) ,
	.part_one_in			(part_one_inside[33]) ,
	.part_two_in			(part_two_inside[33]) ,
	.part_offset			(6'd34) ,
	.dcode_flag_out		(dcode_flag_out) ,
	.err_one_reg_out		(err_one_out) ,
	.err_two_reg_out		(err_two_out) ,
	.err_thr_reg_out		(err_thr_out) ,
	.part_one_out			(part_one_out) ,
	.part_two_out			(part_two_out) ,
	.s_out					(s_out)
);








endmodule
