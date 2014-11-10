//
//  JudgeTest.m
//  GuessNumber
//
//  Created by cyd on 14-11-6.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Judge.h"
@interface TestJudge : XCTestCase
-(void)test_judge;
@end

@implementation TestJudge

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
- (void)test_judge{
    NSMutableArray *ceshi=[[NSMutableArray alloc]initWithObjects:@"1",@"3",@"8",@"6",nil];
    Judge *judge=[[Judge alloc]init];
    NSMutableArray *result=[judge panduan:ceshi];
    NSMutableArray *example=[[NSMutableArray alloc]initWithObjects:@"2",@"2", nil];
    NSLog(@"%@--－!!－－－!!!－－－!!－－－",result);
    XCTAssertEqualObjects(result,example);
}
@end
