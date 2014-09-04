//
//  DiaryListViewController.h
//  MyDiary
//
//  Created by luquanhong on 14-8-19.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiaryListViewController : UITableViewController<UITableViewDataSource>

@property (nonatomic, strong) NSArray *diaries;
@end
