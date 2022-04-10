module shiftregV( input 		clk,
						input  [7:0] data,
						input 		 shren,
						input			rst,
						output  [7:0]v0,
						output  [7:0]v1,
						output  [7:0]v2,
						output  [7:0]v3,
						output  [7:0]v4,
						output  [7:0]v5,
						output  [7:0]v6,
						output  [7:0]v7);
	
reg [7:0] sreg [7:0];

always @ (posedge shren or posedge rst)
		if (rst)
		begin
			sreg[7]<= 8'd0;
			sreg[6]<= 8'd0;
			sreg[5]<= 8'd0;
			sreg[4]<= 8'd0;
			sreg[3]<= 8'd0;
			sreg[2]<= 8'd0;
			sreg[1]<= 8'd0;
			sreg[0]<= 8'd0;
		end
		else if (shren)
		 begin
			sreg[7]<= sreg[6];
			sreg[6]<= sreg[5];
			sreg[5]<= sreg[4];
			sreg[4]<= sreg[3];
			sreg[3]<= sreg[2];
			sreg[2]<= sreg[1];
			sreg[1]<= sreg[0];
			sreg[0]<= data;
		end
 	
 assign v0 = sreg[7];
 assign v1 = sreg[6];
 assign v2 = sreg[5];
 assign v3 = sreg[4];
 assign v4 = sreg[3];
 assign v5 = sreg[2];
 assign v6 = sreg[1];	
 assign v7 = sreg[0];
endmodule