//
//  ViewController.m
//  SetChildControlData
//
//  Created by QinTuanye on 2019/2/25.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "CZApp.h"

@interface ViewController ()

// 用来保存所有应用的数据
@property (nonatomic, strong) NSArray *apps;

@end

@implementation ViewController

// 重写apps属性的get方法，进行懒加载数据
- (NSArray *)apps {
    if (_apps == nil) {
        // 加载数据
        // 1. 获取app.plist文件在手机上的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        
        // 2. 根据路径加载数据
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        
        // 3. 创建一个可变数据用来保存一个一个的模型对象
        NSMutableArray *arrayModels = [NSMutableArray array];   // 一个空的可变数组
        
        // 4. 循环字典数组，把每个字典对象转换成一个模型对象
        for (NSDictionary *dict in arrayDict) {
            // 创建一个模型
            //            CZApp *model = [[CZApp alloc] initWithDict:dict];
            CZApp *model = [CZApp appWithDict:dict];
            
            // 把模型加到arrayModels中
            [arrayModels addObject:model];
        }
        
        _apps = arrayModels;
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 假设每行的应用的个数
    int columns = 3;
    
    // 获取控制器所管理的view的宽度
    CGFloat viewWidth = self.view.frame.size.width;
    
    // 每个应用的宽和高
    CGFloat appW = 75;
    CGFloat appH = 90;
    CGFloat marginTop = 30; // 第一行距离顶部的距离
    CGFloat marginX = (viewWidth - columns * appW) / (columns + 1);
    CGFloat marginY = marginX;  // 假设每行之间的间距与marginX相等
    
    for (int i = 0; i < self.apps.count; i++) {
        // 获取当前这个应用的数据字典
        CZApp *appModel = self.apps[i];
        
        // 1. 创建每个应用（UIView）
        UIView *appView = [[UIView alloc] init];
        
        // 2. 设置appView的属性
        // 2.1 设置appView的背景色
        //        appView.backgroundColor = [UIColor blueColor];
        
        // 2.2 设置appView的frame属性
        // 计算每个单元格所在的列的索引
        int colIdx = i % columns;
        // 计算每个单元格的行索引
        int rowIdX = i / columns;
        
        CGFloat appX = marginX + colIdx * (appW + marginX);
        CGFloat appY = marginTop + rowIdX * (appH + marginY);
        appView.frame = CGRectMake(appX, appY, appW, appH);
        
        // 3. 将appView加到self.view（控制器所管理的那个View）
        [self.view addSubview:appView];
        
        // 4. 向UIView中增加子控件
        // 4.1 增加一个图片框
        UIImageView *imgViewIcon = [[UIImageView alloc] init];
        // 设置背景色
        //        imgViewIcon.backgroundColor = [UIColor yellowColor];
        // 设置frame
        CGFloat iconW = 45;
        CGFloat iconH = 45;
        CGFloat iconX = (appView.frame.size.width - iconW) * 0.5;
        CGFloat iconY = 0;
        imgViewIcon.frame = CGRectMake(iconX, iconY, iconW, iconH);
        
        // 把图片框添加到appView中
        [appView addSubview:imgViewIcon];
        // 设置图片框的l数据
        imgViewIcon.image = [UIImage imageNamed:appModel.icon];
        
        // 4.2 增加一个Label标签
        // 创建Label
        UILabel *lblName = [[UILabel alloc] init];
        // 设置背景色
        //        lblName.backgroundColor = [UIColor redColor];
        // 设置frame
        CGFloat nameW = appView.frame.size.width;
        CGFloat nameH = 20;
        CGFloat nameY = iconH;
        CGFloat nameX = 0;
        lblName.frame = CGRectMake(nameX, nameY, nameW, nameH);
        // 添加到appView中
        [appView addSubview:lblName];
        // 设置lable的数据（标题）
        lblName.text = appModel.name;
        // 设置label的y文字的字体大小
        lblName.font = [UIFont systemFontOfSize:12];
        // 设置文字居中对齐
        lblName.textAlignment = NSTextAlignmentCenter;
        
        // 4.3 增加一个按钮（UIButton）
        UIButton *btnDownload = [[UIButton alloc] init];
        // 设置背景色
        //        btnDownload.backgroundColor = [UIColor greenColor];
        // 设置frame
        CGFloat btnW = iconW;
        CGFloat btnH = 20;
        CGFloat btnX = iconX;
        //        CGFloat btnY = nameY + nameH;
        CGFloat btnY = CGRectGetMaxY(lblName.frame);
        btnDownload.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 添加到appView中
        [appView addSubview:btnDownload];
        // 补充：控件的最大的Y值 = 控件的Y值 + 控件的高度
        // 控件的最大的X值 = 控件的X值 + 控件的宽度
        
        // 设置按钮的数据
        // 1. 设置按钮上的文字
        [btnDownload setTitle:@"下载" forState:UIControlStateNormal];
        [btnDownload setTitle:@"已安装" forState:UIControlStateDisabled];
        
        // 2. 设置按钮的背景图
        [btnDownload setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [btnDownload setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        
        // 3. 设置按钮的文字大小
        btnDownload.titleLabel.font = [UIFont systemFontOfSize:14];
        
        // 为按钮注册一个单击事件
        [btnDownload addTarget:self action:@selector(btnDownloadClick) forControlEvents:UIControlEventTouchUpInside];
    }
}

// 按钮的单击事件
- (void)btnDownloadClick {
    NSLog(@"下载按钮被点击了...");
}


@end
