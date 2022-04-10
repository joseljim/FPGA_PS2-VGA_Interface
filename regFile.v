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
