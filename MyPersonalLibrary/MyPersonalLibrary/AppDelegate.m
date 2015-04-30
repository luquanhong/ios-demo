//
//  AppDelegate.m
//  MyPersonalLibrary
//
//  Created by 卢泉鸿 on 15/4/29.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)installCrashHandler{
    InstallCrashExceptionHandler();
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    if (![UBConfigurationHelper getBoolValueForConfigurationKey:bUBFirstLaunch]) {
//        [UBConfigurationHelper setApplicationStartupDefaults];
//    }
    
    if (bUBInstallCrashHandler) {
        [self performSelector:@selector(installCrashHandler) withObject:nil afterDelay:0];
    }
    
    
    
//    RegistrationViewController *regVC = [[RegistrationViewController alloc] initWithNibName:@"RegistrationViewController" bundle:nil];
//    LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"UBLoginViewController" bundle:nil];
//    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
    
    if (bUBActiviteGPSOnStartUp) {
        // location
    }
    
    if (bUBRegistrationRequired && ![UBConfigurationHelper getBoolValueForConfigurationKey:bUBRegistered]) {
        self.regVC = [[RegistrationViewController alloc] initWithNibName:@"RegistrationViewController" bundle:nil];
        self.regVC.delegate = self;
        self.navC = [[UINavigationController alloc] initWithRootViewController:self.regVC];
    }else{
        if (bUBLoginRequired) {
            self.logVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
            self.logVC.delegate = self;
            self.navC = [[UINavigationController alloc] initWithRootViewController:self.logVC];
        }else{
            self.mainVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
            self.navC = [[UINavigationController alloc] initWithRootViewController:self.mainVC];
        }
    }
    
    self.window.rootViewController = self.navC;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - deleagte

- (void)registeredWithSuccess{
    
    if (bUBShowLginAfterRegistration) {
        self.logVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        self.logVC.delegate = self;
        self.navC = [[UINavigationController alloc] initWithRootViewController:self.logVC];
    }else{
        self.mainVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
        self.navC = [[UINavigationController alloc] initWithRootViewController:self.mainVC];
    }
    
    self.window.rootViewController = self.navC;
    [self.window makeKeyAndVisible];
}

- (void)registeredWithError{

}

- (void)cancelRegistration{

}

- (void)loginWithSuccess{

    self.mainVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    self.navC = [[UINavigationController alloc] initWithRootViewController:self.mainVC];
    self.window.rootViewController = self.navC;
    [self.window makeKeyAndVisible];
}

- (void)loginWithError{

}

- (void)loginWithCancel{

}

@end
