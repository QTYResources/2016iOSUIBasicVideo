//
//  TestTests.m
//  TestTests
//
//  Created by QinTuanye on 2019/5/30.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TestTests : XCTestCase

@end

@implementation TestTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
