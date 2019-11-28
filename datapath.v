`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2019 11:28:33 AM
// Design Name: 
// Module Name: datapath
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


module datapath(
    input clk,
    input [7:0] a,
    input [7:0] b,
    
    input en_mant_gt,
    input en_mant_ls,
    input en_mant_ans,
    input en_exp_gt,
    input en_exp_ls,
    input en_exp_ans,
    input en_sign_gt,
    input en_sign_ls,
    input en_sign_ans,
    input en_s,
    
    input ld_shift_mant_ls,
    input [1:0] ld_shift_mant_ans,
    
    input [1:0] ld_add_exp_ans,
    
    output reg [1:0] normalize,
    output reg [7:0] s
    );
    
    reg sign_gt, sign_ls, sign_ans;
    reg [3:0] exp_gt, exp_ls, exp_ans;
    reg [4:0] mant_gt, mant_ls, mant_ans;
    
    //mant_gt
    always @(posedge clk) begin
        if(en_mant_gt == 1) begin
            mant_gt = {0,1,a[6:0] > b[6:0] ? a[2:0] : b[2:0]};
        end
    end
    
    //mant_ls
    always @(posedge clk) begin
        if(en_mant_ls == 1) begin
            if(ld_shift_mant_ls == 0) begin
                mant_ls = {0,1,a[6:0] < b[6:0] ? a[2:0] : b[2:0]};
            end
            else begin
                if(mant_ls[0] == 0)
                    mant_ls = mant_ls >> (exp_gt - exp_ls);
                else begin
                    mant_ls = mant_ls >> (exp_gt - exp_ls);
                    mant_ls = mant_ls + 1;
                end
            end
        end
    end
    
    //mant_ans
    always @(posedge clk) begin
        if(en_mant_ans == 1) begin
            if(ld_shift_mant_ans == 2'b00) begin
                if(sign_gt == sign_ls)
                    mant_ans = mant_gt + mant_ls;
                else
                    mant_ans = mant_gt - mant_ls;
            end
            else if(ld_shift_mant_ans == 2'b01) begin
                if(mant_ans[1] == 1 && mant_ans[0] == 1) begin
                    mant_ans = mant_ans >> 1;
                    mant_ans = mant_ans + 1;
                end
                else begin
                    mant_ans = mant_ans >> 1;
                end
            end
            else if(ld_shift_mant_ans == 2'b10) begin
                mant_ans = mant_ans << 1;
            end
        end
        
        if(mant_ans[4] == 0 && mant_ans[3] == 1) begin
            normalize = 2'b00;
        end
        
        //normalize left
        else if(mant_ans[4] == 0 && mant_ans[3] == 0) begin
            normalize = 2'b10;
        end
        
        else if(mant_ans[4] == 1) begin
            normalize = 2'b01;
        end
    end
    
    //exp_gt
    always @(posedge clk) begin
        if(en_exp_gt == 1) begin
            exp_gt = a[6:0] > b[6:0] ? a[6:3] : b[6:3];
        end
    end
    
    //exp_ls
    always @(posedge clk) begin
        if(en_exp_ls == 1) begin
            exp_ls = a[6:0] < b[6:0] ? a[6:3] : b[6:3];
        end
    end
    
    //exp_ans
    always @(posedge clk) begin
        if(en_exp_ans == 1) begin
            if(ld_add_exp_ans == 2'b00) begin
                exp_ans = exp_gt;
            end
            else if(ld_add_exp_ans == 2'b01) begin
                exp_ans = exp_ans + 1;
            end
            else if(ld_add_exp_ans == 2'b10) begin
                exp_ans = exp_ans - 1;
            end
        end
    end
    
    //sign_gt
    always @(posedge clk) begin
        if(en_sign_gt == 1) begin
            sign_gt = a[6:0] > b[6:0] ? a[7] : b[7];
        end
    end
    
    //sign_ls
    always @(posedge clk) begin
        if(en_sign_ls == 1) begin
            sign_ls = a[6:0] < b[6:0] ? a[7] : b[7];
        end
    end
    
    //sign_ans
    always @(posedge clk) begin
        if(en_sign_ans == 1) begin
            sign_ans = sign_gt;
        end
    end
    
    //s
    always @(posedge clk) begin
        if(en_s == 1) begin
            s = {sign_ans, exp_ans, mant_ans[2:0]};
        end
    end
endmodule
