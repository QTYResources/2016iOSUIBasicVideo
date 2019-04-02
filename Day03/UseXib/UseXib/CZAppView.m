//
//  CZAppView.m
//  UseXib
//
//  Created by QinTuanye on 2019/2/25.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "CZAppView.h"
#import "CZApp.h"

@interface CZAppView ()

@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIButton *btnDownload;

@end

@implementation CZAppView

// 重写model属性的set方法
- (void)setModel:(CZApp *)model {
    // 先赋值
    _model = model;
    
    // 解析模型数据，把模型数据赋值给UIView中的各个子控件
    self.imgViewIcon.image = [UIImage imageNamed:model.icon];
    self.lblName.text = model.name;
}

@end
