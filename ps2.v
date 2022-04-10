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


module ps2(
	input PS2Clk,
	input FPGAClk,
	input rst,
	input datain,
	output [7:0] scanCode,
	output [6:0] SEG1,
	output [6:0] SEG2,
	output [6:0] SEG3,
	output [6:0] SEG4,
	output [6:0] SEG5,
	output [6:0] SEG6,
	output [7:0] key,
	output shift
	);
	
	reg Qreg; //enable register before f0
	reg Qreg2; //
	reg [10:0] Q; //output register of the 1st shift
	reg [7:0] Qseg; //output of register after f0 comp
	reg clrCounter; // clear of counter module
	reg [5:0] QSynch; //output synchronizer module
	
	wire comp0a; //output of comparator 0a(10)
	wire compf0; //output of comparator f0(240)
	wire [5:0] count; //output of counter module
	wire [10:0] D; //input register of the 1st shift
	wire [7:0] D1;
	wire [5:0] DSynch; //input synchronizer module
	wire [5:0] seg7;
	wire comp21;
	wire midout; //
	wire [5:0] countSynch;
	
	wire [7:0]segments0;
	wire [7:0]segments1;
	wire [7:0]segments2;
	wire [7:0]segments3;
	wire [7:0]segments4;
	wire [7:0]segments5;
	
	assign key = Qseg;
	assign clk2 = FPGAClk;
	assign shift = midout;
	
	shiftreg sr1(.clk(~PS2Clk),.rst(~rst),.shren(1),.din(datain),.dout(D));
	assign D1 =  Q[8:1];
	counter c(.clk(PS2Clk),.clr(clrCounter),.rst(~rst),.count(count));
	assign comp0a = (count == 10) ? 1 : 0;
	
	//2 registers (for synchronize)
	always @(posedge FPGAClk) begin
		if(FPGAClk)
			Qreg <= comp0a;
		else 
			Qreg <= Qreg;
	end
	
	
	always @(posedge FPGAClk) begin
		if(FPGAClk)
			clrCounter <= Qreg;
		else
			clrCounter <= clrCounter;
	end
	
	//synch module 
	synch s(.PS2Clk(PS2Clk),.FPGAClk(FPGAClk),.rst(~rst),.midout(midout),.count(countSynch));
	
	
	//Register before f0 comparator
	assign comp21 = (countSynch == 33) ? 1 : 0;
	
	always @ (negedge Qreg) begin
		
		if(comp21)
			Q <= 0;
		else
			Q <= D;
	end
	
	assign compf0 = (D1 != 240) ? 1 : 0;
	
	reg [8:0] keycount;
	
	//register after f0
	always @(posedge FPGAClk) begin
		if(compf0) begin
			Qseg <= D1;
			keycount <= keycount + 1;
			end
		else begin
			Qseg <= Qseg;
	end
	end
	//Register of Synch
	
	shiftreg2 s2(.clk(FPGAClk),.data(Qseg),.rst(~rst),.shren(midout),.dout0(segments0),.dout1(segments1),.dout2(segments2),.dout3(segments3),.dout4(segments4),.dout5(segments5));
	decoder d1(.in(segments0),.outSeg(SEG1));
	decoder d2(.in(segments1),.outSeg(SEG2));
	decoder d3(.in(segments2),.outSeg(SEG3));
	decoder d4(.in(segments3),.outSeg(SEG4));
	decoder d5(.in(segments4),.outSeg(SEG5));
	decoder d6(.in(segments5),.outSeg(SEG6));
	
	
	assign scanCode = Q[8:1];
	
	
endmodule
