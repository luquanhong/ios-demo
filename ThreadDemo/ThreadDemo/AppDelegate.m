//
//  AppDelegate.m
//  ThreadDemo
//
//  Created by 卢泉鸿 on 15/3/13.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    tickets = 100;
    count =0;
    
    lock = [[NSLock alloc] init];
    conditon = [[NSCondition alloc] init];
    
//    thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
//    [thread1 setName:@"Thread-1"];
//    [thread1 start];
//    
//    thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
//    [thread2 setName:@"Thread-2"];
//    [thread2 start];
    
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

#pragma mark - commond method

- (void)run{
    
    @synchronized(self){
    
        while (TRUE) {
            //[lock lock];
            if (tickets > 0) {
                count = 100 - tickets;
                [NSThread sleepForTimeInterval:0.9];
                tickets--;
                NSLog(@"current ticket is %d sale is %d name is %@", tickets, count, [[NSThread currentThread] name]);
            }else{
                break;
            }
            //[lock unlock];
        }
    }
}

@end
