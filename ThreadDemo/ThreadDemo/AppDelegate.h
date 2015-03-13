//
//  AppDelegate.h
//  ThreadDemo
//
//  Created by 卢泉鸿 on 15/3/13.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{

    int tickets;
    int count;
    NSThread *thread1;
    NSThread *thread2;
    NSLock *lock;
    NSCondition *conditon;
}

@property (strong, nonatomic) UIWindow *window;


@end

