`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:18:06 09/24/2021 
// Design Name: 
// Module Name:    pwm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module pwm(
	input clkl,
	input en,
	input counterFlip,
	input counterTop,
	output signal
    );
	 
	 parameter WIDTH = 32;
	 parameter 	IDLE 	= 4'b0001,
					START = 4'b0010,
					COUNT = 4'b0011,
					SHIFT = 4'b0100,
					END	= 4'b0101;
	reg	[3:0] CURRENT_STATE, NEXT_STATE;
	 
	 reg [WIDTH-1:0] counter;
	 
	 always @(posedge clk1 or posedge rst) 
		begin
		
	
		
	 
		end


endmodule
