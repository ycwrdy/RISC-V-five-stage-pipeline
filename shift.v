`timescale 1ns / 1ps
module shift #(parameter M = 3, N = 32)(
	input clk,
	input [N-1:0]data,
	output [N-1:0]data_s
);

	reg [M*N-1:0]shift;
	
	always@(posedge clk) shift <= {shift[(M-1)*N-1:0],data};
	
	assign data_s = shift[M*N-1:(M-1)*N];

endmodule 

