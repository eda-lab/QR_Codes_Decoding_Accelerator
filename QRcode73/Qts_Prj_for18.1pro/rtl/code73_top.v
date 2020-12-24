module code73_top(
	clk,reset_n,
	
	m_in,p_in,
	
	//m_out,p_out,dcode_flag_out,
	
	s_out_thr,dcode_flag_thr,err_one_reg_thr,err_two_reg_thr,err_thr_reg_thr,part_one_out_thr,part_two_out_thr,
	
	s_out_two,dcode_flag_two,err_one_reg_two,err_two_reg_two,err_thr_reg_two,part_one_out_two,
	
	dcode_flag_out,err_one_reg_out,err_two_reg_out,err_thr_reg_out,s_out,
	
	inv_ctrl_delay,m_delay,p_delay,rd_en,rd_data,usedw_fifo
);

input 					clk;
input 					reset_n;

input [36:0]			m_in;
input [35:0]			p_in;


/***********************input_inv**********************/

reg 					cnt_inv;
reg [36:0]			m_modify;
reg [35:0]			p_modify;

always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		cnt_inv <= 1'b0;
		m_modify <= 37'd0;
		p_modify <= 36'd0;
	end
	else
	begin
		cnt_inv <= cnt_inv + 1'b1;
		if(!cnt_inv)
		begin
			m_modify <= m_in;
			p_modify <= p_in;
		end
		else
		begin
			m_modify <= {m_in[0],p_in};
			p_modify <= {m_in[36:1]};
		end
	end
end

/******************输入变化检测************************/

reg [36:0]				m_in_temp;
reg [35:0]				p_in_temp;
reg 						change_flag;

always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		m_in_temp <= 37'd0;
		p_in_temp <= 36'd0;
	end
	else
	begin
		m_in_temp <= m_in;
		p_in_temp <= p_in;
		if((m_in_temp ^ m_in) && (p_in_temp ^ p_in))
			change_flag <= 1'b1;
		else
			change_flag <= 1'b0;
	end
end



/*********************part_para_gen********************/

reg [3:0]						cnt;
reg [5:0]						part_one;
reg [5:0]						part_two;

