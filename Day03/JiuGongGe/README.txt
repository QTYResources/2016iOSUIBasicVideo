JiuGongGe

应用管理-排列九宫格

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
        // 1. 创建每个应用（UIView）
        UIView *appView = [[UIView alloc] init];
        
        // 2. 设置appView的属性
        // 2.1 设置appView的背景色
        appView.backgroundColor = [UIColor blueColor];
        
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
    }
}