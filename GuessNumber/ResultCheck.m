//
//  Judge.m
//  GuessNumber
//
//  Created by cyd on 14-11-5.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "ResultCheck.h"
#import "AnyNumber.h"
//#import "AppearAB.h"
@implementation ResultCheck

-(id)init :(NSString *)stringWriteNumber :(NSMutableArray *)xsystemNumber {
    self=[super init];
    if (self) {
        systemNumber=xsystemNumber;
        writeNumber=stringWriteNumber;
    }
    return self;
}


-(NSString *)JudgeAandB{
    
    NSMutableArray *writeAfterNumber=[NSMutableArray arrayWithCapacity:0];
    
    for (int i=0; i<writeNumber.length; i++) {
        [writeAfterNumber addObject:[writeNumber substringWithRange:NSMakeRange(i,1)]] ;
        
    }
   NSArray *resultaAndbCount=[self statistics_AB_count:writeAfterNumber];
    
    NSString *strAcount=resultaAndbCount[0];
    NSString *strBcount=resultaAndbCount[1];
    
    NSString *result=[NSString stringWithFormat:@"%@%@%@%@",strAcount,@"A",strBcount,@"B"];

    
    return result;
}


- (void)processAandBcount :(NSMutableArray *)writeAfterNumber :(int *)acount :(int *)bcount
{
    for (int i=0; i<writeAfterNumber.count; i++) {
        for (int j=0;j<systemNumber.count;j++) {
            if ([writeAfterNumber[i] isEqualToString:systemNumber[j]] )
            {
                (*bcount)++;
                if (i == j)
                {
                    (*acount) ++;
                    (*bcount) --;
                }
            }
        }
    }
}


-(NSArray *)statistics_AB_count :(NSMutableArray *)writeAfterNumber
{

    int bCount=0;
    int aCount=0;
    
    [self processAandBcount:writeAfterNumber :&aCount :&bCount];
    
    NSString *straCount=[NSString stringWithFormat:@"%d",aCount];
    NSString *strbCount=[NSString stringWithFormat:@"%d",bCount];
    NSArray *resultAndbCount=[[NSArray alloc]initWithObjects:straCount,strbCount, nil];
    return resultAndbCount;
}



@end
