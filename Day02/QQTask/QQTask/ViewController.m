//
//  ViewController.m
//  QQTask
//
//  Created by QinTuanye on 2019/2/15.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)login;
@property (weak, nonatomic) IBOutlet UITextField *txtQQ;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)login {
    NSString *qq = self.txtQQ.text;
    NSString *pwd = self.txtPassword.text;
    
    NSLog(@"QQ: %@, 密码: %@", qq, pwd);
    
    [self.view endEditing:YES];
}
@end
