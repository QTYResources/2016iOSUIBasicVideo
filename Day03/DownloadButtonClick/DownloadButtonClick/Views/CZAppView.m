//
//  CZAppView.m
//  DownloadButtonClick
//
//  Created by QinTuanye on 2019/4/3.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "CZAppView.h"
#import "CZApp.h"

@interface CZAppView ()

@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIButton *btnDownload;

- (IBAction)btnDownloadClick:(UIButton *)sender;


@end

@implementation CZAppView

+ (instancetype)appView
{
    // 1. 通过xib创建每个应用(UIView)
    // 通过动态加载xib文件创建里面的view
    // 1.1> 找到应用的根目录
    NSBundle *rootBundle = [NSBundle mainBundle]; // //NSLog(@"%@", [mainBundle bundlePath]);
    // 1.2> 在应用程序根目录下取搜索对应的Xib(nib)文件
    return [[rootBundle loadNibNamed:@"CZAppView" owner:nil options:nil] lastObject];
}



// 重写model属性的set方法
- (void)setModel:(CZApp *)model
{
    // 先赋值
    _model = model;
    
    
    // 解析模型数据, 把模型数据赋值给UIView中的各个子控件
    self.imgViewIcon.image = [UIImage imageNamed:model.icon];
    self.lblName.text = model.name;
}



// 下载按钮的单击事件
- (IBAction)btnDownloadClick:(UIButton *)sender {
    // 1. 禁用当前被点击的按钮
    sender.enabled = NO;
    
    // 2. 弹出一个消息提醒框(这个消息提醒框其实就是一个UILabel)
    UILabel *lblMsg = [[UILabel alloc] init];
    // 2.1 设置lblMsg的显示文字
    lblMsg.text = @"正在下载...";
    // 2.2 设置lblMsg的背景色
    lblMsg.backgroundColor = [UIColor blackColor];
    // 2.3 设置lblMsg的frame
    CGFloat viewW = self.superview.frame.size.width;
    CGFloat viewH = self.superview.frame.size.height;
    CGFloat msgW = 200;
    CGFloat msgH = 30;
    CGFloat msgX = (viewW - msgW) / 2;
    CGFloat msgY = (viewH - msgH) * 0.5;
    lblMsg.frame = CGRectMake(msgX, msgY, msgW, msgH);
    // 2.4 设置label的文字颜色
    lblMsg.textColor = [UIColor redColor];
    // 2.5 设置label居中显示
    lblMsg.textAlignment = NSTextAlignmentCenter;
    // 2.6 设置文字粗体
    lblMsg.font = [UIFont boldSystemFontOfSize:17];
    // 2.7 设置Label的透明度
    lblMsg.alpha = 0.0; // 一开始把透明度设置为0, 然后通过动画的方式慢慢的改变透明度
    // 2.8 设置Label为"圆角"
    // 设置四个角的“半径”
    lblMsg.layer.cornerRadius = 10;
    // 把多余的部分裁剪掉
    lblMsg.layer.masksToBounds = YES;
    
    // 2.9通过动画的方式来显示Label
    //    [UIView animateWithDuration:2.0 animations:^{
    //        lblMsg.alpha = 0.6;
    //    }];
    
    
    // 开启一个动画, 这个动画要执行1.5秒钟
    [UIView animateWithDuration:1.5 animations:^{
        // 动画代码: 将透明度变成0.6
        lblMsg.alpha = 0.6;
        
    } completion:^(BOOL finished) {
        // 当上面的动画执行完毕以后执行这个代码
        
        if (finished) {
            // 这个代码的含义是, 隔一段时间后再启动另外一个动画
            // 这个动画的执行时间是1.5秒钟, 但是这个动画会在1.0秒之后再开始执行
            // UIViewAnimationOptionCurveLinear表示是匀速执行动画
            [UIView animateWithDuration:1.5 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
                // 这个动画的代码
                lblMsg.alpha = 0;
                
            } completion:^(BOOL finished) {
                if (finished) {
                    // 当Label的透明度变成0以后, 再把这个Label从view中移除
                    [lblMsg removeFromSuperview];
                }
            }];
        }
    }];
    
    
    
    // 3. 把lblMsg加到控制器所管理的那个view上
    [self.superview addSubview:lblMsg];
    
}
@end
