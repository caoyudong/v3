//
//  Xu.m
//  GuessNumber
//
//  Created by cyd on 14-11-13.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "Xu.h"

@implementation Xu
-(void)print{
    int num=3;
    Xc *xc=[[Xc alloc]init];
    [xc change:num];
    NSLog(@"%d",num);
}
@end
