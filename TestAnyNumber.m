//
//  TestAnyNumber.m
//  GuessNumber
//
//  Created by cyd on 14-11-5.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AnyNumber.h"

@interface TestAnyNumber : XCTestCase
//-(void)show;
- (void)test_any_number;
@end

@implementation TestAnyNumber

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
- (void)test_any_number{
    AnyNumber *anynumber=[[AnyNumber alloc]init];
    BOOL flag=true;
    NSMutableArray *numbers=[NSMutableArray arrayWithCapacity:0];
    numbers=[anynumber show];
    for (int i=0; i<numbers.count-1; i++) {
        for (int j=i+1; j<numbers.count; j++) {
            if ([numbers[i] isEqualToString: numbers[j]]) {
                flag=false;
            }
        }
    }
    NSLog(@"%@------$$$$$$_@@&&#@$$",numbers);
    XCTAssertTrue(flag);
    
}
@end
