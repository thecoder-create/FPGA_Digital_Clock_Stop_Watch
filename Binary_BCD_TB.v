`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2023 01:30:17 PM
// Design Name: 
// Module Name: Binary_BCD_TB
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


module Binary_BCD_TB(

    );
    reg clk;
    reg[5:0] signal; // 6 bit signal input
    wire [3:0] hundred;
    wire [3:0] tens;
    wire [3:0] ones;
    
    Binary_to_BCD uut (clk,signal,hundred,tens,ones);
     integer i;
    always #5 clk = ~clk;
    initial begin 
   
    for (i = 0 ; i <60 ; i = i+1)
    begin
    {signal}= i;
    #15;
    end 
    $finish;
    
   end 
endmodule
