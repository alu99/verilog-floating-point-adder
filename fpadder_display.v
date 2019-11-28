`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2019 06:36:04 PM
// Design Name: 
// Module Name: fpadder_display
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


module fpadder_display(
    input clk,
    input clr,
    input start,
    input show_sum,
    input [7:0] a,
    input [7:0] b,

    output [7:0] display_out,
    output [0:6] ca,
    output [0:3] an
    );
    
    fpadder fpa(
        clk,
        clr,
        start,
        show_sum,
        a,
        b,
        display_out
    );
    
    display d(
        clk,
        clr,
        display_out[15:12],
        display_out[11:8],
        display_out[7:4],
        display_out[3:0],
        an,
        ca
     );  
endmodule
