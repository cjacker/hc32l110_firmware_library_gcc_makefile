================================================================================
                                样例使用说明
================================================================================
版本历史 
日期        版本    负责人         IAR     MDK   描述
2017-06-20  0.1     Alex           7.70    5.16a first version
================================================================================
功能描述
================================================================================
本样例主要展示ADT正交编码位置计数功能，根据AIN和BIN的相位关系进行计数。
根据设定的不同，可以实现1倍计数、2倍计数、4倍计数。

说明：
    

================================================================================
测试环境
================================================================================
测试用板:
---------------------
HC32L110_STK

辅助工具:
---------------------
示波器
电源

辅助软件:
---------------------
无

================================================================================
使用步骤
================================================================================
1）连接P24与P34(IA1)，连接P25与P33(IB1)
2）打开工程编译并运行
3）读取串口输出计数值，并与L005 SPEC中图13-17位置模式时相位差计数动作设定(1倍)、
图13-18置模式时相位差计数动作设定(2倍)、图13-19位置模式时相位差计数
动作设定(4倍)中计数值比较



================================================================================
注意
================================================================================
调试串口的使用：
调试串口在系统时钟使用高速晶振时可用，PIN为P35. 波特率为19200， 8N1. 

================================================================================
