//
//  CZApp.m
//  SetChildControlData
//
//  Created by QinTuanye on 2019/2/25.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "CZApp.h"

@implementation CZApp

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+ (instancetype)appWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
