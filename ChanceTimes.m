//
//  ChanceTimes.m
//  GuessNumber
//
//  Created by cyd on 14-11-13.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "ChanceTimes.h"
#import "RandomNumber.h"
#import "ResultCheck.h"
@implementation ChanceTimes
    
- (NSString *)resultBytimes :(NSString *)result :(int)flag
{
    
    if ([result isEqualToString:@"4A0B"]&&flag<=6)
        result=@"sucess";
    else if (![result isEqualToString:@"4A0B"]&&flag==6)
        result=@"fail";

    return result;
}


@end
