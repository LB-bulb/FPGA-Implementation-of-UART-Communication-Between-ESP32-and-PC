`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 16:25:04
// Design Name: 
// Module Name: uart_rx
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


module uart_rx(
    input rxd,
    input clk,
    //input rst,
    output receive_ack,
    output reg [7:0]data_i,
    output reg LED
   // output reg [4:0]count
    );
    localparam IDLE=0,
    RECEIVE=1,
    RECEIVE_END=2;
    reg [3:0]cur_st,nxt_st;
//状态机变量
    reg [4:0]count;
    reg [8:0]data_o_tmp;
    reg [7:0]data_mark=8'b11111111;
always@ (posedge clk)
    cur_st<= nxt_st;
always@( * )
  begin
    nxt_st= cur_st;
    case(cur_st)
    IDLE: if(!rxd) 
            nxt_st = RECEIVE;//接收到开始信号,开始接收数据
    RECEIVE: if(count==8) nxt_st= RECEIVE_END; //八位数据接收计数
    RECEIVE_END: nxt_st = IDLE;//接收完成
    default: nxt_st = IDLE;
 endcase
end
always@ (posedge clk)
if(cur_st == RECEIVE)
count<= count + 1;
//接收数据计数
else if(cur_st == IDLE|cur_st == RECEIVE_END)
count<= 0;

always@ (posedge clk)
    if(cur_st == RECEIVE)//从高到低发送数据
begin
     data_o_tmp[7:0]<= data_o_tmp[8:1];
     data_o_tmp[8]<= rxd;
end     
   else if(cur_st == RECEIVE_END)
     data_i[7:0]<=data_o_tmp[7:0];


always@ (posedge clk)
    if(count==8)//检测到D5数据红灯亮起
begin
    if(data_i==data_mark)
        LED<=1;
    else
       LED<=0;
end

assign receive_ack= (cur_st == RECEIVE_END)?1:0; //接收 完成时回复信号

endmodule
