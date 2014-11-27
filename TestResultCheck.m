//
//  JudgeTest.m
//  GuessNumber
//
//  Created by cyd on 14-11-6.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ResultCheck.h"

@interface TestResultCheck : XCTestCase{
    ResultCheck *resultcheck;
}

@end

@implementation TestResultCheck

- (void)setUp {
    [super setUp];
    
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
- (void)test_judge_result_is_4a0b{
    NSMutableArray *system=[[NSMutableArray alloc]initWithObjects:@"1",@"3",@"6",@"8", nil];
    NSString *write=@"1368";
    resultcheck=[[ResultCheck alloc]init :write :system ];
    NSString *result=[resultcheck JudgeAandB];
    NSString *example=@"4A0B";
    XCTAssertEqualObjects(result,example);
}

- (void)test_judge_result_is_0a4b{
    NSMutableArray *system=[[NSMutableArray alloc]initWithObjects:@"1",@"3",@"6",@"8", nil];
    NSString *write=@"8631";
    resultcheck=[[ResultCheck alloc]init :write :system ];
    NSString *result=[resultcheck JudgeAandB];
    NSString *example=@"0A4B";
    XCTAssertEqualObjects(result,example);
}

- (void)test_judge_result_is_2a2b{
    NSMutableArray *system=[[NSMutableArray alloc]initWithObjects:@"1",@"3",@"6",@"8", nil];
    NSString *write=@"8361";
    resultcheck=[[ResultCheck alloc]init :write :system ];
    NSString *result=[resultcheck JudgeAandB];
    NSString *example=@"2A2B";
    XCTAssertEqualObjects(result,example);
}






@end
