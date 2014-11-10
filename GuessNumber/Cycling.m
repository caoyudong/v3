//
//  Cycling.m
//  GuessNumber
//
//  Created by cyd on 14-11-7.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "Cycling.h"

@implementation Cycling
-(int)enoughTimes :(NSMutableArray *)resultab :(int)chance{
    AnyNumber *anynumber=[[AnyNumber alloc]init];
        NSMutableArray *fixed=[[NSMutableArray alloc]initWithObjects:@"1",@"3",@"6",@"8",nil];
    int flag=0;
    NSMutableArray *resultbiz=[[NSMutableArray alloc]init];
    do{
        int correct=0;
        int contain=0;
        int all=0;

        NSMutableArray *random=anynumber.show;

        for (int i=0; i<fixed.count; i++) {
            if([fixed[i] isEqualToString:random[i]]){
                correct++;
            }
        }
        for (int i=0; i<random.count; i++) {
            for (int j=0;j<fixed.count;j++) {
                if ([random[i] isEqualToString:fixed[j]] ) {
                    all++;
                    contain=all-correct;
                }
            }
        }
        NSString *strcorrect=[NSString stringWithFormat:@"%d",correct];
        NSString *strcontain=[NSString stringWithFormat:@"%d",contain];
        NSMutableArray *result=[[NSMutableArray alloc]initWithObjects:strcorrect,strcontain,nil];
        resultbiz=result;
        flag++;
        
        
    }while([resultab isEqualToArray:resultbiz] || flag<chance);
    return flag;
}


@end
