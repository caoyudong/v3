//
//  RandomNumber.h
//  GuessNumber
//
//  Created by cyd on 14-11-5.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomNumber : NSObject
{
    NSMutableArray *randomGenerate;
}

//-(id)init :(NSMutableArray *)xrandomArray;
-(NSMutableArray *)creatRandom;

@end
