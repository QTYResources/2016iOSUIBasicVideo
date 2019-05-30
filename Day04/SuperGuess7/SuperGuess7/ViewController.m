//
//  ViewController.m
//  SuperGuess7
//
//  Created by QinTuanye on 2019/5/30.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "CZQuestion.h"


@interface ViewController () <UIAlertViewDelegate>

// 所有问题的数据都在这个数组中
@property (nonatomic, strong) NSArray *questions;

// 控制题目索引, 类型的int类型属性, 默认没有赋值一开始就是0
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



// 用来引用那个“阴影”按钮的属性
@property (weak, nonatomic) UIButton *cover;

- (IBAction)btnNextClick;

- (IBAction)bigImage:(id)sender;

// 头像按钮的单击事件
- (IBAction)btnIconClick:(id)sender;

// 提示
- (IBAction)btnTipClick;


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

// 点击"提示"按钮
- (IBAction)btnTipClick {
    // 1. 分数-1000
    [self addScore:-1000];
    
    
    // 2. 把所有的答案按钮"清空"(其实这里的"清空"最好是调用每个答案按钮的单击事件)
    for (UIButton *btnAnswer in self.answerView.subviews) {
        // 让每个答案按钮点击一下
        [self btnAnswerClick:btnAnswer];
    }
    
    // 3. 根据当前的索引, 从数据数组中(self.questions)中找到对应的数据模型
    // 从数据模型中获取正确答案的第一个字符, 把待选按钮中和这个字符相等的那个按钮点击一下
    CZQuestion *model = self.questions[self.index];
    //截取正确答案中的第一个字符"字符串"
    NSString *firstChar = [model.answer substringToIndex:1];
    
    // 根据firstChar在option按钮中找到对应的option 按钮, 让这个按钮点击一下
    for (UIButton *btnOpt in self.optionsView.subviews) {
        if ([btnOpt.currentTitle isEqualToString:firstChar]) {
            [self optionButtonClick:btnOpt]; // 设置某个option 按钮点击一下
            break;
        }
    }
}


// "阴影"的单击事件
- (void)samllImage
{
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


// 实现UIAlertView的代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // NSLog(@"%ld", buttonIndex);
    if (buttonIndex == 0) {
        // 让程序在回到第0个问题
        self.index = -1;
        [self nextQuestion];
    }
}



// 下一题
- (void)nextQuestion
{
    // 1. 让索引++
    self.index++;
    
    // 判断当前索引是否越界, 入股索引越界, 则提示用户
    if (self.index == self.questions.count) {
        //NSLog(@"答题完毕！！！！");
        
        // 弹出一个对话框
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"操作提示" message:@"恭喜通关!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        
        // 显示对话框
        [alertView show];
        return;
    }
    
    
    // 2. 根据索引获取当前的模型数据
    CZQuestion *model = self.questions[self.index];
    
    
    
    // 3. 根据模型设置数据
    [self settingData:model];
    
    
    // 4. 动态创建"答案按钮"
    [self makeAnswerButtons:model];
    
    
    // 5. 动态创建"待选按钮"
    [self makeOptionsButton:model];
    
    
}


