//
//  ViewController.m
//  CreateViewWithXib
//
//  Created by QinTuanye on 2019/4/2.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "CZApp.h"
#import "CZAppView.h"

@interface ViewController ()

// 用来保存所有应用的数据
@property (nonatomic, strong) NSArray *apps;

@end

@implementation ViewController

// shift + option + command + 左 （折叠所有的代码）
// shift + option + command + 右 （展开所有的代码）

// 重写apps属性的get方法，进行懒加载数据
- (NSArray *)apps {
    if (_apps == nil) {
        // 加载数据
        // 1. 获取app.plist文件在手机上的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        
        // 2. 根据路径加载数据
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        
        // 3. 创建一个可变数据来保存一个一个的模型对象
        NSMutableArray *arrayModels = [NSMutableArray array]; // 一个空的可变数组
        
        // 4. 循环字典数组，把每个字典对象转换成一个模型对象
        for (NSDictionary *dict in arrayDict) {
            // 创建一个模型
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
    CGFloat marginTop = 30; // 每一行距离顶部的距离
    CGFloat marginX = (viewWidth - columns *appW) / (columns + 1);
    CGFloat marginY = marginX ; // 假设每行之间的间距与marginX相等
    
    for (int i = 0; i < self.apps.count; i++) {
        // 获取当前这个应用的数据字典
        CZApp *appModel = self.apps[i];
        
        // 创建view
        CZAppView *appView = [CZAppView appView];
        
        // 2.2 设置appView的frame属性
        // 计算每个单元格所在的列的索引
        int colIdx = i % columns;
        // 计算每个单元格的行索引
        int rowIdx = i / columns;
        
        CGFloat appX = marginX + colIdx * (appW + marginX);
        CGFloat appY = marginTop + rowIdx * (appH + marginY);
        appView.frame = CGRectMake(appX, appY, appW, appH);
        
        // 3. 将appView加到self.view（控制器所管理的那个view）
        [self.view addSubview:appView];
        
        // 设置数据
        // 把模型数据设置给“自定义view”的model属性
        // 然后重写model属性的set方法，在set方法中解析模型对象中的属性，并把属性值设置给自定义view的各个子控件
        appView.model = appModel;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
