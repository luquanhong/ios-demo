//
//  Diary.m
//  MyDiary
//
//  Created by luquanhong on 14-8-21.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "Diary.h"

@implementation Diary

+ (id)createData
{
    Diary *newDiary = [[Diary alloc] init];
    
    return newDiary;
}

- (id)init
{
    
//    self = [super init];
//    
//    if(self)
//    {
//        [self setTitle:@""];
//        [self setContent:@""];
//        _dataCreate = [[NSData alloc] init];
//    }
//    
//    return self;
    
    return [self initWithTitle:@"" content:@""];
}

- (id)initWithTitle:(NSString *)theTitle content:(NSString *)theContent
{
    
    self = [super init];
    
    if(self)
    {
        [self setTitle:theTitle];
        [self setContent: theContent];
        _dateCreate = [[NSData alloc] init];
    }
    
    return self;
}

@end
