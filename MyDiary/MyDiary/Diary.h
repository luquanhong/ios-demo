//
//  Diary.h
//  MyDiary
//
//  Created by luquanhong on 14-8-21.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Diary : NSObject <NSCoding>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *content;
@property (nonatomic, readonly, getter = dateCreate) NSData *dateCreate;

@property (strong, nonatomic) NSString *photoKey;

+ (id)createData;

- (id)initWithTitle:(NSString*)theTitle content:(NSString *)theContent;

@end
