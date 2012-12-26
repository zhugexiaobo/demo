//
//  AppDelegate.h
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-11.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TimeLineViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TimeLineViewController *timeLineViewController;
@property (strong, nonatomic) UINavigationController  *navigationController;

@end
