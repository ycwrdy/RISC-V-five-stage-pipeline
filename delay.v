`timescale 1ns / 1ps
module delay #(parameter N = 32)(
	input clk,
	input [N-1:0]data,
	output reg [N-1:0]data_d
);

	always@(negedge clk) data_d <= data;

endmodule 
