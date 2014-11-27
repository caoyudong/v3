//
//  Judge.h
//  GuessNumber
//
//  Created by cyd on 14-11-5.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultCheck : NSObject{
    NSMutableArray *systemNumber;
    NSString *writeNumber;
    
}

-(id)init :(NSString *)stringWriteNumber :(NSMutableArray *)systemNumber;
-(NSString *)JudgeAandB;
@end
