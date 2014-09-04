//
//  DiaryListViewController.h
//  MyDiary
//
//  Created by luquanhong on 14-8-19.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateDiaryViewController.h"

@interface DiaryListViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate, CreateDiaryViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *diaries;
@end
