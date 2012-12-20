//
//  TimeLineViewController.m
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-17.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "TimeLineViewController.h"
#import "TimeLineTableViewCell.h"

@interface TimeLineViewController ()

@end

@implementation TimeLineViewController

@synthesize qTableView;
@synthesize presentViewBtn;
@synthesize arrowImgView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.qTableView = [[UITableView alloc]initWithFrame:CGRectMake(0.f, 44.f, 320.f, 416.f)];
        self.qTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //趣点列表
	self.qTableView.dataSource = self;
    self.qTableView.delegate = self;
    [self.view addSubview:self.qTableView];
    //头像栏toolBar
    UIToolbar *headBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0.f, 0.f, 320.f, 44.f)];
    [headBar setBackgroundImage:[UIImage imageNamed:@"headBar.png"] forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsDefault];
    NSMutableArray *headBarItemArray = [[NSMutableArray alloc]initWithCapacity:4];
    //头像
    UIButton *headImageBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.f, 0.f, 40.f, 40.f)];
    //描边
    headImageBtn.layer.cornerRadius = 6.f;
    headImageBtn.layer.masksToBounds = NO;
    headImageBtn.layer.borderWidth = 1.f;
    headImageBtn.layer.borderColor = [UIColor whiteColor].CGColor;
//    headImageBtn.layer.shadowColor = [UIColor blackColor].CGColor;
//    headImageBtn.layer.shadowOpacity = 0.4f;
//    headImageBtn.layer.shadowRadius = 4.f;
//    headImageBtn.layer.shadowOffset = CGSizeMake(2.f, 2.f);
    [headImageBtn setBackgroundImage:[UIImage imageNamed:@"profile.png"] forState:UIControlStateNormal];
    [headImageBtn addTarget:self action:@selector(headImageBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *headItem = [[UIBarButtonItem alloc]initWithCustomView:headImageBtn];
    [headBarItemArray addObject:headItem];
    UIBarButtonItem *spaceItem1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [headBarItemArray addObject:spaceItem1];
    //弹出式下拉菜单
    self.presentViewBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.f, 0.f, 140.f, 40.f)];
    [presentViewBtn setBackgroundImage:[UIImage imageNamed:@"button_unselected.png"] forState:UIControlStateNormal];
    [presentViewBtn setTitle:@"我的趣点集" forState:UIControlStateNormal];
    [presentViewBtn setTitleEdgeInsets:UIEdgeInsetsMake(10.f, 10.f, 8.f, 28.f)];
    presentViewBtn.titleLabel.textColor = [UIColor whiteColor];
    presentViewBtn.titleLabel.font = [UIFont systemFontOfSize:20.f];
    presentViewBtn.titleLabel.textAlignment = UITextAlignmentLeft;
    isPresentViewBtnPressed = NO;
    [self presentViewBtnPressed];
    [presentViewBtn addTarget:self action:@selector(presentViewBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *presentViewItem = [[UIBarButtonItem alloc]initWithCustomView:presentViewBtn];
    [headBarItemArray addObject:presentViewItem];
    UIBarButtonItem *spaceItem2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [headBarItemArray addObject:spaceItem2];
    
    [headBar setItems:headBarItemArray animated:YES];
    [self.view addSubview:headBar];
    
    testArray = [[NSArray alloc]initWithObjects:@"微信营销",@"脸皮厚+更自豪",@"真正的贺岁片",@"药企洗牌在即",@"朝鲜火箭发射成功",@"深圳光启研究院",@"APP备案制度",@"移动阅读",@"南京大屠杀75周年",@"U22国足遭绝杀", nil];
    
}

- (void)headImageBtnClicked
{
    NSLog(@"test");
}

- (void)presentViewBtnPressed
{
    //翻转小箭头
    [self.arrowImgView removeFromSuperview];
    UIImage *arrowImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:(isPresentViewBtnPressed)?@"arrow_up":@"arrow_down" ofType:@"png"]];
    self.arrowImgView = [[UIImageView alloc]initWithImage:arrowImg];
    [arrowImgView setFrame:CGRectMake(120.f, 16.f, 8.f, 8.f)];
    [self.presentViewBtn addSubview:arrowImgView];
    isPresentViewBtnPressed = (isPresentViewBtnPressed)?NO:YES;
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//生成cell
- (UIView *)qPointView:(NSString *)text from:(NSInteger)fromIndex
{
    UIView *returnView = [[UIView alloc]initWithFrame:CGRectZero];
    //趣点文本
    UIFont *font = [UIFont systemFontOfSize:15.f];
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(150.f, 1000.f)];
    UILabel *qPointText = [[UILabel alloc]initWithFrame:CGRectMake(16.f, 3.f, size.width+9.f, size.height+6.f)];
    qPointText.backgroundColor = [UIColor clearColor];
    qPointText.font = font;
    qPointText.text = [testArray objectAtIndex:fromIndex];
    qPointText.textColor = [UIColor whiteColor];
    //时间文本
    UILabel *timeText = [[UILabel alloc]init];
    timeText.backgroundColor = [UIColor clearColor];
    timeText.font = [UIFont systemFontOfSize:9.f];
    timeText.textColor = [UIColor colorWithRed:196.f/255.f green:149.f/255.f blue:135.f/255.f alpha:1.f];
    timeText.text = @"1分钟前";
    CGSize timeTextSize = [timeText.text sizeWithFont:timeText.font];
    //通过fromIndex选择不同的图片
    UIImage *qPoint = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:(fromIndex%2)?@"bubbleRight":@"bubbleLeft" ofType:@"png"]];
    UIImageView *qPonitImageView = [[UIImageView alloc]initWithImage:[qPoint stretchableImageWithLeftCapWidth:10 topCapHeight:14]];
    //根据文本调整背景图
    qPonitImageView.frame = CGRectMake(0.f, 0.f, qPointText.frame.size.width+20.f, qPointText.frame.size.height+6.f);
    //通过fromIndex调整位置
    if (fromIndex%2) {
        timeText.frame = CGRectMake(qPointText.frame.size.width-18.f, 30.f, timeTextSize.width, timeTextSize.height);
        [returnView addSubview:timeText];
        returnView.frame = CGRectMake(170.f, 0.f, qPointText.frame.size.width+14.f, qPointText.frame.size.height+10.f);
    }
    else {
        timeText.frame = CGRectMake(10.f, 30.f, timeTextSize.width, timeTextSize.height);
        [returnView addSubview:timeText];
        returnView.frame = CGRectMake(140.f-qPointText.frame.size.width, 0.f, qPointText.frame.size.width+16.f, qPointText.frame.size.height+10.f);
    }
    
    [returnView addSubview:qPonitImageView];
    [returnView addSubview:qPointText];
    return returnView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [testArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 41.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIndentifier = @"Cell";
    TimeLineTableViewCell *cell = (TimeLineTableViewCell *)[self.qTableView dequeueReusableCellWithIdentifier:CellIndentifier];
    if (!cell) {
        cell = [[TimeLineTableViewCell alloc]init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView *qPointView = [self qPointView:[NSString stringWithFormat:@"%@",[testArray objectAtIndex:indexPath.row]] from:indexPath.row];
        [cell.contentView addSubview:qPointView];
    }
    //时间轴线
    UIImage *lineImage = [UIImage imageNamed:@"line.png"];
    UIImageView *lineImageView = [[UIImageView alloc]initWithImage:lineImage];
    lineImageView.frame = CGRectMake(160.0f, 0.0f, 10.0f, 41.0f);
    [cell.contentView addSubview:lineImageView];
    
    return cell;
}

@end