always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		cnt <= 4'd1;
	end
	else
	begin
		if(change_flag)
		begin
			cnt <= 4'd1;
		end
		else
		begin
			if(cnt <= 4'd5)
				cnt <= cnt + 1'b1;
			else
				cnt <= 4'd1;
		end
	end
end

always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		part_one <= 6'd1;
		part_two <= 6'd12;
	end
	else
	begin
		part_one <= cnt;
		part_two <= 6'd13 - cnt;
	end
end

/****************************s_gen**********************/

wire [35:0]				s_out_pre;
wire						dcode_flag_pre;
wire [5:0]				err_one_reg_pre;
wire [5:0]				err_two_reg_pre;
wire [5:0]				err_thr_reg_pre;

s_gen s_gen_inst
(
	.clk						(clk) ,	// input  clk
	.reset_n					(reset_n) ,	// input  reset_n
	.m_in						(m_modify) ,	// input [36:0] m_in
	.p_in						(p_modify) ,	// input [35:0] p_in
	.s_out					(s_out_pre) ,	// output [35:0] s_out
	.dcode_flag_out		(dcode_flag_pre) ,	// output  dcode_flag_out
	.err_one_reg_out		(err_one_reg_pre) ,	// output [5:0] err_one_reg_out
	.err_two_reg_out		(err_two_reg_pre) ,	// output [5:0] err_two_reg_out
	.err_thr_reg_out		(err_thr_reg_pre) 	// output [5:0] err_thr_reg_out
);

/**************************fifo**************************/

output reg 				inv_ctrl_delay;
output reg [36:0]		m_delay;
output reg [35:0]		p_delay;
output reg 				rd_en;
output wire [73:0]	rd_data;
output wire [6:0]		usedw_fifo;

always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		rd_en <= 1'd0;
		m_delay <= 37'd0;
		p_delay <= 36'd0;
		inv_ctrl_delay <= 1'b0;		
	end
	else
	begin
		if(usedw_fifo > 7'd80)
		begin
			rd_en <= 1'b1;
			m_delay <= rd_data[73:37];
			p_delay <= rd_data[36:1];
			inv_ctrl_delay <= rd_data[0];
		end
		else
		begin
			m_delay <= 37'd0;
			p_delay <= 36'd0;
			inv_ctrl_delay <= 1'b0;			
		end
	end
end


fifo1	fifo1_inst (
	.clock 		( clk ),
	.data 		( {m_modify,p_modify,cnt_inv} ),
	.rdreq 		( rd_en ),
	.wrreq 		( 1'b1 ),
	.q 			( rd_data ),
	.usedw 		( usedw_fifo )
);


/************************pipe_part_thr**********************/

output wire [35:0]					s_out_thr;

output wire 							dcode_flag_thr;
output wire [5:0]					err_one_reg_thr;
output wire [5:0]					err_two_reg_thr;
output wire [5:0]					err_thr_reg_thr;

output wire [5:0]					part_one_out_thr;
output wire [5:0]					part_two_out_thr;

pipe_part_thr pipe_part_thr_inst
(
	.clk					(clk) ,	// input  clk
	.reset_n				(reset_n) ,	// input  reset_n
	
	.s_in					(s_out_pre) ,	// input [35:0] s_in
	.dcode_flag_in		(dcode_flag_pre) ,	// input  dcode_flag_in
	.err_one_reg_in	(err_one_reg_pre) ,	// input [5:0] err_one_reg_in
	.err_two_reg_in	(err_two_reg_pre) ,	// input [5:0] err_two_reg_in
	.err_thr_reg_in	(err_thr_reg_pre) ,	// input [5:0] err_thr_reg_in
	
	.dcode_flag_out	(dcode_flag_thr) ,	// output  dcode_flag_out
	.err_one_out		(err_one_reg_thr) ,	// output [5:0] err_one_out
	.err_two_out		(err_two_reg_thr) ,	// output [5:0] err_two_out
	.err_thr_out		(err_thr_reg_thr) ,	// output [5:0] err_thr_out
	
	.s_out				(s_out_thr) ,	// output [35:0] s_out
	
	.part_one_in		(part_one) ,	// input [5:0] part_one_in
	.part_two_in		(part_two) ,	// input [5:0] part_two_in
	.part_one_out		(part_one_out_thr) ,	// output [5:0] part_one_out
	.part_two_out		(part_two_out_thr) 	// output [5:0] part_two_out
);


/************************pipe_part_two**********************/

output wire [35:0]					s_out_two;

output wire 							dcode_flag_two;
output wire [5:0]					err_one_reg_two;
output wire [5:0]					err_two_reg_two;
output wire [5:0]					err_thr_reg_two;

output wire [5:0]					part_one_out_two;


pipe_part_two_drc pipe_part_two_drc_inst
(
	.clk						(clk) ,	// input  clk
	.reset_n					(reset_n) ,	// input  reset_n
	.s_in						(s_out_thr) ,	// input [35:0] s_in
	.dcode_flag_in			(dcode_flag_thr) ,	// input  dcode_flag_in
	.err_one_reg_in		(err_one_reg_thr) ,	// input [5:0] err_one_reg_in
	.err_two_reg_in		(err_two_reg_thr) ,	// input [5:0] err_two_reg_in
	.err_thr_reg_in		(err_thr_reg_thr) ,	// input [5:0] err_thr_reg_in
	.dcode_flag_out		(dcode_flag_two) ,	// output  dcode_flag_out
	.err_one_reg_out		(err_one_reg_two) ,	// output [5:0] err_one_reg_out
	.err_two_reg_out		(err_two_reg_two) ,	// output [5:0] err_two_reg_out
	.err_thr_reg_out		(err_thr_reg_two) ,	// output [5:0] err_thr_reg_out
	.s_out					(s_out_two) ,	// output [35:0] s_out
	.part_one				(part_one_out_thr) ,	// input [5:0] part_one
	.part_one_out			(part_one_out_two) 	// output [5:0] part_one_out
);

/************************pipe_part_two**********************/

output 					dcode_flag_out;
output [5:0]			err_one_reg_out;
output [5:0]			err_two_reg_out;
output [5:0]			err_thr_reg_out;
output [35:0]			s_out;


one_pipe37_dcr2 one_pipe37_dcr2_inst
(
	.clk						(clk) ,	// input  clk
	.reset_n					(reset_n) ,	// input  reset_n
	.s_in						(s_out_two) ,	// input [35:0] s_in
	.dcode_flag_in			(dcode_flag_two) ,	// input  dcode_flag_in
	.err_one_reg_in		(err_one_reg_two) ,	// input [5:0] err_one_reg_in
	.err_two_reg_in		(err_two_reg_two) ,	// input [5:0] err_two_reg_in
	.err_thr_reg_in		(err_thr_reg_two) ,	// input [5:0] err_thr_reg_in
	.part_one				(part_one_out_two) ,	// input [5:0] part_one
	.dcode_flag_out		(dcode_flag_out) ,	// output  dcode_flag_out
	.err_one_reg_out		(err_one_reg_out) ,	// output [5:0] err_one_reg_out
	.err_two_reg_out		(err_two_reg_out) ,	// output [5:0] err_two_reg_out
	.err_thr_reg_out		(err_thr_reg_out) ,	// output [5:0] err_thr_reg_out
	.s_out					(s_out) 	// output [35:0] s_out
);



/********************decode*******************************/




/*
wire [35:0]		S[36:0];					//校验子
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



wire [36:0]			m_pro_final;
wire [35:0]			p_pro_final;

assign 	m_pro_final = (err_one_reg_one == 6'd40) ? m_delay : 
	m_delay ^ (1'b1 << err_one_reg_one) ^ (1'b1 << err_two_reg_one) ^ (1'b1 << err_thr_reg_one);
assign	p_pro_final = (err_one_reg_pipe == 6'd40) ? p_delay ^ s_delay : 
	p_delay ^ S[err_one_reg_pipe] ^ S[err_two_reg_pipe] ^ S[err_thr_reg_pipe] ^ s_delay;


always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		m_out <= 37'd0;
		p_out <= 36'd0;
		dcode_flag_out <= 1'b0;
	end
	else
	begin
		if(dcode_flag_pipe)
		begin
			dcode_flag_out <= 1'b1;
			if(inv_ctrl_delay)
			begin
				m_out <= m_pro_final;
				p_out <= p_pro_final;
			end
			else
			begin
				m_out <= {p_pro_final,m_pro_final[36]};
				p_out <= m_pro_final[35:0];
			end
		end
		else
		begin
			dcode_flag_out <= 1'b0;
			m_out <= m_delay;
			p_out <= p_delay;
		end
	end
end*/







endmodule

