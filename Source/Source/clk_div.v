`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 16:41:54
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input clk,
    output reg clk_out
    );
    localparam Baud_Rate = 9600;//波特率
    localparam div_num= 'd100_000_000/Baud_Rate;//分频数为时钟速率除以波特率
    reg [15:0]num;
always@ (posedge clk)
    if(num== div_num) 
    begin
        num<=0;
        clk_out<= 1;
    end
    else begin
        num<=num+ 1;
        clk_out<=0;
    end

endmodule
