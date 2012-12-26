//
//  TimeLineViewController.h
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-17.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropdownView.h"
#import "EGORefreshTableHeaderView.h"

@interface TimeLineViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, EGORefreshTableHeaderDelegate>
{
    NSArray *qPointArray;
    NSMutableArray *myArray;
    NSMutableArray *otherArray;
    BOOL isPresentViewBtnPressed;
    id timeLineViewDelegate;
    EGORefreshTableHeaderView *refreshHeaderView;
}

@property (strong, nonatomic)UITableView *qTableView;
@property (strong, nonatomic)UIButton *presentViewBtn;
@property (strong, nonatomic)UIImageView *arrowImgView;
@property (strong, nonatomic)DropdownView *dropdownView;

@property (nonatomic, assign)id timeLineViewDelegate;

@end
