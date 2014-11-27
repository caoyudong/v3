//
//  ViewController.m
//  GuessNumber
//
//  Created by cyd on 14-11-5.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "IndexController.h"
#import "RandomNumber.h"
#import "ResultCheck.h"
#import "ChanceTimes.h"
@interface IndexController ()

@end

@implementation IndexController
@synthesize randomtrueArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    flag=0;
    [self random];
    self.view.backgroundColor=[UIColor whiteColor];
    m_textfiledInput=[self createLabelts:CGRectMake(120, 120, 150, 30) :[UIColor whiteColor]];
    m_textfiledInput.placeholder=@"输入4位不同数字";
    m_textfiledInput.delegate=self;
    
    [self setGuessWithTarget:self andSEL:@selector(clickGuess:)];
    m_labelInfo=[[UILabel alloc]initWithFrame:CGRectMake(200, 150, 100, 50)];
    [self.view addSubview:m_labelInfo];
    
}

-(void)random{
    RandomNumber *random=[[RandomNumber alloc]init];
    randomtrueArray=[random creatRandom];
}

-(void)clickGuess :(id)sender
{
    flag++;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"厉害！" message:@"您猜对了" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    NSString *textfiledValue=m_textfiledInput.text;
    ResultCheck *resultCheck=[[ResultCheck alloc]init:textfiledValue :self.randomtrueArray];
    NSString *result=[resultCheck JudgeAandB];
    
    ChanceTimes *chanceTimes=[[ChanceTimes alloc]init];
    NSString * content=[chanceTimes resultBytimes:result :flag];
    m_labelInfo.text=result;
    
    [self contentSucess:content :alert];
    [self contentFail:content];
}


-(void)contentSucess :(NSString *)content :(UIAlertView *)alert{
    if ([content isEqualToString:@"sucess"]) {
        [alert show];
        m_labelInfo.text=content;
        [self random];
        m_textfiledInput.text=nil;
    }

}


-(void)contentFail :(NSString *)content{
    if ([content isEqualToString:@"fail"])
    {
        m_labelInfo.text=@"游戏失败";
        m_textfiledInput.text=nil;
        [self random];
    }
}



////////////////////////
- (UITextField *)createLabelts :(CGRect)frame  :(UIColor *)labelColor
{
    
    UITextField *textfiled=[[UITextField alloc]initWithFrame:frame];
    textfiled.backgroundColor = labelColor;
    textfiled.borderStyle = UITextBorderStyleRoundedRect;
    textfiled.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:textfiled];
    return textfiled;
}

- (BOOL)setGuessWithTarget:(id)target andSEL:(SEL)selGuess{
    UIButton *buttonGuess=[[UIButton alloc]initWithFrame:CGRectMake(100, 150, 100, 50)];
    [buttonGuess setTitle:@"猜你妹" forState:UIControlStateNormal];
    [buttonGuess setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [self.view addSubview:buttonGuess];
    [buttonGuess addTarget:target action:selGuess forControlEvents:UIControlEventTouchUpInside];
    return YES;
}


-(bool)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if([string isEqualToString:@"\n"]){
        return YES;
    }
    
    NSString *toString=[textField.text stringByReplacingCharactersInRange:range withString:string];
    if (m_textfiledInput==textField) {
        if([toString length]>4){
           textField.text=[toString substringToIndex:4];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"填写的数字不能超过4位" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            return NO;
        }
        
        }

    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
