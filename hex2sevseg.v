`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2019 12:10:18 PM
// Design Name: 
// Module Name: crying
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


module hex2sevseg(
    input [3:0] x,
    output reg [0:6] ca
    );
    
    always @(*)
    begin
        case (x[3:0])
          0 : ca = 7'b0000001;
          1 : ca = 7'b1001111;
          2 : ca = 7'b0010010;
          3 : ca = 7'b0000110;
          4 : ca = 7'b1001100;
          5 : ca = 7'b0100100;
          6 : ca = 7'b0100000;
          7 : ca = 7'b0001111;
          8 : ca = 7'b0000000;
          9 : ca = 7'b0000100;
          10 : ca = 7'b0001000;
          11 : ca = 7'b1100000;
          12 : ca = 7'b0110001;
          13 : ca = 7'b1000010;
          14 : ca = 7'b0110000;
          15 : ca = 7'b0111000;
          
        endcase
    end
endmodule