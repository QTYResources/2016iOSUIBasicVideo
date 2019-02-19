TomCat

UIImageView动画

// 0.动态加载图片到一个NSArray中
NSMutableArray *arrayM = [NSMutableArray array];
for (int i = 0; i < 81; i++) {
    // 拼接图片名称
    NSString *imgName = [NSString stringWithFormat:@"drink_%02d.jpg", i];
    // 根据图片名称加载图片
    UIImage *imgCat = [UIImage imageNamed:imgName];
    // 把图片加载到数组中
    [arrayM addObject:imgCat];
}
// 1. 设置UIImageView（图片框）的animationImages属性, 这个属性中包含的就是所有那些要执行动画的图片
self.imgViewCat.animationImages = arrayM;
// 2. 设置动画持续时间
self.imgViewCat.animationDuration = 3;
// 3. 设置动画是否需要重复播放
self.imgViewCat.animationRepeatCount = 1;
// 4. 开启动画
[self.imgViewCat startAnimating];