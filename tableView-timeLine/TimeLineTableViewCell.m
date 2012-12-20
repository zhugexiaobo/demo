//
//  TimeLineTableViewCell.m
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-11.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import "TimeLineTableViewCell.h"

@implementation TimeLineTableViewCell

@synthesize dataLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0.0f, 0.0f, 320.0f, 20.0f);
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
