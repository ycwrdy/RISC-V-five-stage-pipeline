`timescale 1ns / 1ps
module control(
	input clk,
	input [6:0]op,
	input func,
	input pass,
	input cancel,
	output reg sub_en,
	output reg wr_en,
	output reg jmp_en,
	output reg lw_en,
	output reg sw_en
);

	always@(negedge clk)begin
		if(cancel)begin
			sw_en <= 1'b0; lw_en <= 1'b0; jmp_en <= 1'b0; sub_en <= 1'b0; wr_en <= 1'b0;
		end else begin
			case(op)
				7'b0_110_011: begin sw_en <= 1'b0; lw_en <= 1'b0; jmp_en <= 1'b0; sub_en <= func ? 1'b1 : 1'b0; wr_en <= 1'b1; end
				7'b0_010_011: begin sw_en <= 1'b0; lw_en <= 1'b0; jmp_en <= 1'b0; sub_en <= 1'b0; wr_en <= 1'b1; end
				7'b1_101_111: begin sw_en <= 1'b0; lw_en <= 1'b0; jmp_en <= 1'b1; sub_en <= 1'b0; wr_en <= 1'b1; end
				7'b1_100_111: begin sw_en <= 1'b0; lw_en <= 1'b0; jmp_en <= 1'b1; sub_en <= 1'b0; wr_en <= 1'b1; end
				7'b1_100_011: begin sw_en <= 1'b0; lw_en <= 1'b0; jmp_en <= pass; sub_en <= 1'b0; wr_en <= 1'b0; end
				7'b0_000_011: begin sw_en <= 1'b0; lw_en <= 1'b1; jmp_en <= 1'b0; sub_en <= 1'b0; wr_en <= 1'b1; end
				7'b0_100_011: begin sw_en <= 1'b1; lw_en <= 1'b0; jmp_en <= 1'b0; sub_en <= 1'b0; wr_en <= 1'b0; end
				default: begin sw_en <= 1'b0; lw_en <= 1'b0; jmp_en <= 1'b0; sub_en <= 1'b0; wr_en <= 1'b0; end
			endcase
		end
	end

endmodule 

