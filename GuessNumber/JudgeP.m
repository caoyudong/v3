//
//  JudgeP.m
//  GuessNumber
//
//  Created by cyd on 14-11-12.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "JudgeP.h"

@implementation JudgeP



-(NSMutableArray *)judge :(NSMutableArray *)nsarray :(NSMutableArray *)randomtrueArray{
    int correct=0;
    int contain=0;
    int all=0;
    
    
    NSMutableArray *systemnumbers=randomtrueArray;
    
    
    for (int i=0; i<systemnumbers.count; i++) {
        if([systemnumbers[i] isEqualToString:nsarray[i]]){
            correct++;
        }
    }
    for (int i=0; i<nsarray.count; i++) {
        for (int j=0;j<systemnumbers.count;j++) {
            if ([nsarray[i] isEqualToString:systemnumbers[j]] ) {
                all++;
                contain=all-correct;
            }
        }
    }
    NSString *strcorrect=[NSString stringWithFormat:@"%d",correct];
    NSString *strcontain=[NSString stringWithFormat:@"%d",contain];
    NSMutableArray *result=[[NSMutableArray alloc]initWithObjects:strcorrect,strcontain,nil];
    
    
    return result;
}



@end
