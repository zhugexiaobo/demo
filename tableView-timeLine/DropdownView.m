//
//  DropdownView.m
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-25.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import "DropdownView.h"

@implementation DropdownView
@synthesize dropdownDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
	BOOL res = [super pointInside:point withEvent:event];
	if(!res)
    {
		[self removeFromSuperview];
        [dropdownDelegate arrowChange:NO];
    }
	return res;
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    //    NSSet * arr = [event allTouches];
    //    UITouch *touch  = [arr anyObject];
	UIView *view = [super hitTest:point withEvent:event];
	if(view == self)
	{
		[self removeFromSuperview];
        [dropdownDelegate arrowChange:NO];
	}
	return view;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
