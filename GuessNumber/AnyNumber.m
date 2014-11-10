//
//  AnyNumber.m
//  GuessNumber
//
//  Created by cyd on 14-11-5.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "AnyNumber.h"

@implementation AnyNumber
-(NSMutableArray *)show {
        NSMutableArray *randomArray=[[NSMutableArray alloc]init];
    do{
    int random=arc4random()%10;
    NSString *randomString=[NSString stringWithFormat:@"%d",random];
        if (![randomArray containsObject:randomString]) {
            [randomArray addObject:randomString];
        }
        
    }while (randomArray.count!=4);
    return randomArray;
}




@end


