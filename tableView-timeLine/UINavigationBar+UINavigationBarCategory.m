//
//  UINavigationBar+UINavigationBarCategory.m
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-13.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import "UINavigationBar+UINavigationBarCategory.h"

@implementation UINavigationBar (UINavigationBarCategory)

- (void)setBackgroundView
{
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height)];
    self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
    [self addSubview:backgroundView];
}

- (void)drawRect:(CGRect)rect
{
    UIImage *img = [UIImage imageNamed: @"NavigationBar.png"];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, CGRectMake(0, 0, 320, self.frame.size.height), img.CGImage);
}

@end
