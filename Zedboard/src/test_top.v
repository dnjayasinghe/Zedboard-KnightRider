`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:30:15 09/26/2021
// Design Name:   top
// Module Name:   H:/OneDrive - UNSW/My Onedrive/PhD/Src/GitHub/Zedboard-knightrider/Zedboard-KnightRider/Zedboard/src/test_top.v
// Project Name:  Zedboard
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_top;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [7:0] leds;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.rst(rst), 
		.leds(leds)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#200;
        
		// Add stimulus here
		rst = 1;
		#100;
		rst = 0;
		#100;
		
	end
	always 
		begin
			clk = 1'b1; 
			#20; // high for 20 * timescale = 20 ns

			clk = 1'b0;
			#20; // low for 20 * timescale = 20 ns
		end
		
	always @(posedge clk)
      begin
			
			
		end
endmodule

