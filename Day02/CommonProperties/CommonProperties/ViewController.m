//
//  ViewController.m
//  CommonProperties
//
//  Created by QinTuanye on 2019/2/15.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)show:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txt1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)show:(id)sender {
    // 获取当前控制器所管理的view下的所有子控件
    
    // subviews表示获取某个控件的所有子控件
//    for (UIView *view in self.view.subviews) {
//        view.backgroundColor = [UIColor redColor];
//    }
//
//    self.txt1.superview.backgroundColor = [UIColor yellowColor];
    
    // 根据tag来ag获取某个控件
    UITextField *txt = (UITextField *)[self.view viewWithTag:1000];
    
    txt.text = @"传智播客";
    
    while (self.view.subviews.firstObject) {
        [self.view.subviews.firstObject removeFromSuperview];
    }
    
//    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}
@end
