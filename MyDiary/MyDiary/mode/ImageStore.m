//
//  ImageStore.m
//  MyDiary
//
//  Created by luquanhong on 14-9-4.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "ImageStore.h"

static ImageStore *defaultImageStore = nil;

@implementation ImageStore



+ (id)allocWithZone:(NSZone*)zone
{
    return [self defaultImageStore];
}

+ (ImageStore*)defaultImageStore
{
    if(!defaultImageStore){
        defaultImageStore = [[super allocWithZone:NULL] init];
    }
    
    return defaultImageStore;
}

- (id)init
{

    if(defaultImageStore){
        return defaultImageStore;
    }
    
    self = [super init];
    
    if(self){
        dictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)string
{
    [dictionary setObject:image forKey:string];
}

- (UIImage*)imageForKey:(NSString *)string
{
    return [dictionary objectForKey:string];
}

- (void)deleteImageForKey:(NSString *)string
{
    if(!string){
        return;
    }
    
    [dictionary removeObjectForKey:string];
}

@end