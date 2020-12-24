module fifo1 (
		input  wire [73:0] data,  //  fifo_input.datain
		input  wire        wrreq, //            .wrreq
		input  wire        rdreq, //            .rdreq
		input  wire        clock, //            .clk
		output wire [73:0] q,     // fifo_output.dataout
		output wire [6:0]  usedw  //            .usedw
	);
endmodule

