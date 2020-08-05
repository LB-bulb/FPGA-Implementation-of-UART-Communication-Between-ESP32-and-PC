`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 16:31:38
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
input [7:0]data_o,
output reg txd,
input clk,
//input rst,
input receive_ack,
output reg LEDmind
    );
    localparam IDLE= 0,
    SEND_START= 1,
    SEND_DATA= 2,
    SEND_CHECK=3,
    SEND_END= 4;
    reg [4:0]cur_st, nxt_st;
    reg [4:0]count;
    reg [7:0]data_o_tmp;
    reg even_bit=0;
    reg check_ack=1;
    
always@ (posedge clk)
    cur_st<= nxt_st;
always@( * )
begin
    nxt_st= cur_st;
        case(cur_st)
        IDLE:if(receive_ack) nxt_st = SEND_START;//�������ʱ��ʼ��������
        SEND_START: nxt_st = SEND_DATA;//������ʼλ
        SEND_DATA: if(count==7) nxt_st= SEND_CHECK;//���Ͱ�λ����
        SEND_CHECK: if(check_ack==1) nxt_st = SEND_END;//����У��λ
        SEND_END: if(receive_ack) nxt_st = SEND_START;//���ͽ���
        default: nxt_st= IDLE;
endcase
end
always@ (posedge clk)
    if(cur_st == SEND_DATA)
        count<=count+1;
    else if(cur_st== IDLE|cur_st == SEND_END|cur_st == SEND_CHECK)
        count<=0;
        
always@ (posedge clk)
    if(cur_st== SEND_START)
        data_o_tmp<= data_o;//���������ݵ������
    else if(cur_st==SEND_DATA)
        data_o_tmp[6:0]<=data_o_tmp[7:1]; //ÿ����һ λ���ݺ�data.��.tmp ����-һλ,������һ�����ݵķ���

always@ (posedge clk)
    if(cur_st == SEND_START)
        txd<=0;
    else if(cur_st == SEND_DATA)
        txd<=data_o_tmp[0];
//����ÿ�η��ͺ�����,����ÿ�η������λ
    else if(cur_st == SEND_CHECK)
        txd<=^data_o;
    else if(cur_st == SEND_END)
        txd<= 1;

always@ (posedge clk)
    if(count==7)
        check_ack<=1;
    else if(cur_st == SEND_END)
        check_ack<= 0;
    
always@ (posedge clk)
    if(cur_st == SEND_END)
        LEDmind<= 1;
    else 
        LEDmind<=0;
endmodule
