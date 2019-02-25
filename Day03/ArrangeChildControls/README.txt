ArrangeChildControls

应用管理——添加子控件

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
    CGFloat marginX = (viewWidth - columns * appW) / (columns  + 1);
    CGFloat marginY = marginX;  // t假设每行之间的间距与marginX相等
    
    for (int i = 0; i < self.apps.count; i++) {
        // 1. 创建每个应用（UIView）
        UIView *appView = [[UIView alloc] init];
        
        // 2. 设置appView的属性
        // 2.1 设置appView的背影色
        appView.backgroundColor = [UIColor blueColor];
        
        // 2.2 设置appView的frame属性
        // 计算每个单元格所在的列索引
        int colIdx = i % columns;
        // 计算每个单元格的行索引
        int rowIdx = i / columns;
        
        CGFloat appX = marginX + colIdx * (appW + marginX);
        CGFloat appY = marginTop + rowIdx * (appH + marginY);
        appView.frame = CGRectMake(appX, appY, appW, appH);
        
        // 3. 将appView加到self.view（控制器所管理的那个view）
        [self.view addSubview:appView];
        
        // 4. 向UIView中增加子控件
        // 4.1 增加一个图片
        UIImageView *imgViewIcon = [[UIImageView alloc] init];
        // 设置背景色
        imgViewIcon.backgroundColor = [UIColor yellowColor];
        // 设置frame
        CGFloat iconW = 45;
        CGFloat iconH = 45;
        CGFloat iconX = (appView.frame.size.width - iconW) * 0.5;
        CGFloat iconY = 0;
        imgViewIcon.frame = CGRectMake(iconX, iconY, iconW, iconH);
        
        // 把图片框添加到appView中
        [appView addSubview:imgViewIcon];
        
        // 4.2 增加一个Label标签
        // 创建Label
        UILabel *lblName = [[UILabel alloc] init];
        // 设置背景色
        lblName.backgroundColor = [UIColor redColor];
        // 设置frame
        CGFloat nameW = appView.frame.size.width;
        CGFloat nameH = 20;
        CGFloat nameY = iconH;
        CGFloat nameX = 0;
        lblName.frame = CGRectMake(nameX, nameY, nameW, nameH);
        // 添加到appView中
        [appView addSubview:lblName];
        
        // 4.3 增加一个按钮（UIButton）
        UIButton *btnDownload = [[UIButton alloc] init];
        // 设置背景色
        btnDownload.backgroundColor = [UIColor greenColor];
        // 设置背景色
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
    }
}
