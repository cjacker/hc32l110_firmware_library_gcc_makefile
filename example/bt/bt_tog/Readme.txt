================================================================================
                                样例使用说明
================================================================================
版本历史 
日期        版本    负责人         IAR     MDK   描述
2016-07-19  0.1     LUX          7.70    5.16a  first version
================================================================================
功能描述
================================================================================
本样例主要展示Base Timer的翻转输出功能。
说明：
本样例展示翻转输出功能，可输出两路相位相反的波形，该功能可用于驱动Buzzer。

================================================================================
测试环境
================================================================================
测试用板:
---------------------
HC32L110_STK

辅助工具:
---------------------
双通道示波器

辅助软件:
---------------------
无。

================================================================================
使用步骤
================================================================================
1）打开工程并重新编译；
2）启动IDE的下载和调试功能；
3）连接示波器探头到P14和P15；
4）运行，观察波形输出（两路相位相反的方波，输出一段时间后停止）;
5）程序到while(1);处停止，此时也可观察"u8TestFlag"的值，若为'0'则翻转输出功能测试正常。

================================================================================
注意
================================================================================
测量时，需要直接测量芯片的引脚（如果Demo板未将该Pin连接至GPIO排针上）

================================================================================
