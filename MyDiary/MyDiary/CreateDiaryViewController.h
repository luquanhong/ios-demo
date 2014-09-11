//
//  CreateDiaryViewController.h
//  MyDiary
//
//  Created by luquanhong on 14-9-4.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diary.h"
#import "CameraViewController.h"
#import "RecordViewController.h"

@class CreateDiaryViewController;

@protocol CreateDiaryViewControllerDelegate
@required
- (void)createDiaryViewControllerDidCancel:(CreateDiaryViewController*)createDiaryViewController;
- (void)createDiaryViewController:(CreateDiaryViewController *)createDiaryViewController didSaveWithDiary:(Diary*)diary;

@end


@interface CreateDiaryViewController : UIViewController <UITextFieldDelegate, CameraViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *diaryDate;
@property (weak, nonatomic) IBOutlet UITextField *diaryTitle;
@property (weak, nonatomic) IBOutlet UITextView *diaryContent;

- (IBAction)cancel:(id)sender;
- (IBAction)saveDiary:(id)sender;

@property (weak, nonatomic) id<CreateDiaryViewControllerDelegate> delegate;

@property (strong, nonatomic)Diary *diary;
@end
