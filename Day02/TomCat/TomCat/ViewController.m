//
//  ViewController.m
//  TomCat
//
//  Created by QinTuanye on 2019/2/15.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgViewCat;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// 喝牛奶
- (IBAction)drink {
    // 0. 动态加载图片到一个NSArray中
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 81; i++) {
        // 拼接图片名称
        NSString *imgName = [NSString stringWithFormat:@"drink_%02d.jpg", i];
        
        // 根据图片名称加载图片
        UIImage *imgCat = [UIImage imageNamed:imgName];
        
        // 把图片加载到数组中
        [arrayM addObject:imgCat];
    }
    
    // 1. 设置UIImageView（图片框）r的animationImages属性，这个属性中包含的就是所有z哪些要执行动画的图片
    self.imgViewCat.animationImages = arrayM;
    
    // 2. 设置动画持续时间
    self.imgViewCat.animationDuration = 3;
    
    // 3. 设置动画是否需要重复播放
    self.imgViewCat.animationRepeatCount = 1;
    
    // 4. 开启动画
    [self.imgViewCat startAnimating];
}

// 放屁
- (IBAction)fart {
    // 1. 把图片加载到数组中
    // 0. 动态加载图片到一个NSArray中
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 28; i++) {
        // 拼接图片名称
        NSString *imgName = [NSString stringWithFormat:@"fart_%02d.jpg", i];
        
        // 根据图片名称加载图片
        UIImage *imgCat = [UIImage imageNamed:imgName];
        
        // 把图片加载到数组中
        [arrayM addObject:imgCat];
    }
    
    // 2. 设置UIImageView的animationImages属性为对应的图片集合
    self.imgViewCat.animationImages = arrayM;
    
    // 3. 动画持续时间
    self.imgViewCat.animationDuration = 3;
    
    // 4. 重复次数
    self.imgViewCat.animationRepeatCount = 1;
    
    // 5. 启动动画
    [self.imgViewCat startAnimating];
}

// 敲头
- (IBAction)knockout {
    // 1. 把图片加载到数组中
    // 0. 动态加载图片到一个NSArray中
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 81; i++) {
        // 拼接图片名称
        NSString *imgName = [NSString stringWithFormat:@"knockout_%02d.jpg", i];
        
        // 根据图片名称加载图片
        UIImage *imgCat = [UIImage imageNamed:imgName];
        
        // 把图片加载到数组中
        [arrayM addObject:imgCat];
    }
    
    // 2. 设置UIImageView的animationImages属性为对应的图片集合
    self.imgViewCat.animationImages = arrayM;
    
    // 3. 动画持续时间
    self.imgViewCat.animationDuration = 3;
    
    // 4. 重复次数
    self.imgViewCat.animationRepeatCount = 1;
    
    // 5. 启动动画
    [self.imgViewCat startAnimating];
}

// 抓鸟
- (IBAction)eat {
    // 1. 把图片加载到数组中
    // 0. 动态加载图片到一个NSArray中
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 39; i++) {
        // 拼接图片名称
        NSString *imgName = [NSString stringWithFormat:@"eat_%02d.jpg", i];
        
        // 根据图片名称加载图片
        UIImage *imgCat = [UIImage imageNamed:imgName];
        
        // 把图片加载到数组中
        [arrayM addObject:imgCat];
    }
    
    // 2. 设置UIImageView的animationImages属性为对应的图片集合
    self.imgViewCat.animationImages = arrayM;
    
    // 3. 动画持续时间
    self.imgViewCat.animationDuration = 3;
    
    // 4. 重复次数
    self.imgViewCat.animationRepeatCount = 1;
    
    // 5. 启动动画
    [self.imgViewCat startAnimating];
}

// 抓
- (IBAction)scratch {
    // 1. 把图片加载到数组中
    // 0. 动态加载图片到一个NSArray中
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 55; i++) {
        // 拼接图片名称
        NSString *imgName = [NSString stringWithFormat:@"scratch_%02d.jpg", i];
        
        // 根据图片名称加载图片
        UIImage *imgCat = [UIImage imageNamed:imgName];
        
        // 把图片加载到数组中
        [arrayM addObject:imgCat];
    }
    
    // 2. 设置UIImageView的animationImages属性为对应的图片集合
    self.imgViewCat.animationImages = arrayM;
    
    // 3. 动画持续时间
    self.imgViewCat.animationDuration = 3;
    
    // 4. 重复次数
    self.imgViewCat.animationRepeatCount = 1;
    
    // 5. 启动动画
    [self.imgViewCat startAnimating];
}

- (IBAction)pie {
    // 1. 把图片加载到数组中
    // 0. 动态加载图片到一个NSArray中
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 23; i++) {
        // 拼接图片名称
        NSString *imgName = [NSString stringWithFormat:@"pie_%02d.jpg", i];
        
        // 根据图片名称加载图片
        UIImage *imgCat = [UIImage imageNamed:imgName];
        
        // 把图片加载到数组中
        [arrayM addObject:imgCat];
    }
    
    // 2. 设置UIImageView的animationImages属性为对应的图片集合
    self.imgViewCat.animationImages = arrayM;
    
    // 3. 动画持续时间
    self.imgViewCat.animationDuration = 3;
    
    // 4. 重复次数
    self.imgViewCat.animationRepeatCount = 1;
    
    // 5. 启动动画
    [self.imgViewCat startAnimating];
}

- (IBAction)cymbal {
    // 1. 把图片加载到数组中
    // 0. 动态加载图片到一个NSArray中
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 12; i++) {
        // 拼接图片名称
        NSString *imgName = [NSString stringWithFormat:@"cymbal_%02d.jpg", i];
        
        // 根据图片名称加载图片
        UIImage *imgCat = [UIImage imageNamed:imgName];
        
        // 把图片加载到数组中
        [arrayM addObject:imgCat];
    }
    
    // 2. 设置UIImageView的animationImages属性为对应的图片集合
    self.imgViewCat.animationImages = arrayM;
    
    // 3. 动画持续时间
    self.imgViewCat.animationDuration = 3;
    
    // 4. 重复次数
    self.imgViewCat.animationRepeatCount = 1;
    
    // 5. 启动动画
    [self.imgViewCat startAnimating];
}

@end
