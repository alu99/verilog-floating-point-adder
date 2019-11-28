`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2019 12:41:27 PM
// Design Name: 
// Module Name: counter2bit
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


module counter(
    input clk,
    input clk_en,
    input reset,
    output reg [1:0] q = 0
    );

    always @(posedge clk_en or posedge reset)
    begin
      if (reset == 1)
        q <= 0;
      else if(clk_en == 1 && clk == 1)
        q <= q + 1;
    end
endmodule
