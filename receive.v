`timescale 1ns / 1ps
module receive #(parameter N = 32)(
	input clk,
	input [N-1:0]data,
	output reg [N-1:0]data_r
);

	always@(posedge clk) data_r <= data;

endmodule

