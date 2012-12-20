//
//  TimeLineTableViewController.h
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-11.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeLineTableViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSArray *testArray;
}

@property (strong, nonatomic)UITableView *qTableView;

@end
