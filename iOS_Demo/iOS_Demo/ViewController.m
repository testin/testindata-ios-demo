//
//  ViewController.m
//  iOS_Demo
//
//  Created by Andrew on 2017/9/21.
//  Copyright © 2017年 Andrew. All rights reserved.
//

#import "ViewController.h"
//STEP 1: 导入头文件
#import <TestinDataAnalysis/TestinDataAnalysis.h>

@interface ViewController ()
{
    NSUInteger clickNum;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    clickNum = 0;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:[NSString stringWithFormat:@"demo(%ld)",clickNum] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //STEP 2:根据变量名获取变量值
    NSString *buttonColorString = [TestinDataAnalysis getExperimentVariable:@"button_color" defaultValue:@"red"];
    if ([buttonColorString isEqualToString:@"red"]) {   //如果分配到红色版本
        button.backgroundColor = [UIColor redColor];
    } else {                                            //如果分配到绿色版本
        button.backgroundColor = [UIColor greenColor];
    }
}

- (void)click:(UIButton *)sender
{
    //STEP 3:埋点操作
    [TestinDataAnalysis tracker:@"button_click"];
    clickNum ++;
    [sender setTitle:[NSString stringWithFormat:@"demo(%ld)",clickNum] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
