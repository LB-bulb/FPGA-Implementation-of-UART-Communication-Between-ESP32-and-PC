`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 18:09:54
// Design Name: 
// Module Name: tx_testbench
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


module tx_testbench();
 //input
 reg [7:0]data_o;
 reg clk;
 reg receive_ack;
 //output
 wire txd;
 wire LEDmind;
 
 uart_tx uarttx(
    .data_o(data_o),
    .txd(txd),
    .clk(clk),
    .receive_ack(receive_ack),
    .LEDmind(LEDmind)
);

initial begin
    #0   
    clk=0;
    data_o=0;
    receive_ack=0;
    #50
    data_o='b11111111;
    #100
    receive_ack=1;
    #10
    receive_ack=0;
    #110
    data_o='b10001100;
    #40
    receive_ack=1;
    #10
    receive_ack=0;
    #110
    data_o='b11101101;
    #40
    receive_ack=1;
    #10
    receive_ack=0;
    #110
    data_o='b00001101;
    #40
    receive_ack=1;
    #10
    receive_ack=0;
    end
always #5 clk = !clk;
endmodule
