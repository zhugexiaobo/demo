//
//  DropdownView.h
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-25.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol toTimeLineDelegate <NSObject>

- (void)arrowChange:(BOOL)downOrUp;

@end

@interface DropdownView : UIButton
{
    id dropdownDelegate;
}

@property (nonatomic)id dropdownDelegate;

@end
