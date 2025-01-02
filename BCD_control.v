`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2023 09:37:09 PM
// Design Name: 
// Module Name: BCD_control

// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BCD_control(
    input [3:0] digit1,
    input [3:0] digit2,
    input [3:0] digit3,
    input [3:0] digit4,
    input [3:0] digit5,
    input [3:0] digit6,
    
    input [2:0]Digit_Display,
    output reg[3:0] Output_Display, //  choose which to display ( make sure each cycle only one digit display)
    output reg [7:0] anode = 0
    //output reg [7:0] cathode
    );
    
    always@(Digit_Display)
        begin
            case(Digit_Display)
                3'b000:
                    begin
                    Output_Display = digit1; // display digit1 value 
                    anode = 8'b11101111; // Right most digit on (Digit 1)
                    end
                3'b001:
                    begin
                    Output_Display = digit2; // display digit2 value
                    anode = 8'b11011111; //Digit 2 display
                    end
                3'b010:
                    begin
                    Output_Display = digit3; // display digit3 value
                    anode = 8'b10111111; // digit 3 display
                    end
                3'b011:
                    begin
                    Output_Display = digit4; // display digit4 value
                    anode = 8'b01111111; //  digit 4 display
                    end
                 3'b100:
                    begin
                    Output_Display = digit5; // display digit4 value
                    anode = 8'b11111110; //  digit 5 display
                    end
                 3'b101:
                    begin
                    Output_Display = digit6; // display digit4 value
                    anode = 8'b11111101; //  digit 6 display
                    end
                 3'b110:
                    anode = 8'b11111111;
                 3'b111:
                    anode = 8'b11111111;
                    
            endcase
        //BCD_To_7seg BCD(.Display(Display),.anode(anode),.cathode(cathode));
        end
        
        

endmodule
