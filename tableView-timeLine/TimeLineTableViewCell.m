//
//  TimeLineTableViewCell.m
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-11.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import "TimeLineTableViewCell.h"

@implementation TimeLineTableViewCell

//@synthesize tintColor;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (void)drawRect:(CGRect)rect {
//	[super drawRect:rect];
//	
//	CGContextRef context = UIGraphicsGetCurrentContext();
//	
//	//NSLog(@"%f,%f",rect.size.height,rect.size.width);
//	// draw bottom Edage
//	CGContextSetLineWidth(context, 1.0);
//	CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
//	CGContextMoveToPoint(context, 0.0, rect.size.height);
//	CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
//	CGContextStrokePath( context );
//	
//	//	UIColor *speColor  = [[UIColor colorWithRed:0.89 green:0.80 blue:0.70 alpha:1.0] retain];
//	UIColor *speColor  = [[UIColor colorWithWhite:0.746 alpha:1.000] retain];
//	
//	CGContextSetLineWidth(context, 1);
//	CGContextSetStrokeColorWithColor(context, speColor.CGColor);
//	CGContextMoveToPoint(context, 0.0, rect.size.height-1.5);
//	CGContextAddLineToPoint(context, rect.size.width, rect.size.height-1.5);
//	CGContextStrokePath( context );
//	
//	CGContextSetFillColorWithColor(context, self.tintColor.CGColor);
//	CGContextAddRect(context, CGRectMake(0.0, 0.0, rect.size.width, rect.size.height-2));
//	CGContextFillPath(context);
//}

@end
