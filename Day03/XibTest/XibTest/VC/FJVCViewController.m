//
//  FJVCViewController.m
//  xibtest
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "FJVCViewController.h"
#import "FJView.h"

@interface FJVCViewController ()

@end

@implementation FJVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    FJView *view = [FJView headView];
    
    NSLog(@"%@",view);
    
    self.view = view;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
