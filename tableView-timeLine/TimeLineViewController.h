//
//  TimeLineViewController.h
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-17.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeLineViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *testArray;
    BOOL isPresentViewBtnPressed;
}

@property (strong, nonatomic)UITableView *qTableView;
@property (strong, nonatomic)UIButton *presentViewBtn;
@property (strong, nonatomic)UIImageView *arrowImgView;

@end
