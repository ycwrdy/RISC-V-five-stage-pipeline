`timescale 1ns / 1ps
module shift_n #(parameter M = 3, N = 32)(
	input clk,
	input [N-1:0]data,
	output [N-1:0]data_s_n
);

	reg [M*N-1:0]shift;
	
	always@(negedge clk) shift <= {shift[(M-1)*N-1:0],data};
	
	assign data_s_n = shift[M*N-1:(M-1)*N];

endmodule 