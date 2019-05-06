//
//  CZAppView.h
//  DownloadButtonClick
//
//  Created by QinTuanye on 2019/4/3.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZApp;

@interface CZAppView : UIView

@property (nonatomic, strong) CZApp *model;

// 为自定义View封装一个类方法，这个类方法的作用就是创建一个view对象
+ (instancetype)appView;

@end
