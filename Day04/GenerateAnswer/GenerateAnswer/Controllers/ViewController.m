//
//  ViewController.m
//  GenerateAnswer
//
//  Created by QinTuanye on 2019/5/10.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "CZQuestion.h"

@interface ViewController ()

// 所有问题的数据都在这个数组中
@property (nonatomic, strong) NSArray *questions;

// 控制题目索引，类型的int类型属性，默认没有赋值一开始就是0
@property (nonatomic, assign) int index;

// 记录头像按钮原始的frame
@property (nonatomic, assign) CGRect iconFrame;

@property (weak, nonatomic) IBOutlet UILabel *lblIndex;
@property (weak, nonatomic) IBOutlet UIButton *btnScore;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnIcon;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIView *answerView;
@property (weak, nonatomic) IBOutlet UIView *optionsView;

// 用来引用那个”阴影“按钮的属性
@property (weak, nonatomic) UIButton *cover;

- (IBAction)btnNextClick;

- (IBAction)bigImage:(id)sender;

// 头像按钮的单击事件
- (IBAction)btnIconClick:(id)sender;

@end

@implementation ViewController

// 懒加载数据
- (NSArray *)questions
{
    if (_questions == nil) {
        // 加载数据
        NSString *path = [[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModel = [NSMutableArray array];
        
        // 遍历把字典转模型
        for (NSDictionary *dict in arrayDict) {
            CZQuestion *model = [CZQuestion questionWithDict:dict];
            [arrayModel addObject:model];
        }
        _questions = arrayModel;
    }
    return _questions;
}


// 改变状态栏的文字颜色为白色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

// 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 初始化显示第一题
    self.index = -1;
    [self nextQuestion];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 点击下一题
- (IBAction)btnNextClick {
    
    // 移动到下一题
    [self nextQuestion];
}

// 显示大图
- (IBAction)bigImage:(id)sender {
    
    // 记录一下头像按钮的原始frame
    self.iconFrame = self.btnIcon.frame;
    
    // 1.创建大小与self.view一样的按钮, 把这个按钮作为一个"阴影"
    UIButton *btnCover = [[UIButton alloc] init];
    // 设置按钮大小
    btnCover.frame = self.view.bounds;
    // 设置按钮背景色
    btnCover.backgroundColor = [UIColor blackColor];
    // 设置按钮透明度
    btnCover.alpha = 0.0;
    
    // 把按钮加到self.view中
    [self.view addSubview:btnCover];
    
    // 为阴影按钮注册一个单击事件
    [btnCover addTarget:self action:@selector(samllImage) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 2. 把图片设置到阴影的上面
    // 把self.view中的所有子控件中, 只把self.btnIcon显示到最上层
    [self.view bringSubviewToFront:self.btnIcon];
    
    // 通过self.cover来引用btnCover
    self.cover = btnCover;
    
    
    // 3. 通过动画的方式把图片变大
    CGFloat iconW = self.view.frame.size.width;
    CGFloat iconH = iconW;
    CGFloat iconX = 0;
    CGFloat iconY = (self.view.frame.size.height - iconH) * 0.5;
    
    [UIView animateWithDuration:0.7 animations:^{
        // 设置按钮透明度
        btnCover.alpha = 0.6;
        
        // 设置图片的新的frame
        self.btnIcon.frame = CGRectMake(iconX, iconY, iconW, iconH);
    }];
    
    
}

// 头像按钮的单击事件
- (IBAction)btnIconClick:(id)sender {
    if (self.cover == nil) {
        // 显示大图
        [self bigImage:nil];
    } else {
        [self samllImage];
    }
}


// "阴影"的单击事件
- (void)samllImage
{
    //    //NSLog(@"阴影按钮被单击了。。。。");
    //    // 1. 设置btnIcon（头像）按钮的frame还原
    //    self.btnIcon.frame = self.iconFrame;
    //
    //    // 2. 让"阴影"按钮的透明度变成0
    //
    //
    //    // 3. 移出"阴影"按钮
    //    [self.cover removeFromSuperview];
    
    
    [UIView animateWithDuration:0.7 animations:^{
        // 1. 设置btnIcon（头像）按钮的frame还原
        self.btnIcon.frame = self.iconFrame;
        // 2. 让"阴影"按钮的透明度变成0
        self.cover.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            // 移出"阴影"按钮
            [self.cover removeFromSuperview];
            // 当头像图片变成小图以后, 再把self.cover设置成nil
            self.cover = nil;
        }
    }];
}


// 下一题
- (void)nextQuestion
{
    // 1. 让索引++
    self.index++;
    
    
    
    // 2. 根据索引获取当前的模型数据
    CZQuestion *model = self.questions[self.index];
    
    
    
    // 根据模型设置数据
    [self settingData:model];
    
    
    // 5. 动态创建"答案按钮"
    [self makeAnswerButtons:model];
    
}



// 加载数据, 把模型数据设置到界面的控件上
- (void)settingData:(CZQuestion *)model
{
    // 3. 把模型数据设置到界面对应的控件上
    self.lblIndex.text = [NSString stringWithFormat:@"%d / %ld", (self.index + 1), self.questions.count];
    self.lblTitle.text = model.title;
    [self.btnIcon setImage:[UIImage imageNamed:model.icon] forState:UIControlStateNormal];
    
    // 4. 设置到达最后一题以后, 禁用"下一题按"钮
    self.btnNext.enabled = (self.index != self.questions.count - 1);
}


// 创建答案按钮
- (void)makeAnswerButtons:(CZQuestion *)model
{
    // 5.0 清除所有的"答案按钮"
    //    while (self.answerView.subviews.firstObject) {
    //        [self.answerView.subviews.firstObject removeFromSuperview];
    //    }
    
    // 这句话的意思：让subviews这个数组中的每个对象, 分别调用一次removeFromSuperview方法, 内部执行了循环,无需我们自己来些循环
    [self.answerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 5.1 获取当前答案的文字的个数
    NSInteger len = model.answer.length;
    // 设置按钮的frame
    CGFloat margin = 10; // 假设每个按钮之间的间距都是10
    CGFloat answerW = 35;
    CGFloat answerH = 35;
    CGFloat answerY = 0;
    CGFloat marginLeft = (self.answerView.frame.size.width - (len * answerW) - (len - 1) * margin) / 2;
    
    // 5.2 循环创建答案按钮, 有几个文字就创建几个按钮
    for (int i = 0; i < len; i++) {
        // 创建按钮
        UIButton *btnAnswer = [[UIButton alloc] init];
        // 设置按钮的背景图
        [btnAnswer setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [btnAnswer setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        
        // 计算按钮的x值
        CGFloat answerX = marginLeft + i * (answerW + margin);
        btnAnswer.frame = CGRectMake(answerX, answerY, answerW, answerH);
        // 把按钮加到answerView中
        [self.answerView addSubview:btnAnswer];
        
    }
}
@end
