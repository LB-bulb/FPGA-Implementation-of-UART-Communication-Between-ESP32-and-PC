`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 16:16:30
// Design Name: 
// Module Name: uart_top
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


module uart_top(
    output txd,
    input rxd,
    input clk,
    output LEDmind,
    output LED
);
    wire clk_9600; 
    wire receive_ack; 
    wire [7:0]data;
//���ڷ���ģ��
uart_tx uart_tx(
    .clk(clk_9600),
    .txd(txd),
    //.rst(1),
    .data_o(data), 
    .receive_ack(receive_ack),
    .LEDmind(LEDmind)
);
//���ڽ���ģ��
uart_rx uart_rx(
    .clk(clk_9600),
    .rxd(rxd),
    .data_i(data),
    .receive_ack( receive_ack),
    .LED(LED)
);
//ʱ��ģ��
clk_div clk_div(
.clk(clk),
.clk_out(clk_9600)
);

endmodule
