================================================================================
                                样例使用说明
================================================================================
版本历史 
日期        版本    负责人         IAR     MDK   描述
2019-09-12  0.2     Husj           7.70    5.16a first version
================================================================================
功能描述
================================================================================
本样例主要展示ADC 单次采样示例，使用中断方式获取ADC运行状态。
说明：
    在IAR的Livewatch或者KEIL的Watch窗口看到四个中断的标志位stcAdcIrqFlag，可知结果与设置的比较阈值相比，高于、低于还是在阈值内。

    用户根据实际需要，也可以在相应的比较结果中断内做处理。
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
1）ADC通道选择通道0，P24
2）配置ADC并编译和下载
3）在delay1ms（1000）处加断点
4）运行到断点处观察，



================================================================================
注意
================================================================================
1）内置电压跟随器使能可以采样外部高阻信号，但是BUFEN使能后，最高SPS采样速率 <= 200K

2）参考电压:内部2.5V(Vcc > 2.8V,SPS <= 200kHz)  

3）参考电压:内部1.5V(Vcc > 1.8V,SPS <= 200kHz)  

4）SPS速率 = ADC时钟 / (采样时钟 + 16CLK) 

================================================================================
