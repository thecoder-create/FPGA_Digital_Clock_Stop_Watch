`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2023 09:24:26 PM
// Design Name: 
// Module Name: Digit_Display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Digit_Display(
    input clock,
    output reg [2:0]Digit_Display = 0
    

    );
    
    always@(posedge clock)
    if(Digit_Display ==6)
        Digit_Display <=0;
    else
     Digit_Display <= Digit_Display +1;
endmodule
