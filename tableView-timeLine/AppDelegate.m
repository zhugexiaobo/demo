//
//  AppDelegate.m
//  tableView-timeLine
//
//  Created by xiaobo.zhuge on 12-12-11.
//  Copyright (c) 2012年 xiaobo.zhuge. All rights reserved.
//

#import "AppDelegate.h"
#import "TimeLineViewController.h"

//#define kSCNavBarImageTag 10

@implementation AppDelegate

@synthesize timeLineViewController;
@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.timeLineViewController = [[TimeLineViewController alloc]init];
    self.navigationController = [[UINavigationController alloc]initWithRootViewController:self.timeLineViewController];
//    //自定义navigationBar
//    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
//    {
//        //if iOS 5.0 and later
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavigationBar.png"] forBarMetrics:UIBarMetricsDefault];
//    }
//    else
//    {
//        UIImageView *imageView = (UIImageView *)[self.navigationController.navigationBar viewWithTag:kSCNavBarImageTag];
//        if (imageView == nil)
//        {
//            imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NavigationBar.png"]];
//            [imageView setTag:kSCNavBarImageTag];
//            [self.navigationController.navigationBar insertSubview:imageView atIndex:0];
//        }
//    }
    [self.window setRootViewController:self.navigationController];
//    [self.window setRootViewController:self.timeLineViewController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
