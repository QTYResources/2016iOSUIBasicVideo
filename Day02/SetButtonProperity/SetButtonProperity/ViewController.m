//
//  ViewController.m
//  SetButtonProperity
//
//  Created by QinTuanye on 2019/2/21.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *img = [UIImage imageNamed:@"coin"];
    UIImage *img1 = [UIImage imageNamed:@"btn_left_highlight"];
    [self sayHi];
}

/**
 * 这个是文档注释
 * 当前方法是一个打招呼的sayHi方法
 */
- (void)sayHi {
    NSLog(@"Hi!~~~~~~ 大家好。。。。");
}

@end
