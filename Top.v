`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2023 10:46:42 PM
// Design Name: 
// Module Name: Top

// 
//////////////////////////////////////////////////////////////////////////////////


module Top(
    input wire clk,
    input en,reset,HourP,minuteP,
    output wire [7:0]cathode,
    output wire [7:0]AN 

    );
    
    wire [3:0]s1,s2,m1,m2,h1,h2;
    wire [2:0]DP;
    wire [3:0]display;
    wire New_clk;
    wire Time_clk;

    
   
Clock_div #(200) Clock_div(.clk(clk),.New_clk(New_clk));  // refesh clock
Clock_div #(4000000) Clock_couter(.clk(clk),.New_clk(Time_clk));   

// digital clock provide the value for hour and minute
Digital_Clock Digital_Clock(.clk(Time_clk),.en(en),.reset(reset),.HourP(HourP),.minuteP(minuteP),.s1(s1),.s2(s2),.m1(m1),.m2(m2),.h1(h1),.h2(h2));
//digit display go from 0-4 and assign which going to be display.
Digit_Display Digit_Display(.clock(New_clk),.Digit_Display(DP));
// bcd control will display the digit base on the DP select 
//BCD_control BCD_control(.digit1(h1),.digit2(h2),.digit3(m1),.digit4(m2),.Digit_Display(DP),.Output_Display(display),.anode(AN));
BCD_control BCD_control(.digit5(s2),.digit6(s1),.digit1(m2),.digit2(m1),.digit3(h2),.digit4(h1),.Digit_Display(DP),.Output_Display(display),.anode(AN));
//anode_control(.Digit_Display(DP),.anode (AN));

BCD_To_7seg bcd(.Display(display),.cathode(cathode));

    
    
endmodule
