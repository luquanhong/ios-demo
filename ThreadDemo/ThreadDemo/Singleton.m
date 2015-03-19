//
//  Singleton.m
//  ThreadDemo
//
//  Created by 卢泉鸿 on 15/3/14.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "Singleton.h"

static Singleton *instance = nil;

@implementation Singleton


//1
//+ (Singleton*)shareInstance{
//
//    if (instance == nil) {
//        instance = [[super allocWithZone:nil] init];
//    }
//    
//    return instance;
//}
//
//+ (id)allocWithZone:(struct _NSZone *)zone{
//
//    NSLog(@"allocWithZone");
//    return [self shareInstance];
//}
//
//- (id)copyWithZone:(NSZone*)zone{
//
//    NSLog(@"copyWithZone");
//    return self;
//}
//
//- (id)init{
//
//    NSLog(@"init 1");
//    if (instance) {
//        return instance;
//    }
//     NSLog(@"init 2");
//    self = [super init];
//    if (self) {
//        //
//    }
//    return self;
//}

//2
//+ (Singleton*)shareInstance{
//    NSLog(@"shareInstance");
//    return instance;
//}
//
//+ (void)initialize{
//
//    NSLog(@"initialize");
//    if (self == [Singleton class]) {
//        instance = [[self alloc] init];
//    }
//}
//
//+ (id)allocWithZone:(struct _NSZone *)zone{
//
//    NSLog(@"allocWithZone");
//    return [self shareInstance];
//}
//
//- (id)copyWithZone:(NSZone*)zone{
//
//    NSLog(@"copyWithZone ");
//    return self;
//}


//3
//+ (Singleton*)shareInstance{
//
//    NSLog(@"shareInstance");
//    @synchronized(self){
//    
//        if (instance == nil) {
//            instance = [[self alloc] init];
//        }
//    }
//    
//    return instance;
//}
//
//+ (id)allocWithZone:(struct _NSZone *)zone{
//
//    NSLog(@"allocWithZone");
//    @synchronized(self){
//    
//        if (instance == nil) {
//            instance = [super allocWithZone:zone];
//            return instance;
//        }
//    }
//    return nil;
//}
//
//- (id)copyWithZone:(NSZone*)zone{
//    return self;
//}

//4
+ (id)shareInstance{

    static dispatch_once_t pred = 0;
    __strong static id shareObject = nil;
    dispatch_once(&pred, ^{
        shareObject = [[self alloc] init];
    });
    
    return shareObject;
}



@end