// 创建待选按钮
- (void)makeOptionsButton:(CZQuestion *)model
{
    // 0. 设置option view 可以与用户交互
    self.optionsView.userInteractionEnabled = YES;
    
    
    // 1. 清除待选按钮的view中的所有子控件
    [self.optionsView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 2. 获取当前题目的待选文字的数组
    NSArray *words = model.options;
    
    // 3. 根据待选文字循环来创建按钮
    
    // 指定每个待选按钮的大小
    CGFloat optionW = 35;
    CGFloat optionH = 35;
    // 指定每个按钮之间的间距
    CGFloat margin = 10;
    // 指定每行有多少个按钮
    int columns = 7;
    // 计算出每行第一个按钮距离左边的距离
    CGFloat marginLeft = (self.optionsView.frame.size.width - columns * optionW - (columns - 1) * margin) / 2;
    
    
    for (int i = 0; i < words.count; i++) {
        // 创建一个按钮
        UIButton *btnOpt = [[UIButton alloc] init];
        
        // 给每个option 按钮一个唯一的tag值
        btnOpt.tag = i;
        
        // 设置按钮背景
        [btnOpt setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
        [btnOpt setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighted"] forState:UIControlStateHighlighted];
        
        // 设置按钮文字
        [btnOpt setTitle:words[i] forState:UIControlStateNormal];
        
        // 设置文字颜色为黑色
        [btnOpt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        // 计算当前按钮的列的索引和行的索引
        int colIdx = i % columns;
        int rowIdx = i / columns;
        
        CGFloat optionX = marginLeft + colIdx * (optionW + margin);
        CGFloat optionY = 0 + rowIdx * (optionH + margin);
        
        // 设置按钮frame
        btnOpt.frame = CGRectMake(optionX, optionY, optionW, optionH);
        
        // 把按钮添加到optionsView中
        [self.optionsView addSubview:btnOpt];
        
        // 为待选按钮注册单击事件
        [btnOpt addTarget:self action:@selector(optionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
}

// 待选按钮的单击事件
- (void)optionButtonClick:(UIButton *)sender
{
    // 1. 隐藏当前被点击的按钮
    sender.hidden = YES;
    
    // 2. 把当前被点击的按钮的文字显示到第一个为空的"答案按钮"上
    //NSString *text = [sender titleForState:UIControlStateNormal]; // 获取按钮指定状态下的文字
    NSString *text = sender.currentTitle; // 获取按钮当前状态下的文字
    
    
    // 2.1 把文字显示到答案按钮上
    
    // 遍历每一个答案按钮
    for (UIButton *answerBtn in self.answerView.subviews) {
        // 判断每个"答案按钮"上的文字是否为nil
        if (answerBtn.currentTitle == nil) {
            
            // 把当前点击的待选按钮的文字设置给对应的答案按钮
            [answerBtn setTitle:text forState:UIControlStateNormal];
            // 把当前点击的待选按钮的tag值也设置给对应的答案按钮
            answerBtn.tag = sender.tag;
            
            break;
        }
    }
    
    
    
    
    
    
    // 3. 判断答案按钮是否已经填满了
    // 一开始假设答案按钮是填满的
    BOOL isFull = YES;
    // 声明一个用来保存用户输入的答案的字符串
    NSMutableString *userInput = [NSMutableString string];
    
    for (UIButton *btnAnswer in self.answerView.subviews) {
        if (btnAnswer.currentTitle == nil) {
            isFull = NO;
            break;
        } else {
            // 如果当前答案按钮上面有文字, 那么就把这个文字拼接起来
            [userInput appendString:btnAnswer.currentTitle];
        }
    }
    
    // 如果已经填满, 则禁止option view 控件与用户的交互
    if (isFull) {
        // 禁止"待选按钮"被点击
        self.optionsView.userInteractionEnabled = NO;
        
        // 获取当前题目的正确答案
        CZQuestion *model = self.questions[self.index];
        
        
        // 4. 如果答案按钮被填满了, 那么就判断用户点击输入的答案是否与标准答案一致,
        if ([model.answer isEqualToString:userInput]) {
            // 如果一致, 则设置答案按钮的文字颜色为蓝色, 同时在0.5秒之后跳转下一题
            // 0. 如果正确+100分
            [self addScore:100];
            //1. 设置所有的答案按钮的文字颜色为 蓝色
            [self setAnswerButtonsTitleColor:[UIColor blueColor]];
            
            // 延迟0.5秒后, 跳转到下一题
            [self performSelector:@selector(nextQuestion) withObject:nil afterDelay:0.5];
            
        } else {
            // 如果答案不一致（答案错误）, 设置答案按钮的文字颜色为红色
            // 设置所有的答案按钮的文字颜色为 红色
            [self setAnswerButtonsTitleColor:[UIColor redColor]];
        }
    }
}

// 根据指定的分数, 来对界面上的按钮进行加分和减分
- (void)addScore:(int)score
{
    // 1. 获取按钮上现在分值
    NSString *str = self.btnScore.currentTitle;
    
    // 2. 把这个分值转换成数字类型
    int currentScore = str.intValue;
    
    // 3. 对这个分数进行操作
    currentScore = currentScore + score;
    
    // 4. 把新的分数设置给按钮
    [self.btnScore setTitle:[NSString stringWithFormat:@"%d", currentScore] forState:UIControlStateNormal];
}


// 统一设置答案按钮的文字颜色
- (void)setAnswerButtonsTitleColor:(UIColor *)color
{
    // 遍历每一个答案按钮, 设置文字颜色
    for (UIButton *btnAnswer in self.answerView.subviews) {
        [btnAnswer setTitleColor:color forState:UIControlStateNormal];
    }
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
        
        // 设置答案按钮的文字颜色
        [btnAnswer setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // 把按钮加到answerView中
        [self.answerView addSubview:btnAnswer];
        
        
        // 为答案按钮注册单击事件
        [btnAnswer addTarget:self action:@selector(btnAnswerClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}

// 参数sender, 就表示当前点击的答案按钮
- (void)btnAnswerClick:(UIButton *)sender
{
    // 0. 启用option view与用户的交互
    self.optionsView.userInteractionEnabled = YES;
    
    // 1. 设置所有的答案按钮的文字颜色为黑色
    [self setAnswerButtonsTitleColor:[UIColor blackColor]];
    
    
    // 2. 在"待选按钮"中找到与当前被点击的答案按钮文字相同待选按钮，设置该按钮显示出来。
    for (UIButton *optBtn in self.optionsView.subviews) {
        // 比较判断待选按钮的文字是否与当前被点击的答案按钮的文字一致
        //        if ([sender.currentTitle isEqualToString:optBtn.currentTitle]) {
        //            optBtn.hidden = NO;
        //            break;
        //        }
        
        if (sender.tag == optBtn.tag) {
            optBtn.hidden = NO;
            break;
        }
    }
    
    // 1. 清空当前被点击的答案按钮的文字
    [sender setTitle:nil forState:UIControlStateNormal];
    
    
}
@end
