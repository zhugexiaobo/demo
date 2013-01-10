//
//  QuoteViewController.m
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-25.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import "QuoteViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface QuoteViewController ()

@end

@implementation QuoteViewController
@synthesize userInfoBar;
@synthesize backGesture;
@synthesize wholePage;
@synthesize quoteText;
@synthesize titleLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    
    //手势
    self.backGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(backToIndex)];
    [self.backGesture setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:self.backGesture];
    self.wholePage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(wholePageView)];
    self.wholePage.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:self.wholePage];

    self.userInfoBar = [[UserInfoBarView alloc]init];
    self.userInfoBar.view.frame = CGRectMake(0.0f, 0.0f, 320.0f, 150.0f);
    self.userInfoBar.view.backgroundColor = [UIColor colorWithRed:0.612 green:0.275 blue:0.176 alpha:1.000];
    //阴影
    self.userInfoBar.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.userInfoBar.view.layer.shadowOpacity = 0.6f;
    self.userInfoBar.view.layer.shadowOffset = CGSizeMake(0.0f, 1.5f);
    [self.view addSubview:userInfoBar.view];
    
    self.quoteText = [[UILabel alloc]initWithFrame:CGRectMake(20.0f, 125.0f, 280.0f, 240.0f)];
    quoteText.backgroundColor = [UIColor clearColor];
    quoteText.textAlignment = UITextAlignmentLeft;
    quoteText.numberOfLines = 0;
    quoteText.text = @"两年多来一直依靠自我蛮荒生长的移动互联网终于受到有关部门的注意，迎来一轮监管“风潮”。日前，工信部电信经济专家委员会秘书长陈金桥在接受媒体采访时表示：“工信部正在建立一个长效的评估体系，对智能手机应用程序、内置软件进行评估和抽查。要将第三方平台纳入管理，成立要备案，运行要监管。尤其对个人应用开发者要纳入管理体系，如做实名认证等。”";
    //[quoteText addGestureRecognizer:self.wholePage];
    [self.view addSubview:quoteText];
    
    isFullScreen = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backToIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)wholePageView
{
    if (isFullScreen) {
        self.navigationController.navigationBarHidden = YES;
        [self.userInfoBar.view setHidden:YES];
        self.quoteText.frame = CGRectMake(20.0f, 90.0f, 280.0f, 440.0f);
        [self.quoteText sizeToFit];
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20.0f, 20.0f, 280.0f, 50.0f)];
        titleLabel.text = @"标  题";
        titleLabel.font = [UIFont systemFontOfSize:24.0f];
        titleLabel.textAlignment = UITextAlignmentCenter;
        [self.view addSubview:titleLabel];
    }
    else if (!isFullScreen) {
        self.navigationController.navigationBarHidden = NO;
        [self.userInfoBar.view setHidden:NO];
        [self.titleLabel removeFromSuperview];
        self.quoteText.frame = CGRectMake(20.0f, 125.0f, 280.0f, 240.0f);
    }
    isFullScreen = isFullScreen?NO:YES;
}

@end
