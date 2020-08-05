`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 19:54:29
// Design Name: 
// Module Name: rx_testbench
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


module rx_testbench();
    //input
    reg rxd;
    reg clk;
    //reg rst;
    //output
    wire receive_ack;
    wire [7:0]data_i;
    wire LED;
    //wire [4:0]count;
uart_rx uart_rx(
    .rxd(rxd),
    .clk(clk),
    .receive_ack(receive_ack),
    .data_i(data_i),
    .LED(LED)
   //.count(count)
);

initial 
begin
    #0   
    clk=0;
    rxd=1;
 
    #15
    rxd=0;//0011100100
    #20
    rxd=1;
    #30
    rxd=0;
    #20
    rxd=1;
    #10
    rxd=0;
    #20
    rxd=1;
    #50
    rxd=0;//0111111110
    #10
    rxd=1;
    #80
    rxd=0;
    #10
    rxd=1;
    #50
    rxd=0;//0001100110
    #30
    rxd=1;
    #20
    rxd=0;
    #20
    rxd=1;
    #20
    rxd=0;
    #10
    rxd=1;
    #50
    rxd=0;//0100010000  
    #10
    rxd=1;
    #10
    rxd=0;
    #30
    rxd=1;
    #10
    rxd=0;
    #40
    rxd=1;
 end
 always #5 clk = !clk;
endmodule
