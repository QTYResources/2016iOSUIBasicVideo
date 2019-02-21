TomCatPackage

汤姆猫——代码封装

// 执行动画的方法
- (void)startAnimating:(int)count picName:(NSString *)picName {
    // 如果当前图片框正在执行动画，那么直接return，什么都不做（没有开启一个新动画）
    if (self.imgViewCat.isAnimating) {
        return;
    }

    // 1. 把图片加载到数组中
    // 0. 动态加载图片到一个NSArray中
    NSMutableArray *arrayM = [NSMutableArray array];

    for (int i = 0; i < count; i++) {
        // 拼接图片名称
        NSString *imgName = [NSString stringWithFormat:@"%@_%02d.jpg", picName, i];

        // 根据图片名称加载图片
        // 通过imgNamed:这种方式加载图片，加载好的图片会一直保存在内存中，不会释放，
        // 这样下次如果在使用同样的图片的时候就不需要再重新加载了，因为内存里面已经有了。
        // 缺点就是：如果加载了大量的图片，那么这些图片会一直保留在c内存中，导致应用程序占用内存过大（这就叫缓存）
        // 使用这种方式加载图片，加载起来的图片即便没有强类型指针引用也不会销毁（会被缓存）
//        UIImage *imgCat = [UIImage imageNamed:imgName];

        // 使用下面这种方式加载的图片，只要没有强类型指针引用就会被销毁了
        // 解决：换一种加载图片的方式，不要使用缓存
        // 获取图片的完整的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:imgName ofType:nil];


        // 这里的参数不能再传递图片名称了，这里需要传递一个图片的完整路径
        UIImage *imgCat = [UIImage imageWithContentsOfFile:path];

        // 把图片加载到数组中
        [arrayM addObject:imgCat];
    }

    // 2. 设置UIImageView的animationImages属性为对应的图片集合
    self.imgViewCat.animationImages = arrayM;

    // 3. 动画持续时间
    self.imgViewCat.animationDuration = self.imgViewCat.animationImages.count * 0.1;

    // 4. 重复次数
    self.imgViewCat.animationRepeatCount = 1;

    // 5. 启动动画
    [self.imgViewCat startAnimating];

    // 清空图片集合
    // 这样写的问题是，当动画启动以后，动画还没开始执行，就已经让图片集合清空了，也就是说self.imgViewCat.animationImages里面已经没有图片了，所以动画就不执行了。
//    self.imgViewCat.animationImages = nil;

    // self.imgViewCat.animationImages = nil;需要延迟一段时间执行，f当动画执行完毕以后现清空这些图片
//    [self.imgViewCat setAnimationImages:nil];

    // 设置图片框在调用setAnimationImages:nil方法的时候延迟执行
    [self.imgViewCat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.imgViewCat.animationImages.count * 0.1];
}

    注意：使用NSString *path = [[NSBundle mainBundle] pathForResource:imgName ofType:nil];方式来创建UIImge对象，图片不能放在Assets.xcassets文件夹中，需要把图片放在Assets.xcassets文件夹外。这样添加图片后还需要将这些图片添加到编译中