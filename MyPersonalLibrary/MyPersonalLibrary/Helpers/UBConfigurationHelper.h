//
//  UBConfigurationHelper.h
//  MyPersonalLibrary
//
//  Created by 卢泉鸿 on 15/4/30.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UBConfigurationHelper : NSObject


+ (void)setApplicationStartupDefaults;

+ (BOOL)getBoolValueForConfigurationKey:(NSString*)key;

+ (NSString*)getStringValueForConfigurationKey:(NSString*)key;

+ (void)setBoolValueForConfigurationKey:(NSString*)key withValue:(BOOL)value;

+ (void)setStringValueForConfigurationKey:(NSString*)key withValue:(NSString*)value;

@end
