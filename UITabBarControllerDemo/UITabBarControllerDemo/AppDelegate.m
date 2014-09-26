//
//  AppDelegate.m
//  UITabBarControllerDemo
//
//  Created by luquanhong on 14-9-24.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@implementation AppDelegate

@synthesize tabBarController;
@synthesize firstNavController;
@synthesize secondNavController;
@synthesize thirdNavController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    
//    tabBarController = [[UITabBarController alloc] init];
//    [self.window setRootViewController:tabBarController];
//    
//    FirstViewController *first = [[FirstViewController alloc] init];
//    SecondViewController *second = [[SecondViewController alloc] init];
//    
//    tabBarController.viewControllers = [NSArray arrayWithObjects:first,second, nil];
////    [first release];
////    [second release];
//    
//    //设置TabBar与TabBarItem
//    UITabBar *tabBar = tabBarController.tabBar;
//    UITabBarItem *item1 = [tabBar.items objectAtIndex:0];
//    UITabBarItem *item2 = [tabBar.items objectAtIndex:1];
//    
//    item1.title = @"Home";
//    item2.title = @"Maps";
    
    
    FirstViewController *firstViewController = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    SecondViewController *secondViewController = [[SecondViewController alloc] initWithNibName: @"SecondViewController" bundle:nil];
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    
    firstNavController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    secondNavController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
    thirdNavController = [[UINavigationController alloc] initWithRootViewController:thirdViewController];
    
    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    UITabBarItem *thirdItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    
    firstViewController.tabBarItem = firstItem;
    secondViewController.tabBarItem = secondItem;
    thirdViewController.tabBarItem = thirdItem;
    
    tabBarController = [[UITabBarController alloc] init];
    NSArray *itemArray = [NSArray arrayWithObjects:firstNavController,secondNavController, thirdNavController, nil];
    tabBarController.viewControllers = itemArray;
    
    [self.window addSubview:tabBarController.view];
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
