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


module vgadecoder(
	input [7:0] code,
	output reg [24:0] vgaout);
	
	always @ (*)
	begin 
		case (code)
		8'h1C: vgaout = 25'b0101001010011100101001110;
		8'h32: vgaout = 25'b0111001010011100001000010;
		8'h21: vgaout = 25'b0111000010000100001001110;
		8'h15: vgaout = 25'b0100001000011100101001110;//Q

		8'h1D: vgaout = 25'b1111110101101011010110101;//W
				
		8'h24: vgaout = 25'b0111000010001100001001110;//E
				
		8'h2D: vgaout = 25'b0101000110011100101001110;//R
				
		8'h2C: vgaout = 25'b0010000100001000010001110;//T
				
		8'h35: vgaout = 25'b0111001000011100101001010;//Y
				
		8'h3C: vgaout = 25'b0111001010010100101001010;//U
				
		8'h43: vgaout = 25'b0111000100001000010001110;//I
				
		8'h44: vgaout = 25'b0111001010010100101001110;//O
				
		8'h4D: vgaout = 25'b0001000010011100101001110;//P
				
		8'h1C: vgaout = 25'b0101001010011100101001110;//A
				
		8'h1B: vgaout = 25'b0111001000011100001001110;//S
				
		8'h23: vgaout = 25'b0111001010011100100001000;//D
				
		8'h2B: vgaout = 25'b0001000010001100001001110;//F
				
		8'h34: vgaout = 25'b0111001010011100001001110;//G
				
		8'h33: vgaout = 25'b0101001010011100101001010;//H
				
		8'h3B: vgaout = 25'b0011000100001000010001110;//J
				
		8'h42: vgaout = 25'b0101001010001100011001010;//K
				
		8'h4B: vgaout = 25'b0111000010000100001000010;//L
				
		8'h1A: vgaout = 25'b1111100010001000100011111;//Z
				
		8'h22: vgaout = 25'b1000101010001000101010001;//X
				
		8'h21: vgaout = 25'b0111000010000100001001110;//C
				
		8'h2A: vgaout = 25'b0010001010100010000000000;//V
				
		8'h32: vgaout = 25'b0111001010011100001000010;//B
				
		8'h31: vgaout = 25'b1000111001101011001110001;//N
				
		8'h3A: vgaout = 25'b1000110001101011010111111;//M
		
		8'h16: vgaout = 25'b0111000100001000011000100;//1
		
		8'h1E: vgaout = 25'b0111000010011100100001110;//2
				
		8'h26: vgaout = 25'b0111001000011100100001110;//3
				
		8'h25: vgaout = 25'b0100001000011100101001010;//4
				
		8'h2E: vgaout = 25'b0111001000011100001001110;//5
				
		8'h36: vgaout = 25'b0111001010011100001001110;//6
				
		8'h3D: vgaout = 25'b0000100010001000100011111;//7
				
		8'h3E: vgaout = 25'b0111001010011100101001110;//8
				
		8'h46: vgaout = 25'b0111001000011100101001110;//9
				
		8'h45: vgaout = 25'b0111001010010100101001110;//0
		
		default: vgaout =25'b0000000000000000000000000;
		endcase
	end
endmodule

