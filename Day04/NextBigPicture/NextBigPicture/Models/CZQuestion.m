//
//  CZQuestion.m
//  NextBigPicture
//
//  Created by QinTuanye on 2019/5/9.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "CZQuestion.h"

@implementation CZQuestion

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.answer = dict[@"answer"];
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.options = dict[@"options"];
    }
    return self;
}

+ (instancetype)questionWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
