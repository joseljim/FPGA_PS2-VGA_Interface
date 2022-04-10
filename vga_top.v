module vga_top(
    input clk,
	 input PS2Clk,
	 input datai,
    output reg [7:0] r,
	 output reg [7:0] g,
	 output reg [7:0] b,
    output HS,
    output VS,
	 output blank,
	 output synk,
	 output vgaclk,
	 input rst,
	 output [6:0] SEG1,
	 output [6:0] SEG2,
	 output [6:0] SEG3,
	 output [6:0] SEG4,
	 output [6:0] SEG5,
	 output [6:0] SEG6
);
    wire inDisplayArea;
    wire [9:0] CounterX;
	 wire [9:0] CounterY;
	 wire keydetect;
	 reg keycount;
	 
	 reg [9:0] xi;
	 reg [9:0] yi;
	 reg [9:0] xf;
	 reg [9:0] yf;
	 
	 
	 assign blank = (CounterX>48|CounterX<687|CounterY>33|CounterY<512);
	 assign synk = 1'b0;
	 
	 clk_div div25(.clk(clk),.clk25(clk25));
	 assign vgaclk = clk25;

    hvsync_generator hvsync(
      .clk(clk25),
      .vga_h_sync(HS),
      .vga_v_sync(VS),
      .CounterX(CounterX),
      .CounterY(CounterY),
      .inDisplayArea(inDisplayArea)
    );
	 
	 
	 
	 
	 wire [7:0] sq0,sq1,sq2,sq3,sq4,sq5,sq6,sq7,sq8,sq9,sq10,sq11,sq12,sq13,sq14,sq15,sq16,sq17,sq18,sq19,sq20,sq21,sq22,sq23,sq24;
	 wire [7:0] sq25,sq26,sq27,sq28,sq29,sq30,sq31,sq32,sq33,sq34,sq35,sq36,sq37,sq38,sq39,sq40,sq41,sq42,sq43,sq44,sq45,sq46,sq47,sq48,sq49;
	 wire [7:0] sq50,sq51,sq52,sq53,sq54,sq55,sq56,sq57,sq58,sq59,sq60,sq61,sq62,sq63,sq64,sq65,sq66,sq67,sq68,sq69,sq70,sq71,sq72,sq73,sq74;
	 wire [7:0] sq75,sq76,sq77,sq78,sq79,sq80,sq81,sq82,sq83,sq84,sq85,sq86,sq87,sq88,sq89,sq90,sq91,sq92,sq93,sq94,sq95,sq96,sq97,sq98,sq99;
	 wire [7:0] sq100,sq101,sq102,sq103,sq104,sq105,sq106,sq107,sq108,sq109,sq110,sq111,sq112,sq113,sq114,sq115,sq116,sq117,sq118,sq119,sq120,sq121,sq122,sq123,sq124;
	 wire [7:0] sq125,sq126,sq127,sq128,sq129,sq130,sq131,sq132,sq133,sq134,sq135,sq136,sq137,sq138,sq139,sq140,sq141,sq142,sq143,sq144,sq145,sq146,sq147,sq148,sq149;
	 wire [7:0] sq150,sq151,sq152,sq153,sq154,sq155,sq156,sq157,sq158,sq159,sq160,sq161,sq162,sq163,sq164,sq165,sq166,sq167,sq168,sq169,sq170,sq171,sq172,sq173,sq174;
	 wire [7:0] sq175,sq176,sq177,sq178,sq179,sq180,sq181,sq182,sq183,sq184,sq185,sq186,sq187,sq188,sq189,sq190,sq191,sq192,sq193,sq194,sq195,sq196,sq197,sq198,sq199;
		
		//  1st character 
		assign sq0 =  ((CounterX > 0)  & (CounterY > 15)  & (CounterX < 6)  & (CounterY < 21) & (pixel[0] == 1)) ? 11111111 : 0;
		assign sq1 =  ((CounterX > 5)  & (CounterY > 15)  & (CounterX < 11) & (CounterY < 21) & (pixel[1] == 1)) ? 11111111 : 0;
		assign sq2 =  ((CounterX > 10) & (CounterY > 15)  & (CounterX < 16) & (CounterY < 21) & (pixel[2] == 1)) ? 11111111 : 0;

		assign sq3 =  ((CounterX > 15) & (CounterY > 15)  & (CounterX < 21) & (CounterY < 21) & (pixel[3] == 1)) ? 11111111 : 0;
		assign sq4 =  ((CounterX > 20) & (CounterY > 15)  & (CounterX < 26) & (CounterY < 21) & (pixel[4] == 1)) ? 11111111 : 0;

		assign sq5 =  ((CounterX > 0)  & (CounterY > 20)  & (CounterX < 6)  & (CounterY < 26) & (pixel[5] == 1)) ? 11111111 : 0;
		assign sq6 =  ((CounterX > 5)  & (CounterY > 20)  & (CounterX < 11) & (CounterY < 26) & (pixel[6] == 1)) ? 11111111 : 0;
		assign sq7 =  ((CounterX > 10) & (CounterY > 20)  & (CounterX < 16) & (CounterY < 26) & (pixel[7] == 1)) ? 11111111 : 0;

		assign sq8 =  ((CounterX > 15) & (CounterY > 20)  & (CounterX < 21) & (CounterY < 26) & (pixel[8] == 1)) ? 11111111 : 0;
		assign sq9 =  ((CounterX > 20) & (CounterY > 20)  & (CounterX < 26) & (CounterY < 26) & (pixel[9] == 1)) ? 11111111 : 0;

		assign sq10 =  ((CounterX > 0)  & (CounterY > 25)  & (CounterX < 6)  & (CounterY < 31) & (pixel[10] == 1)) ? 11111111 : 0;
		assign sq11 =  ((CounterX > 5)  & (CounterY > 25)  & (CounterX < 11) & (CounterY < 31) & (pixel[11] == 1)) ? 11111111 : 0;
		assign sq12 =  ((CounterX > 10) & (CounterY > 25)  & (CounterX < 16) & (CounterY < 31) & (pixel[12] == 1)) ? 11111111 : 0;

		assign sq13 =  ((CounterX > 15) & (CounterY > 25)  & (CounterX < 21) & (CounterY < 31) & (pixel[13] == 1)) ? 11111111 : 0;
		assign sq14 =  ((CounterX > 20) & (CounterY > 25)  & (CounterX < 26) & (CounterY < 31) & (pixel[14] == 1)) ? 11111111 : 0;

		assign sq15 =  ((CounterX > 0)  & (CounterY > 30)  & (CounterX < 6)  & (CounterY < 36) & (pixel[15] == 1)) ? 11111111 : 0;
		assign sq16 =  ((CounterX > 5)  & (CounterY > 30)  & (CounterX < 11) & (CounterY < 36) & (pixel[16] == 1)) ? 11111111 : 0;
		assign sq17 =  ((CounterX > 10) & (CounterY > 30)  & (CounterX < 16) & (CounterY < 36) & (pixel[17] == 1)) ? 11111111 : 0;

		assign sq18 =  ((CounterX > 15) & (CounterY > 30)  & (CounterX < 21) & (CounterY < 36) & (pixel[18] == 1)) ? 11111111 : 0;
		assign sq19 =  ((CounterX > 20) & (CounterY > 30)  & (CounterX < 26) & (CounterY < 36) & (pixel[19] == 1)) ? 11111111 : 0;

		assign sq20 =  ((CounterX > 0)  & (CounterY > 35)  & (CounterX < 6)  & (CounterY < 41) & (pixel[20] == 1)) ? 11111111 : 0;
		assign sq21 =  ((CounterX > 5)  & (CounterY > 35)  & (CounterX < 11) & (CounterY < 41) & (pixel[21] == 1)) ? 11111111 : 0;
		assign sq22 =  ((CounterX > 10) & (CounterY > 35)  & (CounterX < 16) & (CounterY < 41) & (pixel[22] == 1)) ? 11111111 : 0;

		assign sq23 =  ((CounterX > 15) & (CounterY > 35)  & (CounterX < 21) & (CounterY < 41) & (pixel[23] == 1)) ? 11111111 : 0;
		assign sq24 =  ((CounterX > 20) & (CounterY > 35)  & (CounterX < 26) & (CounterY < 41) & (pixel[24] == 1)) ? 11111111 : 0;
		
		
		//  2nd character 
		assign sq25 =  ((CounterX > 25)  & (CounterY > 15) & (CounterX < 31)  & (CounterY < 21) & (pixel1[0] == 1)) ? 11111111 : 0;
		assign sq26 =  ((CounterX > 30)  & (CounterY > 15) & (CounterX < 36) & (CounterY < 21) & (pixel1[1] == 1)) ? 11111111 : 0;
		assign sq27 =  ((CounterX > 35)  & (CounterY > 15)  & (CounterX < 41) & (CounterY < 21) & (pixel1[2] == 1)) ? 11111111 : 0;

		assign sq28 =  ((CounterX > 40)  & (CounterY > 15)  & (CounterX < 46) & (CounterY < 21) & (pixel1[3] == 1)) ? 11111111 : 0;
		assign sq29 =  ((CounterX > 45)  & (CounterY > 15)  & (CounterX < 51) & (CounterY < 21) & (pixel1[4] == 1)) ? 11111111 : 0;

		assign sq30 =  ((CounterX > 25)  & (CounterY > 20)  & (CounterX < 31)  & (CounterY < 26) & (pixel1[5] == 1)) ? 11111111 : 0;
		assign sq31 =  ((CounterX > 30)  & (CounterY > 20)  & (CounterX < 36) & (CounterY < 26) & (pixel1[6] == 1)) ? 11111111 : 0;
		assign sq32 =  ((CounterX > 35)  & (CounterY > 20)  & (CounterX < 41) & (CounterY < 26) & (pixel1[7] == 1)) ? 11111111 : 0;

		assign sq33 =  ((CounterX > 40)  & (CounterY > 20)  & (CounterX < 46) & (CounterY < 26) & (pixel1[8] == 1)) ? 11111111 : 0;
		assign sq34 =  ((CounterX > 45)  & (CounterY > 20)  & (CounterX < 51) & (CounterY < 26) & (pixel1[9] == 1)) ? 11111111 : 0;

		assign sq35 =  ((CounterX > 25)  & (CounterY > 25)  & (CounterX < 31)  & (CounterY < 31) & (pixel1[10] == 1)) ? 11111111 : 0;
		assign sq36 =  ((CounterX > 30)  & (CounterY > 25)  & (CounterX < 36) & (CounterY < 31) & (pixel1[11] == 1)) ? 11111111 : 0;
		assign sq37 =  ((CounterX > 35)  & (CounterY > 25)  & (CounterX < 41) & (CounterY < 31) & (pixel1[12] == 1)) ? 11111111 : 0;

		assign sq38 =  ((CounterX > 40)  & (CounterY > 25)  & (CounterX < 46) & (CounterY < 31) & (pixel1[13] == 1)) ? 11111111 : 0;
		assign sq39 =  ((CounterX > 45 ) & (CounterY > 25)  & (CounterX < 51) & (CounterY < 31) & (pixel1[14] == 1)) ? 11111111 : 0;

		assign sq40 =  ((CounterX > 25)  & (CounterY > 30)  & (CounterX < 31)  & (CounterY < 36) & (pixel1[15] == 1)) ? 11111111 : 0;
		assign sq41 =  ((CounterX > 30)  & (CounterY > 30)  & (CounterX < 36) & (CounterY < 36) & (pixel1[16] == 1)) ? 11111111 : 0;
		assign sq42 =  ((CounterX > 35)  & (CounterY > 30)  & (CounterX < 41) & (CounterY < 36) & (pixel1[17] == 1)) ? 11111111 : 0;

		assign sq43 =  ((CounterX > 40)  & (CounterY > 30)  & (CounterX < 46) & (CounterY < 36) & (pixel1[18] == 1)) ? 11111111 : 0;
		assign sq44 =  ((CounterX > 45)  & (CounterY > 30)  & (CounterX < 51) & (CounterY < 36) & (pixel1[19] == 1)) ? 11111111 : 0;

		assign sq45 =  ((CounterX > 25)  & (CounterY > 35)  & (CounterX < 31)  & (CounterY < 41) & (pixel1[20] == 1)) ? 11111111 : 0;
		assign sq46 =  ((CounterX > 30)  & (CounterY > 35)  & (CounterX < 36) & (CounterY < 41) & (pixel1[21] == 1)) ? 11111111 : 0;
		assign sq47 =  ((CounterX > 35)  & (CounterY > 35)  & (CounterX < 41) & (CounterY < 41) & (pixel1[22] == 1)) ? 11111111 : 0;

		assign sq48 =  ((CounterX > 40)  & (CounterY > 35)  & (CounterX < 46) & (CounterY < 41) & (pixel1[23] == 1)) ? 11111111 : 0;
		assign sq49 =  ((CounterX > 45)  & (CounterY > 35)  & (CounterX < 51) & (CounterY < 41) & (pixel1[24] == 1)) ? 11111111 : 0;
		
		
		//  3rd character 
		assign sq50 =  ((CounterX > 50)  & (CounterY > 15) & (CounterX < 56)  & (CounterY < 21) & (pixel2[0] == 1)) ? 11111111 : 0;
		assign sq51 =  ((CounterX > 55)  & (CounterY > 15) & (CounterX < 61) & (CounterY < 21) & (pixel2[1] == 1)) ? 11111111 : 0;
		assign sq52 =  ((CounterX > 60)  & (CounterY > 15)  & (CounterX < 66) & (CounterY < 21) & (pixel2[2] == 1)) ? 11111111 : 0;

		assign sq53 =  ((CounterX > 65)  & (CounterY > 15)  & (CounterX < 71) & (CounterY < 21) & (pixel2[3] == 1)) ? 11111111 : 0;
		assign sq54 =  ((CounterX > 70)  & (CounterY > 15)  & (CounterX < 76) & (CounterY < 21) & (pixel2[4] == 1)) ? 11111111 : 0;

		assign sq55 =  ((CounterX > 50)  & (CounterY > 20)  & (CounterX < 56)  & (CounterY < 26) & (pixel2[5] == 1)) ? 11111111 : 0;
		assign sq56 =  ((CounterX > 55)  & (CounterY > 20)  & (CounterX < 61) & (CounterY < 26) & (pixel2[6] == 1)) ? 11111111 : 0;
		assign sq57 =  ((CounterX > 60)  & (CounterY > 20)  & (CounterX < 66) & (CounterY < 26) & (pixel2[7] == 1)) ? 11111111 : 0;

		assign sq58 =  ((CounterX > 65)  & (CounterY > 20)  & (CounterX < 71) & (CounterY < 26) & (pixel2[8] == 1)) ? 11111111 : 0;
		assign sq59 =  ((CounterX > 70)  & (CounterY > 20)  & (CounterX < 76) & (CounterY < 26) & (pixel2[9] == 1)) ? 11111111 : 0;

		assign sq60 =  ((CounterX > 50)  & (CounterY > 25)  & (CounterX < 56)  & (CounterY < 31) & (pixel2[10] == 1)) ? 11111111 : 0;
		assign sq61 =  ((CounterX > 55)  & (CounterY > 25)  & (CounterX < 61) & (CounterY < 31) & (pixel2[11] == 1)) ? 11111111 : 0;
		assign sq62 =  ((CounterX > 60)  & (CounterY > 25)  & (CounterX < 66) & (CounterY < 31) & (pixel2[12] == 1)) ? 11111111 : 0;

		assign sq63 =  ((CounterX > 65)  & (CounterY > 25)  & (CounterX < 71) & (CounterY < 31) & (pixel2[13] == 1)) ? 11111111 : 0;
		assign sq64 =  ((CounterX > 70) & (CounterY > 25)  & (CounterX < 76) & (CounterY < 31) & (pixel2[14] == 1)) ? 11111111 : 0;

		assign sq65 =  ((CounterX > 50)  & (CounterY > 30)  & (CounterX < 56)  & (CounterY < 36) & (pixel2[15] == 1)) ? 11111111 : 0;
		assign sq66 =  ((CounterX > 55)  & (CounterY > 30)  & (CounterX < 61) & (CounterY < 36) & (pixel2[16] == 1)) ? 11111111 : 0;
		assign sq67 =  ((CounterX > 60)  & (CounterY > 30)  & (CounterX < 66) & (CounterY < 36) & (pixel2[17] == 1)) ? 11111111 : 0;

		assign sq68 =  ((CounterX > 65)  & (CounterY > 30)  & (CounterX < 71) & (CounterY < 36) & (pixel2[18] == 1)) ? 11111111 : 0;
		assign sq69 =  ((CounterX > 70)  & (CounterY > 30)  & (CounterX < 76) & (CounterY < 36) & (pixel2[19] == 1)) ? 11111111 : 0;

		assign sq70 =  ((CounterX > 50)  & (CounterY > 35)  & (CounterX < 56)  & (CounterY < 41) & (pixel2[20] == 1)) ? 11111111 : 0;
		assign sq71 =  ((CounterX > 55)  & (CounterY > 35)  & (CounterX < 61) & (CounterY < 41) & (pixel2[21] == 1)) ? 11111111 : 0;
		assign sq72 =  ((CounterX > 60)  & (CounterY > 35)  & (CounterX < 66) & (CounterY < 41) & (pixel2[22] == 1)) ? 11111111 : 0;

		assign sq73 =  ((CounterX > 65)  & (CounterY > 35)  & (CounterX < 71) & (CounterY < 41) & (pixel2[23] == 1)) ? 11111111 : 0;
		assign sq74 =  ((CounterX > 70)  & (CounterY > 35)  & (CounterX < 76) & (CounterY < 41) & (pixel2[24] == 1)) ? 11111111 : 0;
		
		
		//  4th character 
		assign sq75 =  ((CounterX > 75)  & (CounterY > 15) & (CounterX < 81)  & (CounterY < 21) & (pixel3[0] == 1)) ? 11111111 : 0;
		assign sq76 =  ((CounterX > 80)  & (CounterY > 15) & (CounterX < 86) & (CounterY < 21) & (pixel3[1] == 1)) ? 11111111 : 0;
		assign sq77 =  ((CounterX > 85)  & (CounterY > 15)  & (CounterX < 91) & (CounterY < 21) & (pixel3[2] == 1)) ? 11111111 : 0;

		assign sq78 =  ((CounterX > 90)  & (CounterY > 15)  & (CounterX < 96) & (CounterY < 21) & (pixel3[3] == 1)) ? 11111111 : 0;
		assign sq79 =  ((CounterX > 95)  & (CounterY > 15)  & (CounterX < 101) & (CounterY < 21) & (pixel3[4] == 1)) ? 11111111 : 0;

		assign sq80 =  ((CounterX > 75)  & (CounterY > 20)  & (CounterX < 81)  & (CounterY < 26) & (pixel3[5] == 1)) ? 11111111 : 0;
		assign sq81 =  ((CounterX > 80)  & (CounterY > 20)  & (CounterX < 86) & (CounterY < 26) & (pixel3[6] == 1)) ? 11111111 : 0;
		assign sq82 =  ((CounterX > 85)  & (CounterY > 20)  & (CounterX < 91) & (CounterY < 26) & (pixel3[7] == 1)) ? 11111111 : 0;

		assign sq83 =  ((CounterX > 90)  & (CounterY > 20)  & (CounterX < 96) & (CounterY < 26) & (pixel3[8] == 1)) ? 11111111 : 0;
		assign sq84 =  ((CounterX > 95)  & (CounterY > 20)  & (CounterX < 101) & (CounterY < 26) & (pixel3[9] == 1)) ? 11111111 : 0;

		assign sq85 =  ((CounterX > 75)  & (CounterY > 25)  & (CounterX < 81)  & (CounterY < 31) & (pixel3[10] == 1)) ? 11111111 : 0;
		assign sq86 =  ((CounterX > 80)  & (CounterY > 25)  & (CounterX < 86) & (CounterY < 31) & (pixel3[11] == 1)) ? 11111111 : 0;
		assign sq87=  ((CounterX > 85)  & (CounterY > 25)  & (CounterX < 91) & (CounterY < 31) & (pixel3[12] == 1)) ? 11111111 : 0;

		assign sq88 =  ((CounterX > 90)  & (CounterY > 25)  & (CounterX < 96) & (CounterY < 31) & (pixel3[13] == 1)) ? 11111111 : 0;
		assign sq89 =  ((CounterX > 95) & (CounterY > 25)  & (CounterX < 101) & (CounterY < 31) & (pixel3[14] == 1)) ? 11111111 : 0;

		assign sq90 =  ((CounterX > 75)  & (CounterY > 30)  & (CounterX < 81)  & (CounterY < 36) & (pixel3[15] == 1)) ? 11111111 : 0;
		assign sq91 =  ((CounterX > 80)  & (CounterY > 30)  & (CounterX < 86) & (CounterY < 36) & (pixel3[16] == 1)) ? 11111111 : 0;
		assign sq92 =  ((CounterX > 85)  & (CounterY > 30)  & (CounterX < 91) & (CounterY < 36) & (pixel3[17] == 1)) ? 11111111 : 0;

		assign sq93 =  ((CounterX > 90)  & (CounterY > 30)  & (CounterX < 96) & (CounterY < 36) & (pixel3[18] == 1)) ? 11111111 : 0;
		assign sq94 =  ((CounterX > 95)  & (CounterY > 30)  & (CounterX < 101) & (CounterY < 36) & (pixel3[19] == 1)) ? 11111111 : 0;

		assign sq95 =  ((CounterX > 75)  & (CounterY > 35)  & (CounterX < 81)  & (CounterY < 41) & (pixel3[20] == 1)) ? 11111111 : 0;
		assign sq96 =  ((CounterX > 80)  & (CounterY > 35)  & (CounterX < 86) & (CounterY < 41) & (pixel3[21] == 1)) ? 11111111 : 0;
		assign sq97 =  ((CounterX > 85)  & (CounterY > 35)  & (CounterX < 91) & (CounterY < 41) & (pixel3[22] == 1)) ? 11111111 : 0;

		assign sq98 =  ((CounterX > 90)  & (CounterY > 35)  & (CounterX < 96) & (CounterY < 41) & (pixel3[23] == 1)) ? 11111111 : 0;
		assign sq99 =  ((CounterX > 95)  & (CounterY > 35)  & (CounterX < 101) & (CounterY < 41) & (pixel3[24] == 1)) ? 11111111 : 0;
		
		
		//  5th character 
		assign sq100 =  ((CounterX > 100)  & (CounterY > 15) & (CounterX < 106)  & (CounterY < 21) & (pixel4[0] == 1)) ? 11111111 : 0;
		assign sq101 =  ((CounterX > 105)  & (CounterY > 15) & (CounterX < 111) & (CounterY < 21) & (pixel4[1] == 1)) ? 11111111 : 0;
		assign sq102 =  ((CounterX > 110)  & (CounterY > 15)  & (CounterX < 116) & (CounterY < 21) & (pixel4[2] == 1)) ? 11111111 : 0;

		assign sq103 =  ((CounterX > 115)  & (CounterY > 15)  & (CounterX < 121) & (CounterY < 21) & (pixel4[3] == 1)) ? 11111111 : 0;
		assign sq104 =  ((CounterX > 120)  & (CounterY > 15)  & (CounterX < 126) & (CounterY < 21) & (pixel4[4] == 1)) ? 11111111 : 0;

		assign sq105 =  ((CounterX > 100)  & (CounterY > 20)  & (CounterX < 106)  & (CounterY < 26) & (pixel4[5] == 1)) ? 11111111 : 0;
		assign sq106 =  ((CounterX > 105)  & (CounterY > 20)  & (CounterX < 111) & (CounterY < 26) & (pixel4[6] == 1)) ? 11111111 : 0;
		assign sq107 =  ((CounterX > 110)  & (CounterY > 20)  & (CounterX < 116) & (CounterY < 26) & (pixel4[7] == 1)) ? 11111111 : 0;

		assign sq108 =  ((CounterX > 115)  & (CounterY > 20)  & (CounterX < 121) & (CounterY < 26) & (pixel4[8] == 1)) ? 11111111 : 0;
		assign sq109 =  ((CounterX > 120)  & (CounterY > 20)  & (CounterX < 126) & (CounterY < 26) & (pixel4[9] == 1)) ? 11111111 : 0;

		assign sq110 =  ((CounterX > 100)  & (CounterY > 25)  & (CounterX < 106)  & (CounterY < 31) & (pixel4[10] == 1)) ? 11111111 : 0;
		assign sq111 =  ((CounterX > 105)  & (CounterY > 25)  & (CounterX < 111) & (CounterY < 31) & (pixel4[11] == 1)) ? 11111111 : 0;
		assign sq112 =  ((CounterX > 110)  & (CounterY > 25)  & (CounterX < 116) & (CounterY < 31) & (pixel4[12] == 1)) ? 11111111 : 0;

		assign sq113 =  ((CounterX > 115)  & (CounterY > 25)  & (CounterX < 121) & (CounterY < 31) & (pixel4[13] == 1)) ? 11111111 : 0;
		assign sq114 =  ((CounterX > 120) & (CounterY > 25)  & (CounterX < 126) & (CounterY < 31) & (pixel4[14] == 1)) ? 11111111 : 0;

		assign sq115 =  ((CounterX > 100)  & (CounterY > 30)  & (CounterX < 106)  & (CounterY < 36) & (pixel4[15] == 1)) ? 11111111 : 0;
		assign sq116 =  ((CounterX > 105)  & (CounterY > 30)  & (CounterX < 111) & (CounterY < 36) & (pixel4[16] == 1)) ? 11111111 : 0;
		assign sq117 =  ((CounterX > 110)  & (CounterY > 30)  & (CounterX < 116) & (CounterY < 36) & (pixel4[17] == 1)) ? 11111111 : 0;

		assign sq118 =  ((CounterX > 115)  & (CounterY > 30)  & (CounterX < 121) & (CounterY < 36) & (pixel4[18] == 1)) ? 11111111 : 0;
		assign sq119 =  ((CounterX > 120)  & (CounterY > 30)  & (CounterX < 126) & (CounterY < 36) & (pixel4[19] == 1)) ? 11111111 : 0;

		assign sq120 =  ((CounterX > 100)  & (CounterY > 35)  & (CounterX < 106)  & (CounterY < 41) & (pixel4[20] == 1)) ? 11111111 : 0;
		assign sq121 =  ((CounterX > 105)  & (CounterY > 35)  & (CounterX < 111) & (CounterY < 41) & (pixel4[21] == 1)) ? 11111111 : 0;
		assign sq122 =  ((CounterX > 110)  & (CounterY > 35)  & (CounterX < 116) & (CounterY < 41) & (pixel4[22] == 1)) ? 11111111 : 0;

		assign sq123 =  ((CounterX > 115)  & (CounterY > 35)  & (CounterX < 121) & (CounterY < 41) & (pixel4[23] == 1)) ? 11111111 : 0;
		assign sq124 =  ((CounterX > 120)  & (CounterY > 35)  & (CounterX < 126) & (CounterY < 41) & (pixel4[24] == 1)) ? 11111111 : 0;
		
		
		//  6th character 
		assign sq125 =  ((CounterX > 125)  & (CounterY > 15) & (CounterX < 131)  & (CounterY < 21) & (pixel5[0] == 1)) ? 11111111 : 0;
		assign sq126 =  ((CounterX > 130)  & (CounterY > 15) & (CounterX < 136) & (CounterY < 21) & (pixel5[1] == 1)) ? 11111111 : 0;
		assign sq127 =  ((CounterX > 135)  & (CounterY > 15)  & (CounterX < 141) & (CounterY < 21) & (pixel5[2] == 1)) ? 11111111 : 0;

		assign sq128 =  ((CounterX > 140)  & (CounterY > 15)  & (CounterX < 146) & (CounterY < 21) & (pixel5[3] == 1)) ? 11111111 : 0;
		assign sq129 =  ((CounterX > 145)  & (CounterY > 15)  & (CounterX < 151) & (CounterY < 21) & (pixel5[4] == 1)) ? 11111111 : 0;

		assign sq130 =  ((CounterX > 125)  & (CounterY > 20)  & (CounterX < 131)  & (CounterY < 26) & (pixel5[5] == 1)) ? 11111111 : 0;
		assign sq131 =  ((CounterX > 130)  & (CounterY > 20)  & (CounterX < 136) & (CounterY < 26) & (pixel5[6] == 1)) ? 11111111 : 0;
		assign sq132 =  ((CounterX > 135)  & (CounterY > 20)  & (CounterX < 141) & (CounterY < 26) & (pixel5[7] == 1)) ? 11111111 : 0;

		assign sq133 =  ((CounterX > 140)  & (CounterY > 20)  & (CounterX < 146) & (CounterY < 26) & (pixel5[8] == 1)) ? 11111111 : 0;
		assign sq134 =  ((CounterX > 145)  & (CounterY > 20)  & (CounterX < 151) & (CounterY < 26) & (pixel5[9] == 1)) ? 11111111 : 0;

		assign sq135 =  ((CounterX > 125)  & (CounterY > 25)  & (CounterX < 131)  & (CounterY < 31) & (pixel5[10] == 1)) ? 11111111 : 0;
		assign sq136 =  ((CounterX > 130)  & (CounterY > 25)  & (CounterX < 136) & (CounterY < 31) & (pixel5[11] == 1)) ? 11111111 : 0;
		assign sq137 =  ((CounterX > 135)  & (CounterY > 25)  & (CounterX < 141) & (CounterY < 31) & (pixel5[12] == 1)) ? 11111111 : 0;

		assign sq138 =  ((CounterX > 140)  & (CounterY > 25)  & (CounterX < 146) & (CounterY < 31) & (pixel5[13] == 1)) ? 11111111 : 0;
		assign sq139 =  ((CounterX > 145) & (CounterY > 25)  & (CounterX < 151) & (CounterY < 31) & (pixel5[14] == 1)) ? 11111111 : 0;

		assign sq140 =  ((CounterX > 125)  & (CounterY > 30)  & (CounterX < 131)  & (CounterY < 36) & (pixel5[15] == 1)) ? 11111111 : 0;
		assign sq141 =  ((CounterX > 130)  & (CounterY > 30)  & (CounterX < 136) & (CounterY < 36) & (pixel5[16] == 1)) ? 11111111 : 0;
		assign sq142 =  ((CounterX > 135)  & (CounterY > 30)  & (CounterX < 141) & (CounterY < 36) & (pixel5[17] == 1)) ? 11111111 : 0;

		assign sq143 =  ((CounterX > 140)  & (CounterY > 30)  & (CounterX < 146) & (CounterY < 36) & (pixel5[18] == 1)) ? 11111111 : 0;
		assign sq144 =  ((CounterX > 145)  & (CounterY > 30)  & (CounterX < 151) & (CounterY < 36) & (pixel5[19] == 1)) ? 11111111 : 0;

		assign sq145 =  ((CounterX > 125)  & (CounterY > 35)  & (CounterX < 131)  & (CounterY < 41) & (pixel5[20] == 1)) ? 11111111 : 0;
		assign sq146 =  ((CounterX > 130)  & (CounterY > 35)  & (CounterX < 136) & (CounterY < 41) & (pixel5[21] == 1)) ? 11111111 : 0;
		assign sq147 =  ((CounterX > 135)  & (CounterY > 35)  & (CounterX < 141) & (CounterY < 41) & (pixel5[22] == 1)) ? 11111111 : 0;

		assign sq148 =  ((CounterX > 140)  & (CounterY > 35)  & (CounterX < 146) & (CounterY < 41) & (pixel5[23] == 1)) ? 11111111 : 0;
		assign sq149 =  ((CounterX > 145)  & (CounterY > 35)  & (CounterX < 151) & (CounterY < 41) & (pixel5[24] == 1)) ? 11111111 : 0;
		
		
		//  7th character 
		assign sq150 =  ((CounterX > 150)  & (CounterY > 15) & (CounterX < 156)  & (CounterY < 21)& (pixel6[0] == 1)) ? 11111111 : 0;
		assign sq151 =  ((CounterX > 155)  & (CounterY > 15) & (CounterX < 161) & (CounterY < 21)& (pixel6[1] == 1)) ? 11111111 : 0;
		assign sq152 =  ((CounterX > 160)  & (CounterY > 15)  & (CounterX < 166) & (CounterY < 21)& (pixel6[2] == 1)) ? 11111111 : 0;

		assign sq153 =  ((CounterX > 165)  & (CounterY > 15)  & (CounterX < 171) & (CounterY < 21)& (pixel6[3] == 1)) ? 11111111 : 0;
		assign sq154 =  ((CounterX > 170)  & (CounterY > 15)  & (CounterX < 176) & (CounterY < 21)& (pixel6[4] == 1)) ? 11111111 : 0;

		assign sq155 =  ((CounterX > 150)  & (CounterY > 20)  & (CounterX < 156)  & (CounterY < 26)& (pixel6[5] == 1)) ? 11111111 : 0;
		assign sq156 =  ((CounterX > 155)  & (CounterY > 20)  & (CounterX < 161) & (CounterY < 26)& (pixel6[6] == 1)) ? 11111111 : 0;
		assign sq157 =  ((CounterX > 160)  & (CounterY > 20)  & (CounterX < 166) & (CounterY < 26)& (pixel6[7] == 1)) ? 11111111 : 0;

		assign sq158 =  ((CounterX > 165)  & (CounterY > 20)  & (CounterX < 171) & (CounterY < 26)& (pixel6[8] == 1)) ? 11111111 : 0;
		assign sq159 =  ((CounterX > 170)  & (CounterY > 20)  & (CounterX < 176) & (CounterY < 26)& (pixel6[9] == 1)) ? 11111111 : 0;

		assign sq160 =  ((CounterX > 150)  & (CounterY > 25)  & (CounterX < 156)  & (CounterY < 31)& (pixel6[10] == 1)) ? 11111111 : 0;
		assign sq161 =  ((CounterX > 155)  & (CounterY > 25)  & (CounterX < 161) & (CounterY < 31)& (pixel6[11] == 1)) ? 11111111 : 0;
		assign sq162 =  ((CounterX > 160)  & (CounterY > 25)  & (CounterX < 166) & (CounterY < 31)& (pixel6[12] == 1)) ? 11111111 : 0;

		assign sq163 =  ((CounterX > 165)  & (CounterY > 25)  & (CounterX < 171) & (CounterY < 31)& (pixel6[13] == 1)) ? 11111111 : 0;
		assign sq164 =  ((CounterX > 170) & (CounterY > 25)  & (CounterX < 176) & (CounterY < 31)& (pixel6[14] == 1)) ? 11111111 : 0;

		assign sq165 =  ((CounterX > 150)  & (CounterY > 30)  & (CounterX < 156)  & (CounterY < 36)& (pixel6[15] == 1)) ? 11111111 : 0;
		assign sq166 =  ((CounterX > 155)  & (CounterY > 30)  & (CounterX < 161) & (CounterY < 36)& (pixel6[16] == 1)) ? 11111111 : 0;
		assign sq167 =  ((CounterX > 160)  & (CounterY > 30)  & (CounterX < 166) & (CounterY < 36)& (pixel6[17] == 1)) ? 11111111 : 0;

		assign sq168 =  ((CounterX > 165)  & (CounterY > 30)  & (CounterX < 171) & (CounterY < 36)& (pixel6[18] == 1)) ? 11111111 : 0;
		assign sq169 =  ((CounterX > 170)  & (CounterY > 30)  & (CounterX < 176) & (CounterY < 36)& (pixel6[19] == 1)) ? 11111111 : 0;

		assign sq170 =  ((CounterX > 150)  & (CounterY > 35)  & (CounterX < 156)  & (CounterY < 41)& (pixel6[20] == 1)) ? 11111111 : 0;
		assign sq171 =  ((CounterX > 155)  & (CounterY > 35)  & (CounterX < 161) & (CounterY < 41)& (pixel6[21] == 1)) ? 11111111 : 0;
		assign sq172 =  ((CounterX > 160)  & (CounterY > 35)  & (CounterX < 166) & (CounterY < 41)& (pixel6[22] == 1)) ? 11111111 : 0;

		assign sq173 =  ((CounterX > 165)  & (CounterY > 35)  & (CounterX < 171) & (CounterY < 41)& (pixel6[23] == 1)) ? 11111111 : 0;
		assign sq174 =  ((CounterX > 170)  & (CounterY > 35)  & (CounterX < 176) & (CounterY < 41)& (pixel6[24] == 1)) ? 11111111 : 0;
		
		
		//  8th character 
		assign sq175 =  ((CounterX > 175)  & (CounterY > 15) & (CounterX < 181)  & (CounterY < 21)& (pixel7[0] == 1)) ? 11111111 : 0;
		assign sq176 =  ((CounterX > 180)  & (CounterY > 15) & (CounterX < 186) & (CounterY < 21)& (pixel7[1] == 1)) ? 11111111 : 0;
		assign sq177 =  ((CounterX > 185)  & (CounterY > 15)  & (CounterX < 191) & (CounterY < 21)& (pixel7[2] == 1)) ? 11111111 : 0;

		assign sq178 =  ((CounterX > 190)  & (CounterY > 15)  & (CounterX < 196) & (CounterY < 21)& (pixel7[3] == 1)) ? 11111111 : 0;
		assign sq179 =  ((CounterX > 195)  & (CounterY > 15)  & (CounterX < 201) & (CounterY < 21)& (pixel7[4] == 1)) ? 11111111 : 0;

		assign sq180 =  ((CounterX > 175)  & (CounterY > 20)  & (CounterX < 181)  & (CounterY < 26)& (pixel7[5] == 1)) ? 11111111 : 0;
		assign sq181 =  ((CounterX > 180)  & (CounterY > 20)  & (CounterX < 186) & (CounterY < 26)& (pixel7[6] == 1)) ? 11111111 : 0;
		assign sq182 =  ((CounterX > 185)  & (CounterY > 20)  & (CounterX < 191) & (CounterY < 26)& (pixel7[7] == 1)) ? 11111111 : 0;

		assign sq183 =  ((CounterX > 190)  & (CounterY > 20)  & (CounterX < 196) & (CounterY < 26)& (pixel7[8] == 1)) ? 11111111 : 0;
		assign sq184 =  ((CounterX > 195)  & (CounterY > 20)  & (CounterX < 201) & (CounterY < 26)& (pixel7[9] == 1)) ? 11111111 : 0;

		assign sq185 =  ((CounterX > 175)  & (CounterY > 25)  & (CounterX < 181)  & (CounterY < 31)& (pixel7[10] == 1)) ? 11111111 : 0;
		assign sq186 =  ((CounterX > 180)  & (CounterY > 25)  & (CounterX < 186) & (CounterY < 31)& (pixel7[11] == 1)) ? 11111111 : 0;
		assign sq187 =  ((CounterX > 185)  & (CounterY > 25)  & (CounterX < 191) & (CounterY < 31)& (pixel7[12] == 1)) ? 11111111 : 0;

		assign sq188 =  ((CounterX > 190)  & (CounterY > 25)  & (CounterX < 196) & (CounterY < 31)& (pixel7[13] == 1)) ? 11111111: 0;
		assign sq189 =  ((CounterX > 195) & (CounterY > 25)  & (CounterX < 201) & (CounterY < 31)& (pixel7[14] == 1)) ? 11111111 : 0;

		assign sq190 =  ((CounterX > 175)  & (CounterY > 30)  & (CounterX < 181)  & (CounterY < 36)& (pixel7[15] == 1)) ? 11111111 : 0;
		assign sq191 =  ((CounterX > 180)  & (CounterY > 30)  & (CounterX < 186) & (CounterY < 36)& (pixel7[16] == 1)) ? 11111111 : 0;
		assign sq192 =  ((CounterX > 185)  & (CounterY > 30)  & (CounterX < 191) & (CounterY < 36)& (pixel7[17] == 1)) ? 11111111 : 0;

		assign sq193 =  ((CounterX > 190)  & (CounterY > 30)  & (CounterX < 196) & (CounterY < 36)& (pixel7[18] == 1)) ? 11111111 : 0;
		assign sq194 =  ((CounterX > 195)  & (CounterY > 30)  & (CounterX < 201) & (CounterY < 36)& (pixel7[19] == 1)) ? 11111111 : 0;

		assign sq195 =  ((CounterX > 175)  & (CounterY > 35)  & (CounterX < 181)  & (CounterY < 41)& (pixel7[20] == 1)) ? 11111111 : 0;
		assign sq196 =  ((CounterX > 180)  & (CounterY > 35)  & (CounterX < 186) & (CounterY < 41)& (pixel7[21] == 1)) ? 11111111 : 0;
		assign sq197 =  ((CounterX > 185)  & (CounterY > 35)  & (CounterX < 191) & (CounterY < 41)& (pixel7[22] == 1)) ? 11111111 : 0;

		assign sq198 =  ((CounterX > 190)  & (CounterY > 35)  & (CounterX < 196) & (CounterY < 41)& (pixel7[23] == 1)) ? 11111111 : 0;
		assign sq199 =  ((CounterX > 195)  & (CounterY > 35)  & (CounterX < 201) & (CounterY < 41)& (pixel7[24] == 1)) ? 11111111 : 0;
		
	 wire [7:0] code;
	 wire clk2;
	 wire A;
	 wire [24:0] pixel;
	 wire [24:0] pixel1;
	 wire [24:0] pixel2;
	 wire [24:0] pixel3;
	 wire [24:0] pixel4;
	 wire [24:0] pixel5;
	 wire [24:0] pixel6;
	 wire [24:0] pixel7;
	 wire [24:0] pixel8;
	 
	 wire [7:0] v0;
	 wire [7:0] v1;
	 wire [7:0] v2;
	 wire [7:0] v3;
	 wire [7:0] v4;
	 wire [7:0] v5;
	 wire [7:0] v6;
	 wire [7:0] v7;
	 

	 ps2 ps2(.PS2Clk(PS2Clk),.FPGAClk(clk),.rst(rst),.datain(datai),.scancode(),.key(code),.SEG1(SEG1),.SEG2(SEG2),.SEG3(SEG3),.SEG4(SEG4),.SEG5(SEG5),.SEG6(SEG6),.shift(keydetect));
	 
	 
	 
	 always @(posedge clk25)
    begin
			if (keydetect)begin
				xi = xi + 1;
				xf = xf + 1;
			end
    end
	 
	 shiftregV vgas1(.clk(clk25),.data(code),.shren(keydetect),.v0(v0),.v1(v1),.v2(v2),.v3(v3),.v4(v4),.v5(v5),.v6(v6),.v7(v7));
	 shiftreg2 s2(.clk(clk25),.data(code),.rst(~rst),.shren(midout),.dout0(segments0),.dout1(segments1),.dout2(segments2),.dout3(segments3),.dout4(segments4),.dout5(segments5));
	 
	 vgadecoder vga1(.code(v0),.vgaout(pixel));
	 vgadecoder vga2(.code(v1),.vgaout(pixel1));
	 vgadecoder vga3(.code(v2),.vgaout(pixel2));
	 vgadecoder vga4(.code(v3),.vgaout(pixel3));
	 vgadecoder vga5(.code(v4),.vgaout(pixel4));
	 vgadecoder vga6(.code(v5),.vgaout(pixel5));
	 vgadecoder vga7(.code(v6),.vgaout(pixel6));
	 vgadecoder vga8(.code(v7),.vgaout(pixel7));

    always @(posedge clk25)
    begin
			if (inDisplayArea)begin
			  r <= sq0 | sq1 | sq2 | sq3 | sq4 | sq5 | sq6 | sq7 | sq8 | sq9 | sq10 | sq11 | sq12 | sq13 | sq14 | sq15 | sq16 | sq17 | sq18 | sq19 | sq20 | sq21 | sq22 | sq23 | sq24 | sq25 | sq26 | sq27 | sq28 | sq29 | sq30 | sq31 | sq32 | sq33 | sq34 | sq35 | sq36 | sq37 | sq38 | sq39 | sq40 | sq41 | sq42 | sq43 | sq44 | sq45 | sq46 | sq47 | sq48 | sq49 | sq50 | sq51 | sq52 | sq53 | sq54 | sq55 | sq56 | sq57 | sq58 | sq59 | sq60 | sq61 | sq62 | sq63 | sq64 | sq65 | sq66 | sq67 | sq68 | sq69 | sq70 | sq71 | sq72 | sq73 | sq74 | sq75 | sq76 | sq77 | sq78 | sq79 | sq80 | sq81 | sq82 | sq83 | sq84 | sq85 | sq86 | sq87 | sq88 | sq89 | sq90 | sq91 | sq92 | sq93 | sq94 | sq95 | sq96 | sq97 | sq98 | sq99 | sq100 | sq101 | sq102 | sq103 | sq104 | sq105 | sq106 | sq107 | sq108 | sq109 | sq110 | sq111 | sq112 | sq113 | sq114 | sq115 | sq116 | sq117 | sq118 | sq119 | sq120 | sq121 | sq122 | sq123 | sq124 | sq125 | sq126 | sq127 | sq128 | sq129 | sq130 | sq131 | sq132 | sq133 | sq134 | sq135 | sq136 | sq137 | sq138 | sq139 | sq140 | sq141 | sq142 | sq143 | sq144 | sq145 | sq146 | sq147 | sq148 | sq149 | sq150 | sq151 | sq152 | sq153 | sq154 | sq155 | sq156 | sq157 | sq158 | sq159 | sq160 | sq161 | sq162 | sq163 | sq164 | sq165 | sq166 | sq167 | sq168 | sq169 | sq170 | sq171 | sq172 | sq173 | sq174 | sq175 | sq176 | sq177 | sq178 | sq179 | sq180 | sq181 | sq182 | sq183 | sq184 | sq185 | sq186 | sq187 | sq188 | sq189 | sq190 | sq191 | sq192 | sq193 | sq194 | sq195 | sq196 | sq197 | sq198 | sq199;
			  g <= 0;
			  b <= 0;
		  end
      else if (code == 8'h32)begin// if it's not to display, go dark
			g <= r;
			b <= r;
			end
		else begin
			r <= 000;
			g <= 000;
			b <= 000;
	  end
    end

endmodule