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
//    input [7:0] a,
//    input [7:0] b,

    input x,
    output [7:0] display1,
    output [0:6] ca,
    output [0:3] an
    );
    
//    wire [15:0] display1;
    wire[7:0] a = {~x,x,x,x,x,x,x,x};
    wire[7:0] b = {x,x,x,x,x,x,x,~x};
    wire clr_delay = ~x;
    
    fpadder fpa(
        clk,
        clr_delay,
//        start,
        1,
//        show_sum,
        1,
        a,
        b,
        display1
    );
    
    display d(
        clk,
        clr,
//        display1[15:12],
//        display1[11:8],
0,0,
        display1[7:4],
        display1[3:0],
        an,
        ca
     );  
endmodule
