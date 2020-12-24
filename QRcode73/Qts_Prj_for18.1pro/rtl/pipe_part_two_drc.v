module pipe_part_two_drc(
	clk,reset_n,
	
	s_in,
	
	dcode_flag_in,err_one_reg_in,err_two_reg_in,err_thr_reg_in,
	
	dcode_flag_out,err_one_reg_out,err_two_reg_out,err_thr_reg_out,
	
	s_out,
	
	part_one,part_one_out
);

input 					clk;
input 					reset_n;

input [35:0]			s_in;

input 					dcode_flag_in;

input [5:0]				err_one_reg_in;
input [5:0]				err_two_reg_in;
input [5:0]				err_thr_reg_in;

input [5:0]				part_one;

output 					dcode_flag_out;
output [5:0]			err_one_reg_out;
output [5:0]			err_two_reg_out;
output [5:0]			err_thr_reg_out;

output [35:0]			s_out;
output [5:0]			part_one_out;

wire 						dcode_flag_inside[1:0];
wire [5:0]				err_one_inside[1:0];
wire [5:0]				err_two_inside[1:0];
wire [5:0]				err_thr_inside[1:0];

wire [35:0]				s_inside[1:0];

wire [5:0]				part_one_inside[1:0];


two_pipe37_dcr two_pipe37_dcr_inst_0
(
	.clk						(clk) ,	// input  clk
	.reset_n					(reset_n) ,	// input  reset_n
	.s_in						(s_in) ,	// input [35:0] s_in
	.dcode_flag_in			(dcode_flag_in) ,	// input  dcode_flag_in
	.err_one_reg_in		(err_one_reg_in) ,	// input [5:0] err_one_reg_in
	.err_two_reg_in		(err_two_reg_in) ,	// input [5:0] err_two_reg_in
	.err_thr_reg_in		(err_thr_reg_in) ,	// input [5:0] err_thr_reg_in
	.part_one				(part_one) ,	// input [5:0] part_one
	
	.part_offset			(6'd1) ,	// input [5:0] part_offset
	
	.dcode_flag_out		(dcode_flag_inside[0]) ,	// output  dcode_flag_out
	.err_one_reg_out		(err_one_inside[0]) ,	// output [5:0] err_one_reg_out
	.err_two_reg_out		(err_two_inside[0]) ,	// output [5:0] err_two_reg_out
	.err_thr_reg_out		(err_thr_inside[0]) ,	// output [5:0] err_thr_reg_out
	.s_out					(s_inside[0]) ,	// output [35:0] s_out
	.part_one_out			(part_one_inside[0]) 	// output [5:0] part_one_out
);

two_pipe37_dcr two_pipe37_dcr_inst_1
(
	.clk						(clk) ,	// input  clk
	.reset_n					(reset_n) ,	// input  reset_n
	.s_in						(s_inside[0]) ,	// input [35:0] s_in
	.dcode_flag_in			(dcode_flag_inside[0]) ,	// input  dcode_flag_in
	.err_one_reg_in		(err_one_inside[0]) ,	// input [5:0] err_one_reg_in
	.err_two_reg_in		(err_two_inside[0]) ,	// input [5:0] err_two_reg_in
	.err_thr_reg_in		(err_thr_inside[0]) ,	// input [5:0] err_thr_reg_in
	.part_one				(part_one_inside[0]) ,	// input [5:0] part_one
	
	.part_offset			(6'd2) ,	// input [5:0] part_offset
	
	.dcode_flag_out		(dcode_flag_inside[1]) ,	// output  dcode_flag_out
	.err_one_reg_out		(err_one_inside[1]) ,	// output [5:0] err_one_reg_out
	.err_two_reg_out		(err_two_inside[1]) ,	// output [5:0] err_two_reg_out
	.err_thr_reg_out		(err_thr_inside[1]) ,	// output [5:0] err_thr_reg_out
	.s_out					(s_inside[1]) ,	// output [35:0] s_out
	.part_one_out			(part_one_inside[1]) 	// output [5:0] part_one_out
	
);

two_pipe37_dcr two_pipe37_dcr_inst_2
(
	.clk						(clk) ,	// input  clk
	.reset_n					(reset_n) ,	// input  reset_n
	.s_in						(s_inside[1]) ,	// input [35:0] s_in
	.dcode_flag_in			(dcode_flag_inside[1]) ,	// input  dcode_flag_in
	.err_one_reg_in		(err_one_inside[1]) ,	// input [5:0] err_one_reg_in
	.err_two_reg_in		(err_two_inside[1]) ,	// input [5:0] err_two_reg_in
	.err_thr_reg_in		(err_thr_inside[1]) ,	// input [5:0] err_thr_reg_in
	.part_one				(part_one_inside[1]) ,	// input [5:0] part_one
	
	.part_offset			(6'd3) ,	// input [5:0] part_offset
	
	.dcode_flag_out		(dcode_flag_out) ,	// output  dcode_flag_out
	.err_one_reg_out		(err_one_reg_out) ,	// output [5:0] err_one_reg_out
	.err_two_reg_out		(err_two_reg_out) ,	// output [5:0] err_two_reg_out
	.err_thr_reg_out		(err_thr_reg_out) ,	// output [5:0] err_thr_reg_out
	.s_out					(s_out) ,	// output [35:0] s_out
	.part_one_out			(part_one_out) 	// output [5:0] part_one_out
);




endmodule
