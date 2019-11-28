`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2019 12:27:11 PM
// Design Name: 
// Module Name: controller
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


module controller(
    input clk,
    input clr,
    input start,
    
    input [1:0] normalize,
    
    output reg en_mant_gt,
    output reg en_mant_ls,
    output reg en_mant_ans,
    output reg en_exp_gt,
    output reg en_exp_ls,
    output reg en_exp_ans,
    output reg en_sign_gt,
    output reg en_sign_ls,
    output reg en_sign_ans,
    output reg en_s,
    
    output reg ld_shift_mant_ls,
    output reg [1:0] ld_shift_mant_ans,
    
    output reg [1:0] ld_add_exp_ans
    );
    
    parameter start_state = 2'b00;
    parameter compare_state = 2'b01;
    parameter add_state = 2'b10;
    parameter normalize_state = 2'b11;
    
    reg [1:0] present_state = start_state;
    
    always @(negedge clk) begin
        if(clr == 1) begin
            present_state = start_state;
        end
        case(present_state)
            start_state: begin
                en_mant_gt = 1;
                en_mant_ls = 1;
                en_mant_ans = 0;
                en_exp_gt = 1;
                en_exp_ls = 1;
                en_exp_ans = 0;
                en_sign_gt = 1;
                en_sign_ls = 1;
                en_sign_ans = 0;
                en_s = 0;
                
                ld_shift_mant_ls = 0;
                
                if(start == 1) begin
                    present_state = compare_state;
                end
            end
            compare_state: begin
                en_mant_gt = 0;
                en_mant_ls = 1;
                en_mant_ans = 0;
                en_exp_gt = 0;
                en_exp_ls = 0;
                en_exp_ans = 1;
                en_sign_gt = 0;
                en_sign_ls = 0;
                en_sign_ans = 1;
                en_s = 0;
                
                ld_shift_mant_ls = 1;
                ld_add_exp_ans = 2'b00;
                
                present_state = add_state;
            end
            add_state: begin
                en_mant_gt = 0;
                en_mant_ls = 0;
                en_mant_ans = 1;
                en_exp_gt = 0;
                en_exp_ls = 0;
                en_exp_ans = 0;
                en_sign_gt = 0;
                en_sign_ls = 0;
                en_sign_ans = 0;
                en_s = 0;
                
                ld_shift_mant_ans = 2'b00;
                present_state = normalize_state;
            end
            normalize_state: begin
            
                en_mant_gt = 0;
                en_mant_ls = 0;
                en_mant_ans = 0;
                en_exp_gt = 0;
                en_exp_ls = 0;
                en_exp_ans = 0;
                en_sign_gt = 0;
                en_sign_ls = 0;
                en_sign_ans = 0;
                en_s = 0;
                
                if(normalize == 2'b00) begin
                    en_s = 1;
                end
                else if(normalize == 2'b10) begin
                    en_mant_ans = 1;
                    ld_shift_mant_ans = 2'b10;
                    en_exp_ans = 1;
                    ld_add_exp_ans = 2'b10;
                end
                else if(normalize == 2'b01) begin
                    en_mant_ans = 1;
                    ld_shift_mant_ans = 2'b01;
                    en_exp_ans = 1;
                    ld_add_exp_ans = 2'b01;
                end
            end
        endcase
    end
endmodule
