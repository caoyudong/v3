//
//  ViewController.m
//  GuessNumber
//
//  Created by cyd on 14-11-5.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "IndexController.h"

@interface IndexController ()

@end

@implementation IndexController
@synthesize randomtrueArray;
int flag=0;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    m_textfiledInput=[self createLabelts:CGRectMake(120, 120, 130, 30) :[UIColor whiteColor]];
    m_textfiledInput.delegate=self;
    
    [self setGuessWithTarget:self andSEL:@selector(click:)];
    m_labelInfo=[[UILabel alloc]initWithFrame:CGRectMake(200, 150, 100, 50)];
    [self.view addSubview:m_labelInfo];
    [self randomTrue];
}


-(void)click :(id)sender{
        NSMutableArray *systemnumbers=self.randomtrueArray;
    NSLog(@"%@",systemnumbers);
        NSLog(@"%d---^^^-",flag);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"厉害！" message:@"您猜对了" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    NSString *textfiledValue=m_textfiledInput.text;
    int intTextfiledValueFirst=[[textfiledValue substringWithRange:NSMakeRange(0,1)] intValue];
    int intTextfiledValueSecond=[[textfiledValue substringWithRange:NSMakeRange(1,1)] intValue];
    int intTextfiledValueThird=[[textfiledValue substringWithRange:NSMakeRange(2,1)] intValue];
    int intTextfiledValueFourth=[[textfiledValue substringWithRange:NSMakeRange(3,1)] intValue];
    
    NSString *strValueFirst=[NSString stringWithFormat:@"%d",intTextfiledValueFirst];
    NSString *strValueSecond=[NSString stringWithFormat:@"%d",intTextfiledValueSecond];
    NSString *strValueThird=[NSString stringWithFormat:@"%d",intTextfiledValueThird];
    NSString *strValueFourth=[NSString stringWithFormat:@"%d",intTextfiledValueFourth];
    
    NSLog(@"%@--@@!!!!@@",strValueFirst);
    NSMutableArray *valueArray=[[NSMutableArray alloc]initWithObjects:strValueFirst,strValueSecond,strValueThird,strValueFourth, nil];
    
    NSMutableArray *result=[self judge:valueArray];
    NSString *resultFirst=result[0];
    if ([resultFirst isEqualToString:@"4"]){
        [alert show];
        m_textfiledInput.text=Nil;
        flag=0;
        [self randomTrue];
            NSLog(@"%@",self.randomtrueArray);
    }    NSString *resultSecond=result[1];

    
    NSString *letterA=@"A";
    NSString *letterB=@"B";
   NSString *halfLeft=[resultFirst stringByAppendingString:letterA];
   NSString *halfRight=[resultSecond stringByAppendingString:letterB];
    NSString *prompt=[halfLeft stringByAppendingString:halfRight];
    
    m_labelInfo.text=prompt;
    flag++;
    if(flag==6){
    m_labelInfo.text=@"游戏失败！！";
    m_textfiledInput.text=Nil;
    }
    if (flag>6) {
        exit(0);
    }
}

-(NSMutableArray *)judge :(NSMutableArray *)nsarray{
    int correct=0;
    int contain=0;
    int all=0;
        //AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSMutableArray *systemnumbers=self.randomtrueArray;

    
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

-(void)randomTrue{
   self.randomtrueArray=[[NSMutableArray alloc]init];
    do{
        int random=arc4random()%10;
        NSString *randomString=[NSString stringWithFormat:@"%d",random];
        if (![self.randomtrueArray containsObject:randomString]) {
            [self.randomtrueArray addObject:randomString];
        }
        
    }while (self.randomtrueArray.count!=4);
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
