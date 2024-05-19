module mac #(
	parameter N = 16, // length of bits
	parameter Q = 12 // number of fraction in case of fixed point representation
	)(
	input logic clk, sclr, ce,
	input logic [N-1:0] a_i, b_i, 
	input logic [N*2-1:0] c_i,
	output logic [N*2-1:0] r_o
	);
	
	logic [31:0] temp; // this file only apply for N = 16
	Vedic_mul_16x16 U0(a_i, b_i, temp);
	
	always_ff @(posedge clk or posedge sclr) begin
		if (sclr) r_o <= 'd0;
		else if (ce) begin
			r_o <= temp + c_i;
		end
	end
	
endmodule