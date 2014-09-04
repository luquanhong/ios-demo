//
//  ImageStore.h
//  MyDiary
//
//  Created by luquanhong on 14-9-4.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageStore : NSObject
{
    NSMutableDictionary *dictionary;
}

+ (ImageStore*)defaultImageStore;

- (void)setImage:(UIImage*)image forKey:(NSString*)string;
- (UIImage*)imageForKey:(NSString*)string;
- (void)deleteImageForKey:(NSString*)string;

@end
