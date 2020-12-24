module one_pipe37_dcr2(
	clk,reset_n,
	
	s_in,
	
	dcode_flag_in,err_one_reg_in,err_two_reg_in,err_thr_reg_in,
	
//	err_one_initial,err_two_initial,
	part_one,
	
	dcode_flag_out,err_one_reg_out,err_two_reg_out,err_thr_reg_out,
	
	s_out
);

input 					clk;
input 					reset_n;


input [35:0]			s_in;

input 					dcode_flag_in;
input [5:0]				err_one_reg_in;
input [5:0]				err_two_reg_in;
input [5:0]				err_thr_reg_in;

input [5:0]				part_one;

output reg 				dcode_flag_out;
output reg [5:0]		err_one_reg_out;
output reg [5:0]		err_two_reg_out;
output reg [5:0]		err_thr_reg_out;

output reg [35:0]		s_out;




wire 						dcode_flag_inside[6:0];
wire [5:0]				err_one_inside[6:0];

reg [35:0]				s_temp;

wire [5:0]				pos_initial;

assign pos_initial = (part_one - 1'b1) << 2'd2 + (part_one - 1'b1) << 1'b1 + (part_one - 1'b1);


always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		s_temp <= 36'd0;
		s_out <= 36'd0;
	end
	else
	begin
		s_temp <= s_in;
		s_out <= s_temp;
	end
end


single_one_dcrreg single_one_dcrreg_inst_0(
	.s_in						(s_in) ,
	.err_one_pos			(pos_initial + 6'd0) ,
	.dcode_flag_out		(dcode_flag_inside[0]) ,
	.err_one_out_reg		(err_one_inside[0])
);

single_one_dcrreg single_one_dcrreg_inst_1(
	.s_in						(s_in) ,
	.err_one_pos			(pos_initial + 6'd1) ,
	.dcode_flag_out		(dcode_flag_inside[1]) ,
	.err_one_out_reg		(err_one_inside[1])
);

single_one_dcrreg single_one_dcrreg_inst_2(
	.s_in						(s_in) ,
	.err_one_pos			(pos_initial + 6'd2) ,
	.dcode_flag_out		(dcode_flag_inside[2]) ,
	.err_one_out_reg		(err_one_inside[2])
);

single_one_dcrreg single_one_dcrreg_inst_3(
	.s_in						(s_in) ,
	.err_one_pos			(pos_initial + 6'd3) ,
	.dcode_flag_out		(dcode_flag_inside[3]) ,
	.err_one_out_reg		(err_one_inside[3])
);

single_one_dcrreg single_one_dcrreg_inst_4(
	.s_in						(s_in) ,
	.err_one_pos			(pos_initial + 6'd4) ,
	.dcode_flag_out		(dcode_flag_inside[4]) ,
	.err_one_out_reg		(err_one_inside[4])
);

single_one_dcrreg single_one_dcrreg_inst_5(
	.s_in						(s_in) ,
	.err_one_pos			(pos_initial + 6'd5) ,
	.dcode_flag_out		(dcode_flag_inside[5]) ,
	.err_one_out_reg		(err_one_inside[5])
);

single_one_dcrreg single_one_dcrreg_inst_6(
	.s_in						(s_in) ,
	.err_one_pos			(pos_initial + 6'd6) ,
	.dcode_flag_out		(dcode_flag_inside[6]) ,
	.err_one_out_reg		(err_one_inside[6])
);


always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		dcode_flag_out <= 1'b0;
		err_one_reg_out <= 6'd0;
		err_two_reg_out <= 6'd0;
		err_thr_reg_out <= 6'd0;
	end
	else
	begin
		if(dcode_flag_inside[0])
		begin
			dcode_flag_out <= 1'b1;
			err_one_reg_out <= err_one_inside[0];
			err_two_reg_out <= 6'd0;
			err_thr_reg_out <= 6'd41;
		end
		else if(dcode_flag_inside[1])
		begin
			dcode_flag_out <= 1'b1;
			err_one_reg_out <= err_one_inside[1];
			err_two_reg_out <= 6'd0;
			err_thr_reg_out <= 6'd41;
		end
		else if(dcode_flag_inside[2])
		begin
			dcode_flag_out <= 1'b1;
			err_one_reg_out <= err_one_inside[2];
			err_two_reg_out <= 6'd0;
			err_thr_reg_out <= 6'd41;
		end
		else if(dcode_flag_inside[3])
		begin
			dcode_flag_out <= 1'b1;
			err_one_reg_out <= err_one_inside[3];
			err_two_reg_out <= 6'd0;
			err_thr_reg_out <= 6'd41;
		end
		else if(dcode_flag_inside[4])
		begin
			dcode_flag_out <= 1'b1;
			err_one_reg_out <= err_one_inside[4];
			err_two_reg_out <= 6'd0;
			err_thr_reg_out <= 6'd41;
		end
		else if(dcode_flag_inside[5])
		begin
			dcode_flag_out <= 1'b1;
			err_one_reg_out <= err_one_inside[5];
			err_two_reg_out <= 6'd0;
			err_thr_reg_out <= 6'd41;
		end
		else if(dcode_flag_inside[6])
		begin
			dcode_flag_out <= 1'b1;
			err_one_reg_out <= err_one_inside[6];
			err_two_reg_out <= 6'd0;
			err_thr_reg_out <= 6'd41;
		end
		else
		begin
			if(dcode_flag_in)
			begin
				dcode_flag_out <= 1'b1;
				err_one_reg_out <= err_one_reg_in;
				err_two_reg_out <= err_two_reg_in;
				err_thr_reg_out <= err_thr_reg_in;
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
end




endmodule
