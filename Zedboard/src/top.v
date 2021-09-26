`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:16:31 09/24/2021 
// Design Name: 
// Module Name:    top 
// Project Name: Zedboard Knight Rider Lights
// Target Devices: Zynq 7020- Zedboard
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
module top(
	input clk,
	input rst,
	output[7:0] leds
    );




////  module instantiation
//pwm pwm0(.clkl(), .counterFlip(), .counterTop(), .signal() );


parameter WIDTH = 32;
parameter MAX	= 2**23;

	 parameter 	IDLE 			= 4'b0000,
					START 		= 4'b0001,
					COUNT 		= 4'b0010,
					SHIFTLEFT 	= 4'b0011,
					SHIFTRIGHT 	= 4'b0100,
					END			= 4'b0101;
	reg	[3:0] CURRENT_STATE, NEXT_STATE;
	 
	reg [WIDTH-1:0] 	counter;
	reg [7:0] 			ledReg;
	reg 					dir; // dir 1 to left;  0 to right;
	
	
	
	assign leds	= ledReg;
	 
	 always @(posedge clk or posedge rst) 
		begin
		
		if(rst==1) 
			begin
				CURRENT_STATE <= IDLE;
			end
		else 
			begin
				CURRENT_STATE <= NEXT_STATE;
			end	 
		end

	always @(posedge clk)
		begin
		case(CURRENT_STATE)
		
			IDLE:
					begin
						counter 	<=0;
						ledReg 	<=1;
						dir		<=1;
						NEXT_STATE <= START;
					end
			START:
					begin
						NEXT_STATE <= COUNT;
						counter	<= 0;
					end
			COUNT:
					begin
						if(counter == MAX)
								begin
								
								if(dir==1)
									NEXT_STATE <= SHIFTLEFT;
								else
									NEXT_STATE <= SHIFTRIGHT;
								end
						else	
								counter	<= counter + 1;
					end
			SHIFTLEFT:
					begin
						if(ledReg[7] ==1)
							dir <= ~dir;
						else
							ledReg <= {ledReg[6:0], ledReg[7]};
						
						NEXT_STATE <= START;		
					end
			SHIFTRIGHT:
					begin
						if(ledReg[0] ==1)
							dir <= ~dir;
						else
							ledReg <= {ledReg[0], ledReg[7:1]};
						NEXT_STATE <= START;	
					end
		endcase
		
		end


endmodule
