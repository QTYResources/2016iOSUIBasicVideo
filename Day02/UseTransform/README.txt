UseTransform

使用transform属性

（1）告诉控件，平移到距离原始位置-50的位置
    self.btnIcon.transform = CGAffineTransformMakeTranslation(0, -50);

（2）基于现有的一个值，再进行平移
	self.btnIcon.transform = CGAffineTransformTranslate(self.btnIcon.transform, 0, 50);

（3）旋转
	self.btnIcon.transform = CGAffineTransformRotate(self.btnIcon.transform, -M_PI_4);
	注意：旋转的值使用的是弧度作为单位，可以使用系统自带的弧度常量：
	#define M_PI        3.14159265358979323846264338327950288   /* pi             */
	#define M_PI_2      1.57079632679489661923132169163975144   /* pi/2           */
	#define M_PI_4      0.785398163397448309615660845819875721  /* pi/4           */
	#define M_1_PI      0.318309886183790671537767526745028724  /* 1/pi           */
	#define M_2_PI      0.636619772367581343075535053490057448  /* 2/pi           */
	#define M_2_SQRTPI  1.12837916709551257389615890312154517   /* 2/sqrt(pi)     */
	
（4）缩放
	self.btnIcon.transform = CGAffineTransformScale(self.btnIcon.transform, 1.5, 1.5);
	
（5）复位
    self.btnIcon.transform = CGAffineTransformIdentity;