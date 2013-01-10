//
//  UserInfoBarView.m
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-28.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import "UserInfoBarView.h"
#import <QuartzCore/QuartzCore.h>

@interface UserInfoBarView ()

@end

@implementation UserInfoBarView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *userHead = [[UIButton alloc]initWithFrame:CGRectMake(18.0f, 18.0f, 70.0f, 70.0f)];
    [userHead setBackgroundImage:[UIImage imageNamed:@"profile"] forState:UIControlStateNormal];
    //描边
    userHead.layer.cornerRadius = 8.0f;
    userHead.layer.masksToBounds = NO;
    userHead.layer.borderWidth = 1.0f;
    userHead.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:userHead];
    
    UIImageView *checkHead1 = [[UIImageView alloc]initWithFrame:CGRectMake(110.0f, 58.0f, 30.0f, 30.0f)];
    checkHead1.image = [UIImage imageNamed:@"profile"];
    [self.view addSubview:checkHead1];
    UIImageView *checkHead2 = [[UIImageView alloc]initWithFrame:CGRectMake(148.0f, 58.0f, 30.0f, 30.0f)];
    checkHead2.image = [UIImage imageNamed:@"profile"];
    [self.view addSubview:checkHead2];
    UIImageView *checkHead3 = [[UIImageView alloc]initWithFrame:CGRectMake(186.0f, 58.0f, 30.0f, 30.0f)];
    checkHead3.image = [UIImage imageNamed:@"profile"];
    [self.view addSubview:checkHead3];
    UIImageView *checkHead4 = [[UIImageView alloc]initWithFrame:CGRectMake(224.0f, 58.0f, 30.0f, 30.0f)];
    checkHead4.image = [UIImage imageNamed:@"profile"];
    [self.view addSubview:checkHead4];
    
    UIButton *checkBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [checkBtn setFrame:CGRectMake(265.0f, 42.0f, 46.0f, 46.0f)];
    [checkBtn setTitle:@"签到" forState:UIControlStateNormal];
    [checkBtn setTitleColor:[UIColor colorWithRed:0.612 green:0.275 blue:0.176 alpha:1.000] forState:UIControlStateNormal];
    [self.view addSubview:checkBtn];
    
    UILabel *checkNum = [[UILabel alloc]initWithFrame:CGRectMake(112.0f, 22.0f, 100.0f, 20.0f)];
    checkNum.backgroundColor = [UIColor clearColor];
    checkNum.text = @"N个人签到";
    checkNum.textColor = [UIColor whiteColor];
    [self.view addSubview:checkNum];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
