================================================================================
                                样例使用说明
================================================================================
版本历史 
日期        版本    负责人         IAR     MDK   描述
2016-07-20  0.1     LUX          7.70    5.16a  first version
================================================================================
功能描述
================================================================================
本样例主要展示PCA的比较计数功能。
说明：
本样例对展示PCA的比较计数功能，当计数值达到设定的比较值时，产生中断，停止计数。

================================================================================
测试环境
================================================================================
测试用板:
---------------------
HC32L110_STK

辅助工具:
---------------------
无

辅助软件:
---------------------
无。

================================================================================
使用步骤
================================================================================
1）打开工程并重新编译；
2）启动IDE的下载和调试功能；
3）在main函数while(1)处设置断点；
4）运行；
5）程序到断点处停止，此时观察"u8TestFlag"的值，若为'0'则功能正常。

================================================================================
注意
================================================================================

================================================================================
