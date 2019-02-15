//
//  ViewController.m
//  PictureViewer
//
//  Created by QinTuanye on 2019/2/15.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *pic;
// 自己写一个索引，来控制当前显示的是第几张图片
// 这个属性一开始没有赋值就是0
@property (nonatomic, assign) int index;

@property (weak, nonatomic) IBOutlet UILabel *lblIndex;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIButton *btnPre;

- (IBAction)pre;
- (IBAction)next;

@end

@implementation ViewController

// 重写pic属性的get方法
// --------懒加载数据--------
- (NSArray *)pic {
    if (_pic == nil) {
        // 写代码加载pic.plist文件中的数据到_pic
        // 1. 获取pic.plist文件的路径
        // 获取pic.plist文件的路径赋值给path变量
        // [NSBundle mainBundle]表示获取这个app安装到手机上时的根目录
        // 然后在app的安装的根目录下搜索pic.plist文件的路径
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"pic.plist" ofType:nil];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"pic" ofType:@"plist"];
        // 读取文件
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _pic = array;
    }
    return _pic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = 0;
    NSDictionary *dict = self.pic[self.index];
    self.lblIndex.text = [NSString stringWithFormat:@"%d/%lu", self.index + 1, self.pic.count];
    self.imgViewIcon.image = [UIImage imageNamed:dict[@"icon"]];
    self.lblTitle.text = dict[@"title"];
    self.btnPre.enabled = NO;
    self.btnNext.enabled = YES;
}

// 下一张图片
- (IBAction)pre {
    // 1. 让索引--
    self.index--;
    
    // 2. 从数组中获取当前这张图片的数据
    NSDictionary *dict = self.pic[self.index];
    
    // 3. 把获取到的数据设置给界面上的控件
    self.lblIndex.text = [NSString stringWithFormat:@"%d/%lu", self.index + 1, self.pic.count];
    
    // 通过image属性来设置图片框里面的图片
    self.imgViewIcon.image = [UIImage imageNamed:dict[@"icon"]];
    
    // 设置这张图片的标题
    self.lblTitle.text = dict[@"title"];
    
    // 设置“下一张”按钮是否可点击
//    self.btnNext.enabled = self.index != (self.pic.count - 1));
//
//    if (self.index == (self.pic.count - 1)) {
//        self.btnNext.enabled = NO;
//    } else {
//        self.btnNext.enabled = YES;
//    }
    
    self.btnPre.enabled = (self.index != 0);
    self.btnNext.enabled = (self.index != (self.pic.count - 1));
}

// 显示上一张
- (IBAction)next {
    // 1. 让索引++
    self.index++;
    
    // 2. 从数组中获取当前这张图片的数据
    NSDictionary *dict = self.pic[self.index];
    
    // 3. 把获取到的数据设置给界面上的控件
    self.lblIndex.text = [NSString stringWithFormat:@"%d/%lu", self.index + 1, self.pic.count];
    
    // 通过image属性来设置给界面上的控件
    self.imgViewIcon.image = [UIImage imageNamed:dict[@"icon"]];
    
    // 设置这张图片的标题
    self.lblTitle.text = dict[@"title"];
//
//    if (self.index == 0) {
//        self.btnPre.enabled = NO;
//    } else {
//        self.btnPre.enabled = YES;
//    }
    
    self.btnPre.enabled = (self.index != 0);
    self.btnNext.enabled = (self.index != (self.pic.count - 1));
}
@end
