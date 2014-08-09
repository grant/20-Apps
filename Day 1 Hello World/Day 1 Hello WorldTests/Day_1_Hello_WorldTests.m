//
//  Day_1_Hello_WorldTests.m
//  Day 1 Hello WorldTests
//
//  Created by Grant Timmerman on 8/9/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Day_1_Hello_WorldTests : XCTestCase

@end

@implementation Day_1_Hello_WorldTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
