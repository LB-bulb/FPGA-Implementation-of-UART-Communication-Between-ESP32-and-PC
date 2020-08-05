# FPGA-Implementation-of-UART-Communication-Between-ESP32-and-PC
FPGA Implementation of UART Communication Between ESP32 and PC

开发者：  卢一凡   李启轩

1.项目简介
本次设计为实现多路UART通讯，由于本小组为线上工作所以没有多个ESP32开发板，和USB接口，故本小组完成ESP32与电脑的UART通讯，并且PC端通过串口发送特定字符时，实现红色LED点亮。当发送完成一个字节时，也点亮绿色LED表示通讯正常。另外，本项目也在每发送8个数据时使用了偶校验，以保证发送数据的质量。
    另外，为了测试ESP32接收到数据的正确性，我们的演示的实验内容是将PC端发送的数据再传回给电脑，形成一个回环，以测试整个程序的正确性。

2.使用工具
   使用vivado2018.3
   Arduino辅助下载
   和一个PC端的串口通信工具（使用的是友善串口通讯工具）
   vivado中选择的板子型号为xc7s15ftgb196-1
   使用的板子为Sea_Board开发板
       
3.文件介绍
  文件中包含ExecutableFiles文件夹，存放可以烧录至ESP32开发板的bit流文件
  Source文件夹存放利用vivado建立的原工程代码
  images文件夹存放下载到板子的实验结果与两个子部分（接收器与发送器）的仿真
