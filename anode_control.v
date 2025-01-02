`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2023 09:29:46 PM
// Design Name: 
// Module Name: anode_control
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


module anode_control(
    input [1:0]Digit_Display, // 10khz
    output reg [3:0] anode = 0

    );
    
    always@(Digit_Display)
    begin 
        case (Digit_Display)
            2'b00:
                anode = 4'b1110; // Right most digit on (Digit 1)
            2'b01:
                anode = 4'b1101; //Digit 2 display
            2'b10:
                anode = 4'b1011; // digit 3 display
            2'b11:
                anode = 4'b0111; //  digit 4 display
         endcase
    end
            
    
endmodule
