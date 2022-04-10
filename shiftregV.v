//---------------------------------------------------------------------------------------------------//
// MIT License
//
// Copyright (c) 2022 José Luis Jiménez Arévalo
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//---------------------------------------------------------------------------------------------------//


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
