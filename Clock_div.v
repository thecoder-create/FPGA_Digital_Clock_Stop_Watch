`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2023 02:57:30 PM
// Design Name: 
// Module Name: Clock_div
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


module Clock_div #(parameter Div_value = 200 )( // div can be change from top
    input wire clk,
    output reg New_clk=0

    );
    integer couter = 0;
//    integer Div_value =150;
    
    always@(posedge clk)
        begin
    
            if (couter == Div_value)
                couter<= 0;
            else
                couter = couter+1;
        end
    always@(posedge clk)
    begin
        if (couter == Div_value)
            New_clk =~New_clk;
    end
    
endmodule
