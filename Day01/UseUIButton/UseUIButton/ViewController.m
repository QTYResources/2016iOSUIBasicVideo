//
//  ViewController.m
//  UseUIButton
//
//  Created by QinTuanye on 2019/2/9.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)up;
- (IBAction)down:(id)sender;
- (IBAction)left;
- (IBAction)right;

- (IBAction)big;
- (IBAction)small;

@property (weak, nonatomic) IBOutlet UIButton *btnIcon;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)up {
    // 获取按钮的y坐标的值，让y的值递减，然后再把新的值赋值给按钮的y
    // 获取头像按钮的坐标
    // 获取按钮原始的frame值（这个frame中就包含了按钮的大小和坐标）
    CGRect originFrame = self.btnIcon.frame;
    // 设置y值-10
    originFrame.origin.y -= 10;
    
    // 把新的frame再赋值给按钮
    self.btnIcon.frame = originFrame;
    
    NSLog(@"上");
}

- (IBAction)down:(id)sender {
    // 1. 获取原始的frame值
    CGRect originFrame = self.btnIcon.frame;
    
    // 2. 修改Frame
    originFrame.origin.y += 10;
    
    // 3. 重新把frame赋值给按钮
    self.btnIcon.frame = originFrame;
    NSLog(@"下");
}

- (IBAction)left {
    // 1. 获取原始的frame
    CGRect originFrame = self.btnIcon.frame;
    
    // 2. 修改frame
    originFrame.origin.x -= 10;
    
    // 3. 重新赋值frame
    self.btnIcon.frame = originFrame;
    NSLog(@"左");
}

- (IBAction)right {
    // 1. 获取原始的frame
    CGRect originFrame = self.btnIcon.frame;
    
    // 2. 修改frame
    originFrame.origin.x += 10;
    
    // 3. 重新赋值frame
    self.btnIcon.frame = originFrame;
    
    // 错误的写法！！！！
//    self.btnIcon.frame.origin.x += 10;
    NSLog(@"右");
}

// 放大
- (IBAction)big {
//    NSLog(@"bigger");
    
    // 获取原始的frame
    CGRect originFrame = self.btnIcon.frame;
    
    // 修改frame
    // originFrame.size.width += 10;
    // originFrame.size.height += 10;
    
    originFrame.size = CGSizeMake(originFrame.size.width + 10, originFrame.size.height + 10);
    
    // 重新赋值
    self.btnIcon.frame = originFrame;
}

// 缩小
- (IBAction)small {
    // 获取原始的frame
    CGRect originFrame = self.btnIcon.frame;
    
    // 修改frame
    originFrame.size.width -= 10;
    originFrame.size.height -= 10;
    
    // 重新赋值
    self.btnIcon.frame = originFrame;
    
//    NSLog(@"Smaller");
}
@end
