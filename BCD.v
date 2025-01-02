`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2023 10:41:04 PM
// Design Name: 
// Module Name: BCD
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

module BCD_To_7seg(
    input [3:0] Display,
    output reg [7:0] cathode
    );
    
    always@(*) begin
        case(Display)
            4'b0000 : cathode = 8'b00000011;//0
            4'b0001 : cathode = 8'b10011111;//1
            4'b0010 : cathode = 8'b00100101;//2
            4'b0011 : cathode = 8'b00001101;//3
            4'b0100 : cathode = 8'b10011001;//4
            4'b0101 : cathode = 8'b01001001;//5
            4'b0110 : cathode = 8'b01000001;//6
            4'b0111 : cathode = 8'b00011111;//7
            4'b1000 : cathode = 8'b00000001;//8
            4'b1001 : cathode = 8'b00001001;//9
            4'b1010 : cathode = 8'b11111110;//DP
            default : cathode = 8'b11111111;
        endcase
    end
endmodule