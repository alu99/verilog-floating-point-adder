`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2019 12:41:35 AM
// Design Name: 
// Module Name: display
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


module display(
    input clk,
    input reset,
    input [3:0] dig1,
    input [3:0] dig2,
    input [3:0] dig3,
    input [3:0] dig4,
    output [0:3] an,
    output [0:6] ca
    );
    reg [3:0] dig;
    wire clk_en;
    wire [1:0] s;
    clockenable clken(.clk(clk), .reset(reset), .clk_en(clk_en));
    anodedriver driver(.clk(clk), .clk_en(clk_en), .reset(reset), .an(an), .s(s));
    
    always @(*)
    begin
        case (s[1:0])
          0 : dig = dig1;
          1 : dig = dig2;
          2 : dig = dig3;
          3 : dig = dig4;
        endcase
    end
    hex2sevseg h(dig, ca);
endmodule
