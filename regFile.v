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


module regFile(
   input rst,
	input [7:0] writeData,
	input writeEnable,
	input [3:0] readAddress1,
	input [3:0] writeAddress,
	input clk,
   output [7:0] readData1
 	);
 	
  reg[5:0] register[7:0];
 
  always @ (posedge clk)
   begin
		if(writeEnable)
			begin
				register[writeAddress] = writeData;
			end
		else if (rst)
			begin
				register[0] = 0;
				register[1] = 0;
				register[2] = 0;
				register[3] = 0;
				register[4] = 0;
				register[5] = 0;
				
			end
   end
  
  assign readData1 = register[readAddress1];
 
	
endmodule
