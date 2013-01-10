//
//  QuoteViewController.h
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-25.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoBarView.h"

@interface QuoteViewController : UIViewController
{
    BOOL isFullScreen;
}

@property (strong, nonatomic) UserInfoBarView *userInfoBar;
@property (strong, nonatomic) UISwipeGestureRecognizer *backGesture;
@property (strong, nonatomic) UITapGestureRecognizer *wholePage;
@property (strong, nonatomic) UILabel *quoteText;
@property (strong, nonatomic) UILabel *titleLabel;

@end
