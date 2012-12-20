//
//  TimeLineTableViewController.m
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-11.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import "TimeLineTableViewController.h"
#import "TimeLineTableViewCell.h"

@interface TimeLineTableViewController ()

@end

@implementation TimeLineTableViewController
@synthesize qTableView;

- (id)initWithStyle:(UITableViewStyle)style
{
    //self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.qTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    //背景
//    UIImageView *backImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"IMG_0022.JPG"]];
//    self.tableView.backgroundView = backImg;

    self.qTableView.dataSource = self;
    self.qTableView.delegate = self;
    self.qTableView = [[UITableView alloc]initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 416.0f)];
    self.qTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:qTableView];
    
//    //头像栏toolbar
//    UIToolbar *headBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)];
//    headBar.barStyle = UIBarStyleDefault;
//    [self.view addSubview:headBar];
    
    testArray = [[NSArray alloc]initWithObjects:@"微信营销",@"脸皮厚+更自豪",@"真正的贺岁片",@"药企洗牌在即",@"朝鲜火箭发射成功",@"深圳光启研究院",@"APP备案制度",@"移动阅读",@"南京大屠杀75周年",@"U22国足遭绝杀", nil];
    
    [self.qTableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//生成泡泡框
- (UIView *)bubbleView:(NSString *)text from:(NSInteger)fromIndex
{
	UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
    
	//通过fromIndex判断消息来源，选择不同的图片
	UIImage *bubble = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(fromIndex%2)?@"bubbleRight":@"bubbleLeft" ofType:@"png"]];
	UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:[bubble stretchableImageWithLeftCapWidth:10 topCapHeight:16]];
	
    //文本的文字大小
	UIFont *font = [UIFont systemFontOfSize:15.0f];
    //约束文本框的尺寸，并自动换行
	CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(150.0f, 1000.0f) lineBreakMode:NSLineBreakByCharWrapping];
	//初始化趣点文本
	UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(16.0f, 3.0f, size.width+9.0f, size.height+6.0f)];
	bubbleText.backgroundColor = [UIColor clearColor];
	bubbleText.font = font;
    bubbleText.textColor = [UIColor whiteColor];
    bubbleText.text = [testArray objectAtIndex:fromIndex];
    
    //初始化时间文本
    UILabel *timeText = [[UILabel alloc]init];
    timeText.backgroundColor = [UIColor clearColor];
    timeText.font = [UIFont systemFontOfSize:9.0f];
    timeText.textColor = [UIColor colorWithRed:(196.0f/255.0f) green:(149.0f/255.0f) blue:(135.0f/255.0f) alpha:1.0f];
    timeText.text = @"1分钟前";
    CGSize timeTextSize = [timeText.text sizeWithFont:timeText.font];

	//根据文本调整图片尺寸
	bubbleImageView.frame = CGRectMake(0.0f, 0.0f, bubbleText.frame.size.width+20.0f, bubbleText.frame.size.height+6.0f);
    
	//通过fromIndex判断消息来源，调整位置
    if(fromIndex%2)
    {
        timeText.frame = CGRectMake(bubbleText.frame.size.width-18.0f, 30.0f, timeTextSize.width, timeTextSize.height);
        [returnView addSubview:timeText];
		returnView.frame = CGRectMake(170.0f, 0.0f, bubbleText.frame.size.width+14.0f, bubbleText.frame.size.height+10.0f);
    }
	else
    {
        timeText.frame = CGRectMake(10.0f, 30.0f, timeTextSize.width, timeTextSize.height);
        [returnView addSubview:timeText];
		returnView.frame = CGRectMake(140.0f-bubbleText.frame.size.width, 0.0f, bubbleText.frame.size.width+16.0f, bubbleText.frame.size.height+10.0f);
    }
    
	[returnView addSubview:bubbleImageView];
	[returnView addSubview:bubbleText];
	
	return returnView;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [testArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 41.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TimeLineTableViewCell *cell = (TimeLineTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[TimeLineTableViewCell alloc]init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView *QPointView = [self bubbleView:[NSString stringWithFormat:@"%@",[testArray objectAtIndex:indexPath.row]] from:indexPath.row];
        [cell.contentView addSubview:QPointView];
    }
    
    //时间轴的线
    UIImage *lineImage = [UIImage imageNamed:@"line.png"];
    UIImageView *lineImageView = [[UIImageView alloc]initWithImage:lineImage];
    lineImageView.frame = CGRectMake(160.0f, 0.0f, 10.0f, 44.0f);
    [cell.contentView addSubview:lineImageView];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *testAlert = [[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"%@",[testArray objectAtIndex:indexPath.row]] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [testAlert show];
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
