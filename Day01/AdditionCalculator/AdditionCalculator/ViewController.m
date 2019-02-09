//
//  ViewController.m
//  AdditionCalculator
//
//  Created by QinTuanye on 2019/2/9.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)compute;

// 表示第一个文本框
@property (weak, nonatomic) IBOutlet UITextField *txtNum1;

// 第二个文本框
@property (weak, nonatomic) IBOutlet UITextField *txtNum2;

// 显示结果的Label
@property (weak, nonatomic) IBOutlet UILabel *lblResult;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// 点击计算按钮
- (IBAction)compute {
    // 实现计算功能
    // 1. 获取用户的输入
    NSString *num1 = self.txtNum1.text;
    NSString *num2 = self.txtNum2.text;
    
    int n1 = [num1 intValue];
    int n2 = [num2 intValue];
    
    // 2. 计算和
    int result = n1 + n2;
    
    // 3. 把结果显示到结果Label上
    self.lblResult.text = [NSString stringWithFormat:@"%d", result];
    
    // 4. 把键盘叫回去
    // 谁叫出的键盘，那么谁就是“第一响应者”，让“第一响应者”辞职，就可以把键盘叫回去。
    [self.txtNum1 resignFirstResponder];
    [self.txtNum2 resignFirstResponder];
    
    // 5. 把键盘叫回去的第二种f做法
    // self.view就表示是当前控制器所管理的那个View（每一个控制器都会管理一个View）
    // 这时把键盘叫回去的思路就是：让控制器所管理的View停止编辑，这样的话，凡是这个View中的子控件叫出的键盘就都回去了。
    [self.view endEditing:YES];
}
@end
