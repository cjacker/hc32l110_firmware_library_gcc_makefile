================================================================================
                                样例使用说明
================================================================================
版本历史 
日期        版本    负责人         IAR     MDK   描述
2016-07-20  0.1     LUX          7.70    5.16a  first version
================================================================================
功能描述
================================================================================
本样例主要展示PCA的WDT功能。
说明：
本样例展示PCA的WDT功能，在达到定时值时如果没有及时设定比较值（喂狗），则发生系统复位；
反之则系统正常运行。

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
3）在"main()"第一行设置断点；
3）运行，到断点处停止，继续运行，则再次复位运行至断点处；
4）修改"PcaWdtTest()"函数中的‘while(0)’为'while(1)'，保持喂狗；
5）重复1-3步骤，则程序不发生复位（不会再次运行至断点处）。
================================================================================
注意
================================================================================

================================================================================
