//
//  CZQuestion.m
//  01超级猜图
//
//  Created by apple on 15/2/10.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZQuestion.h"

@implementation CZQuestion

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.answer = dict[@"answer"];
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.options = dict[@"options"];
    }
    return self;
}

+ (instancetype)questionWithDict:(NSDictionary *)dict
{
    return  [[self alloc]initWithDict:dict];
}
@end
