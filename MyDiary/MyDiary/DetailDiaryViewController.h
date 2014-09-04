//
//  DetailDiaryViewController.h
//  MyDiary
//
//  Created by luquanhong on 14-8-21.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diary.h"

@interface DetailDiaryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *diaryTitle;
@property (weak, nonatomic) IBOutlet UITextView *diaryContent;

//@property (strong, nonatomic) NSString *title;
//@property (strong, nonatomic) NSString *content;

@property (strong, nonatomic)Diary *diary;
@end
