`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2019 12:59:26 PM
// Design Name: 
// Module Name: fpadder
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


module fpadder(
    input clk,
    input clr,
    input start,
    input show_sum,
    input [7:0] a,
    input [7:0] b,
    output reg [15:0] display
    );
    
    wire [1:0] normalize, ld_shift_mant_ans, ld_add_exp_ans;
    wire [7:0] s; 
    wire en_mant_gt,
    en_mant_ls,
    en_mant_ans,
    en_exp_gt,
    en_exp_ls,
    en_exp_ans,
    en_sign_gt,
    en_sign_ls,
    en_sign_ans,
    en_s,
    ld_shift_mant_ls;
    
    controller c(
        //inputs
        clk,
        clr,
        start,
        normalize,
        
        //outputs
        en_mant_gt,
        en_mant_ls,
        en_mant_ans,
        en_exp_gt,
        en_exp_ls,
        en_exp_ans,
        en_sign_gt,
        en_sign_ls,
        en_sign_ans,
        en_s,
        ld_shift_mant_ls,
        ld_shift_mant_ans,
        ld_add_exp_ans
    );
    
    datapath d(
        //inputs
        clk,
        a,
        b,
        en_mant_gt,
        en_mant_ls,
        en_mant_ans,
        en_exp_gt,
        en_exp_ls,
        en_exp_ans,
        en_sign_gt,
        en_sign_ls,
        en_sign_ans,
        en_s,
        ld_shift_mant_ls,
        ld_shift_mant_ans,
        ld_add_exp_ans,
        
        //outputs
        normalize,
        s
    );
    
    always @(posedge clk) begin
        if(show_sum == 1) begin
            display = {8'b0, s};
        end
        else begin
            display = {a,b};
        end
    end
endmodule
