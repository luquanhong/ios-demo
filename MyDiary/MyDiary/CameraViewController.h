//
//  CameraViewController.h
//  MyDiary
//
//  Created by luquanhong on 14-9-4.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diary.h"

@class CameraViewController;

@protocol CameraViewControllerDelegate

- (void)cameraViewControllerDidReturn:(CameraViewController*)cameraViewController;

@end

@interface CameraViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *picture;

@property (strong, nonatomic) Diary *diary;

- (IBAction)takePicture:(id)sender;
- (IBAction)doDismiss:(id)sender;

@property (weak, nonatomic) id<CameraViewControllerDelegate> delegate;

@end
