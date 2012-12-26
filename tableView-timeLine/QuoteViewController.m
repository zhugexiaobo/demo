//
//  QuoteViewController.m
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-25.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import "QuoteViewController.h"

#define kSCNavBarImageTag 10

@interface QuoteViewController ()

@end

@implementation QuoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    //自定义navigationBar
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        //if iOS 5.0 and later
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavigationBar.png"] forBarMetrics:UIBarMetricsDefault];
    }
    else {
        UIImageView *imageView = (UIImageView *)[self.navigationController.navigationBar viewWithTag:kSCNavBarImageTag];
        if (imageView == nil) {
            imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NavigationBar.png"]];
            [imageView setTag:kSCNavBarImageTag];
            [self.navigationController.navigationBar insertSubview:imageView atIndex:0];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
