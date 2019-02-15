PictureView

图片浏览器

（1）加载plist文件方法
	// 写代码加载pic.plist文件中的数据到_pic
     // 1. 获取pic.plist文件的路径
     // 获取pic.plist文件的路径赋值给path变量
     // [NSBundle mainBundle]表示获取这个app安装到手机上时的根目录
     // 然后在app的安装的根目录下搜索pic.plist文件的路径
     NSString *path = [[NSBundle mainBundle] pathForResource:@"pic.plist" ofType:nil];
或者
	NSString *path = [[NSBundle mainBundle] pathForResource:@"pic" ofType:@"plist"];
	
（2）懒加载
	// 重写pic属性的get方法
	// --------懒加载数据--------
	- (NSArray *)pic {
	    if (_pic == nil) {
	        // 写代码加载pic.plist文件中的数据到_pic
	        // 1. 获取pic.plist文件的路径
	        // 获取pic.plist文件的路径赋值给path变量
	        // [NSBundle mainBundle]表示获取这个app安装到手机上时的根目录
	        // 然后在app的安装的根目录下搜索pic.plist文件的路径
	//        NSString *path = [[NSBundle mainBundle] pathForResource:@"pic.plist" ofType:nil];
	        NSString *path = [[NSBundle mainBundle] pathForResource:@"pic" ofType:@"plist"];
	        // 读取文件
	        NSArray *array = [NSArray arrayWithContentsOfFile:path];
	        _pic = array;
	    }
	    return _pic;
	}
	
（3）设置控件不可用
    self.btnPre.enabled = NO;