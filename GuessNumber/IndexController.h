//
//  ViewController.h
//  GuessNumber
//
//  Created by cyd on 14-11-5.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface IndexController : UIViewController <UITextFieldDelegate>{
    UILabel *m_labelInfo;
    UITextField *m_textfiledInput;
    
}
@property NSMutableArray *randomtrueArray;
@end

