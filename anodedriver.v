`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2019 12:33:29 PM
// Design Name: 
// Module Name: anodedriver
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


module anodedriver(
    input clk,
    input clk_en,
    input reset,
    output reg [0:3] an,
    output wire [1:0] s
    );
    
    counter counter(.clk(clk), .clk_en(clk_en), .reset(reset), .q(s));
    
    always @(*)
    begin
        case (s[1:0])
          0 : an = 4'b1110;
          1 : an = 4'b1101;
          2 : an = 4'b1011;
          3 : an = 4'b0111;
        endcase
    end
endmodule