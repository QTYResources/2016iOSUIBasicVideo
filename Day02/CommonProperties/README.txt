CommonProperties

控件的常见属性

（1）获取View下的所有子View
	self.view.subviews
	
（2）将View从父视图中移除掉。
	[self.view.subviews.firstObject removeFromSuperview];

（3）通过tag获取对应的View。
	UITextField *txt = (UITextField *)[self.view viewWithTag:1000];

（4）移除View下的所有子View
	1. 第一种方法：
		while (self.view.subviews.firstObject) {
		    [self.view.subviews.firstObject removeFromSuperview];
		}
		
	2. 第二种方法：
        self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];