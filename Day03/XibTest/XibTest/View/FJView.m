//
//  FJView.m
//  xibtest
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "FJView.h"

@implementation FJView




+(instancetype)headView{
    
        return [[[NSBundle mainBundle] loadNibNamed:@"FJView" owner:nil options:nil] firstObject];
    
    
}

@end
