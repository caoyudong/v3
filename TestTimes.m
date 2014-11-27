//
//  TestTimes.m
//  GuessNumber
//
//  Created by cyd on 14-11-14.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ChanceTimes.h"
@interface TestTimes : XCTestCase

@end

@implementation TestTimes

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

-(void)test_4A0B_6times_exam{
    ChanceTimes *chancetimes=[[ChanceTimes alloc]init];
   NSString *result=[chancetimes resultBytimes:@"4A0B" :6];
    XCTAssertEqualObjects(result, @"sucess");
}

-(void)test_0A4B_6times_exam{
    ChanceTimes *chancetimes=[[ChanceTimes alloc]init];
    NSString *result=[chancetimes resultBytimes:@"0A4B" :6];
    XCTAssertEqualObjects(result, @"fail");
}

-(void)test_0A3B_6times_exam{
    ChanceTimes *chancetimes=[[ChanceTimes alloc]init];
    NSString *result=[chancetimes resultBytimes:@"0A3B" :5];
    XCTAssertEqualObjects(result, @"0A3B");
}



@end
