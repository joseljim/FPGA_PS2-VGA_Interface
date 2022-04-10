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


module decoder(
					input [7:0]in,
					output reg [6:0]outSeg);

always @ (*)
	begin 
		case (in)
		8'h16: outSeg = 7'b1111001;//1
		8'h1E: outSeg = 7'b0100100;//2
		8'h26: outSeg = 7'b0110000;//3
		8'h25: outSeg = 7'b0011001;//4
		8'h2E: outSeg = 7'b0010010;//5
		8'h36: outSeg = 7'b0000010;//6
		8'h3D: outSeg = 7'b1111000;//7
		8'h3E: outSeg = 7'b0000000;//8
		8'h46: outSeg = 7'b0010000;//9
		8'h45: outSeg = 7'b1000000;//0
		
		8'h15: outSeg = 7'b0011000;//Q
		8'h1D: outSeg = 7'b0111111;//W
		8'h24: outSeg = 7'b0000110;//E
		8'h2D: outSeg = 7'b0101111;//R
		8'h2C: outSeg = 7'b0000111;//T
		8'h35: outSeg = 7'b0010001;//Y
		8'h3C: outSeg = 7'b1000001;//U
		8'h43: outSeg = 7'b1111001;//I
		8'h44: outSeg = 7'b0100011;//O
		8'h4D: outSeg = 7'b0001100;//P
		8'h1C: outSeg = 7'b0001000;//A
		8'h1B: outSeg = 7'b0010010;//S
		8'h23: outSeg = 7'b0100001;//D
		8'h2B: outSeg = 7'b0001110;//F
		8'h34: outSeg = 7'b0010000;//G
		8'h33: outSeg = 7'b0001001;//H
		8'h3B: outSeg = 7'b1100001;//J
		8'h42: outSeg = 7'b0111111;//K
		8'h4B: outSeg = 7'b1000111;//L
		8'h1A: outSeg = 7'b0111111;//Z
		8'h22: outSeg = 7'b0111111;//X
		8'h21: outSeg = 7'b1000110;//C
		8'h2A: outSeg = 7'b1100011;//V
		8'h32: outSeg = 7'b0000011;//B
		8'h31: outSeg = 7'b0101011;//N
		8'h3A: outSeg = 7'b0111111;//M
		
		default: outSeg=7'b1111111;
		endcase
	end
endmodule
