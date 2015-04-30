//
//  UBCrashHandler.h
//  MyPersonalLibrary
//
//  Created by 卢泉鸿 on 15/4/30.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UBCrashHandler : NSObject{
    BOOL dismissed;
}

void InstallCrashExceptionHandler();

@end
