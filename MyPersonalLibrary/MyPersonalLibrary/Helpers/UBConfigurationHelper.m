//
//  UBConfigurationHelper.m
//  MyPersonalLibrary
//
//  Created by 卢泉鸿 on 15/4/30.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "UBConfigurationHelper.h"

@implementation UBConfigurationHelper


+ (void)setApplicationStartupDefaults{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [defaults setBool:NO forKey:bUBFirstLaunch];
    [defaults setBool:NO forKey:bUBAuthenticated];
    [defaults synchronize];
}

+ (BOOL)getBoolValueForConfigurationKey:(NSString*)key{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    return [defaults boolForKey:key];
}

+ (NSString*)getStringValueForConfigurationKey:(NSString*)key{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    return [defaults stringForKey:key]? [defaults stringForKey:key]: @"";
}

+ (void)setBoolValueForConfigurationKey:(NSString*)key withValue:(BOOL)value {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [defaults setBool:value forKey: key];
    [defaults synchronize];
}

+ (void)setStringValueForConfigurationKey:(NSString*)key withValue:(NSString*)value {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [defaults setValue:value forKey: key];
    [defaults synchronize];
}


@end
