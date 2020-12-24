module weight5(
	input[35:0] 	si,
	output 			weight_flag
);

//wire 	[3:0] w1,w0;

wire [5:0]	w;
	
wire 	[1:0] x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12;
wire 	[3:0] y1,y2,y3,y4;

assign x1 = si[0]  + si[1]  + si[2];
assign x2 = si[3]  + si[4]  + si[5];
assign x3 = si[6]  + si[7]  + si[8];
assign x4 = si[9]  + si[10] + si[11];
assign x5 = si[12] + si[13] + si[14];
assign x6 = si[15] + si[16] + si[17];
assign x7 = si[18] + si[19] + si[20];
assign x8 = si[21] + si[22] + si[23];
assign x9 = si[24] + si[25] + si[26];
assign x10= si[27] + si[28] + si[29];
assign x11= si[30] + si[31] + si[32];
assign x12= si[33] + si[34] + si[35];

assign y1=x1+x2+x3;
assign y2=x4+x5+x6;
assign y3=x7+x8+x9;
assign y4=x10+x11+x12;

//assign w0=y1[1:0]+y2[1:0]+y3[1:0]+y4[1:0];
//assign w1=y1[3:2]+y2[3:2]+y3[3:2]+y4[3:2];

assign w = y1 + y2 + y3 + y4;

//assign weight_flag = (w0[3:1]<=1&&w1==0);

assign weight_flag = (w <= 5) ;

endmodule 