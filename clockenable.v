`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2019 12:42:59 AM
// Design Name: 
// Module Name: clockenable
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


module clockenable(
    input clk,
    input reset,
    output reg clk_en
    );
    integer count = 0;
    always @(posedge clk or posedge reset)
        begin
        if(reset == 1)
            begin
                count <= 0;
            end
        else if(count == 99999) //500Hz clk_en 99999
            begin
                count <= 0;
                clk_en <= 1;
            end
        else if(count != 99999)
            begin
                count <= count + 1;
                clk_en <= 0;
            end
        end
endmodule
