`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2023 10:11:20 PM
// Design Name: 
// Module Name: Digital_Clock
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


module Digital_Clock(
    input clk,
    input en,
    input reset,
    input HourP, // increase hour
    input minuteP, // increase minute
    output [3:0] s1, //first digit of second // BCD can only take 4 bit input
    output [3:0] s2, // second digit of second
    output [3:0] m1, // first digit of minute
    output [3:0] m2, // second digti of munite
    output [3:0] h1,  // first digit of hour
    output [3:0] h2  // second digit of hour
    

    );
    // since second and minute can go from 0- 60 so we need 6 bit(64 value) 
    reg [5:0] hour = 0 , minute = 0 , second  = 0;
    
    integer clock = 0;
    always@(posedge clk)
    begin
        if (reset == 1) // if reset 
        {hour,minute,second} <= 0;
    
        else if (HourP ==1)
            begin // begin else if hours
                if(hour ==23) // when hour reach 23, it go back to 0
                    hour<= 0;
                else 
                    hour = hour+1;
            end // end else if hour
        
        else if(minuteP == 1)
            begin 
                if (minute == 59) // when minute reach 59 , go back to 0
                    minute<=0;
                else// increase minute
                    minute =  minute +1;
            end
       
        else if (en == 1) // if the clock is turn on 
        //start counting 
     
            if ( clock == 11) // 
                begin //(1)
                    clock <= 0;
                    if (second == 59)
                        begin// begin off second (2)
                        second<=0;
                        if (minute == 59)
                            begin//(3) begin of minute loop
                                minute <= 0;
                                if (hour ==23)
                                    hour<=0;
                                else // if hour is not 23, increase
                                    hour = hour +1;
                            end //(3) end loop contain hours
                        else // if minute is not 59, increase
                            minute = minute +1;
                    end //(3)end loop contain minute 
            else // (2)if second is not 59, increase by one
            second = second +1;
         end// end(1) 
        else
        clock = clock +1;
                
     end
         
     Binary_to_BCD secs(.clk(clk),.signal(second),.hundred(),.tens(s1),.ones(s2));
     Binary_to_BCD mins(.clk(clk),.signal(minute),.hundred(),.tens(m1),.ones(m2));
     Binary_to_BCD hours(.clk(clk),.signal(hour),.hundred(),.tens(h1),.ones(h2));
     
endmodule
