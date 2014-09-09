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

#pragma mark - NSCoding protocol

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.content forKey:@"content"];
    [aCoder encodeObject:self.dateCreate forKey:@"dateCreate"];
    [aCoder encodeObject:self.photoKey forKey:@"photoKey"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if(self){
        [self setTitle:[aDecoder decodeObjectForKey:@"title"]];
        [self setContent:[aDecoder decodeObjectForKey:@"content"]];
        [self setPhotoKey:[aDecoder decodeObjectForKey:@"photoKey"]];
        
        _dateCreate = [aDecoder decodeObjectForKey:@"dateCreate"];
    }
    
    return self;
}

@end
