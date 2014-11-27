//
//  RandomNumber.m
//  GuessNumber
//
//  Created by cyd on 14-11-5.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "RandomNumber.h"

@implementation RandomNumber

-(NSMutableArray *)creatRandom{
    randomGenerate=[[NSMutableArray alloc]init];
    do{
        int random=arc4random()%10;
        NSString *randomString=[NSString stringWithFormat:@"%d",random];
        if (![randomGenerate containsObject:randomString]) {
            [randomGenerate addObject:randomString];
        }
        
    }while (randomGenerate.count!=4);
    return randomGenerate;
}



@end
