//
//  RecordViewController.h
//  MyDiary
//
//  Created by luquanhong on 14-9-11.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "diary.h"

@class RecordViewController;

@protocol RecordViewControllerDelegate

- (void)recordViewControllerDidReturn:(RecordViewController *)recordViewController;

@end

@interface RecordViewController : UIViewController<AVAudioRecorderDelegate, AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UILabel *recordInfo;

@property (weak, nonatomic) id<RecordViewControllerDelegate> delegate;
@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) Diary *diary;

- (IBAction)doDismiss:(id)sender;
- (IBAction)recordOption:(id)sender;
- (IBAction)playOption:(id)sender;


- (NSString*)audioRecordingPath;
- (NSDictionary*)audioRecordingSetting;
@end
