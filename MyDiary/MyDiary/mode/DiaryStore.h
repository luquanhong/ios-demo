//
//  DiaryStory.h
//  MyDiary
//
//  Created by luquanhong on 14-9-5.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Diary.h"

@interface DiaryStore : NSObject
{
    NSMutableArray *diaries;
}

+ (DiaryStore*)defaultStore;

- (NSArray*)diaries;
- (Diary*)createDiary;

- (NSString*)diaryArchivePath;

- (BOOL)saveChanges;
- (void)fetchDiary;

@end
