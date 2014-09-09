//
//  DiaryStory.m
//  MyDiary
//
//  Created by luquanhong on 14-9-5.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "DiaryStore.h"

static DiaryStore *defaultStore = nil;

@implementation DiaryStore


+ (DiaryStore*)defaultStore
{
    if(!defaultStore){
        defaultStore = [[super allocWithZone:NULL] init];
    }
    
    return defaultStore;
}

+ (id)allocWithZone:(NSZone*)zone
{
    return [self defaultStore];
}

- (DiaryStore*)init
{
    if(defaultStore){
        return defaultStore;
    }
    
    self = [super init];
    
//    if(self){
//        diaries = [[NSMutableArray alloc] init];
//    }
    
    return self;
}

#pragma mark - implement

- (NSArray*)diaries
{
    NSLog(@"diaries entry");
    [self fetchDiary];
    NSLog(@"diaries exit");
    return diaries;
}

- (Diary*)createDiary
{
    NSLog(@"createDiary entry");
    [self fetchDiary];
    
    Diary *diary = [Diary createData];
    
    [diaries addObject:diary];
    NSLog(@"createDiary exit");
    return diary;
}

#pragma mark  - archive

- (NSString*)diaryArchivePath
{
    NSLog(@"diaryArchivePath entry");
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    NSLog(@"diaryArchivePath exit");
    return [documentDirectory stringByAppendingPathComponent:@"diaries.data"];
}

- (BOOL)saveChanges
{
    return [NSKeyedArchiver archiveRootObject:diaries toFile:[self diaryArchivePath]];
}

- (void)fetchDiary
{
    
    NSLog(@"fetchDiary entry");
    if(!diaries){
        NSString *path = [self diaryArchivePath];
        diaries = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
    
    if(!diaries){
        diaries = [[NSMutableArray alloc] init];
    }
    NSLog(@"fetchDiary exit");
}

@end
