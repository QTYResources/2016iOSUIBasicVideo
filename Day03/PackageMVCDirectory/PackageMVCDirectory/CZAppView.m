//
//  CZAppView.m
//  PackageMVCDirectory
//
//  Created by QinTuanye on 2019/4/3.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "CZAppView.h"
#import "CZApp.h"

@interface CZAppView ()

@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblname;
@property (weak, nonatomic) IBOutlet UIButton *btnDownload;

@end

@implementation CZAppView

+ (instancetype)appView {
    // 1. 通过xib创建每个应用（UIView）
    // 通过动态加载xib文件创建里面的View
    // 1.1 > 找到应用的根目录
    NSBundle *rootBundle = [NSBundle mainBundle];
    NSLog(@"%@", [[NSBundle mainBundle] bundlePath]);
    // 1.2 > 在用用程序目录下取搜索对应的Xib（nib）文件
    return [[rootBundle loadNibNamed:@"CZAppView" owner:nil options:nil] lastObject];
}

// 重写model属性的set方法
- (void)setModel:(CZApp *)model {
    // 先赋值
    _model = model;
    
    // 解析模型数据，把模型数据赋值给UIView中的各个子控件
    self.imgViewIcon.image = [UIImage imageNamed:model.icon];
    self.lblname.text = model.name;
}

@end
