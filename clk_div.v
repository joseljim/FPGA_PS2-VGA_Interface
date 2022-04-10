module clk_div(
	input clk,
	input rst,
	output reg clk25
	);
	
	always @(posedge clk) begin
		if(rst)
			clk25 <= 0;
		else
			clk25 <= ~clk25;
	end
	
endmodule