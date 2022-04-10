module keysq(
	input clk25,
	input rst,
	input [7:0] kcount,
	output reg [9:0] xi,
	output reg [9:0] xf,
	output reg [9:0] yi, 
	output reg [9:0] yf);
	
	always @(posedge clk25)
    begin
			if (kcount == 1)begin
				xi[1] <= 0;
				xf[1] <= 0;
				yi[1] <= 0;
				yf[1] <= 0;
				
				
			end
    end
	
endmodule
	