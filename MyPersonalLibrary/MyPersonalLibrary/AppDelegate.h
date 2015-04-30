//
//  AppDelegate.h
//  MyPersonalLibrary
//
//  Created by 卢泉鸿 on 15/4/29.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistrationViewController.h"
#import "UBConfigurationHelper.h"
#import "LoginViewController.h"
#import "UBCrashHandler.h"
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UBLoginViewControllerDelegate, RegistrationViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RegistrationViewController *regVC;
@property (strong, nonatomic) LoginViewController *logVC;
@property (strong, nonatomic) MainViewController *mainVC;

@property (strong, nonatomic) UINavigationController *navC;

@end

