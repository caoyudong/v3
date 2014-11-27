//
//  TestRandomNumber.m
//  GuessNumber
//
//  Created by cyd on 14-11-5.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "RandomNumber.h"


@interface TestRandomNumber : XCTestCase


@end

@implementation TestRandomNumber

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
- (void) test_randomNumber_whetherRepeat
{
    NSMutableArray *receiveRandonm=[NSMutableArray arrayWithCapacity:0];
    BOOL flag=false;
    RandomNumber *random_number = [[RandomNumber alloc]init];
    receiveRandonm=[random_number creatRandom];
    flag=[self whetherRepeat:flag :receiveRandonm];
    XCTAssertFalse(flag);
}

-(BOOL)whetherRepeat :(BOOL)flag :(NSMutableArray *)receiveRandonm{
    flag=false;
    for (int i=0; i<receiveRandonm.count-1;i++) {
        for (int j=i+1; j<receiveRandonm.count; j++) {
            if ([receiveRandonm[i] isEqualToString:receiveRandonm[j]]) {
                flag=true;
                break;
            }
        }
        
    }
    return flag;
}


@end
