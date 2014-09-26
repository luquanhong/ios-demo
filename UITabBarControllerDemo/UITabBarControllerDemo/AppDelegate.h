//
//  AppDelegate.h
//  UITabBarControllerDemo
//
//  Created by luquanhong on 14-9-24.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

@property (strong, nonatomic) UINavigationController *firstNavController;
@property (strong, nonatomic) UINavigationController *secondNavController;
@property (strong, nonatomic) UINavigationController *thirdNavController;


@end
