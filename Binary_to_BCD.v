`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 10:59:11 AM
// Design Name: 
// Module Name: Binary_to_BCD
// Project Name: 

// 
//////////////////////////////////////////////////////////////////////////////////


module Binary_to_BCD(
    input clk,
    input[5:0] signal, // 12 bit signal input
    output reg [3:0] hundred,
    output reg [3:0] tens,
    output reg [3:0] ones
    );
    
    
    reg [5:0]temp;
////////////////////////////////////////
always @(posedge clk) begin 
hundred =signal /100;
temp = signal %100;
tens = signal/10;
ones = signal%10;
end


endmodule
