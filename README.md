# TestinData-iOS-Demo 说明

##文件结构
iOS_Demo 工程名  
┗━━━━ TestinDataAnalysis (TestinSDK)  
┗━━━━ AppDelegate (SDK初始化页面)  
┗━━━━ ViewController (实验按钮修改界面)  

##集成步骤

```AppDelegate.m```中进行集成

* 1.导入头文件  

```#import <TestinDataAnalysis/TestinDataAnalysis.h>```

* 2.开启调试小助手(上线时务必去除此方法)  

```[TestinDataAnalysis setDebugTouchAssist:YES];```

* 3.初始化SDK  

```[TestinDataAnalysis initWithAppkey:@"App Key" launchOptions:launchOptions];```

__集成SDK完毕__

---

##编写实现相关逻辑

实验界面进行，以```ViewController.m```为例.

* 1.导入头文件  

```#import <TestinDataAnalysis/TestinDataAnalysis.h>```

* 2.获取实验变量

```
[TestinDataAnalysis getExperimentVariable:@"变量名" defaultValue:@"默认值"];
```

```
NSString *buttonColorString = [TestinDataAnalysis getExperimentVariable:@"button_color" defaultValue:@"red"];
if ([buttonColorString isEqualToString:@"red"]) {   //如果分配到红色版本
	button.backgroundColor = [UIColor redColor];
} else {                                            //如果分配到绿色版本
	button.backgroundColor = [UIColor greenColor];
}

```

* 3.埋点

```[TestinDataAnalysis tracker:@"指标名称"];```

```
[TestinDataAnalysis tracker:@"button_click"];
```

__实验相关逻辑编写完毕__

---
