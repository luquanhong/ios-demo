//
//  RecordViewController.m
//  MyDiary
//
//  Created by luquanhong on 14-9-11.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController ()

@end

@implementation RecordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    if(self.diary.audioFileName != nil){
//        self.playButton.hidden = NO;
//    }else{
//        self.playButton.hidden = YES;
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    if([self.audioRecorder isRecording]){
        [self.audioRecorder stop];
    }
    
    self.audioRecorder = nil;
}

#pragma mark - implement

- (NSString*)audioRecordingPath
{
    NSString *path = nil;
    
    NSArray *folders = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsFolder = [folders objectAtIndex:0];
    
    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
    
    NSString *fileName = (__bridge NSString*)newUniqueIDString;
    self.diary.audioFileName = [fileName stringByAppendingPathExtension:@"m4a"];
    
    CFRelease(newUniqueID);
    CFRelease(newUniqueIDString);
    
    path = [documentsFolder stringByAppendingPathComponent:self.diary.audioFileName];
    
    return path;
}

- (NSDictionary*)audioRecordingSetting
{
    NSDictionary *result = nil;
    
    NSMutableDictionary *setting = [[NSMutableDictionary alloc] init];
    
    [setting setValue:[NSNumber numberWithInteger:kAudioFormatAppleLossless] forKey:AVFormatIDKey];
    [setting setValue:[NSNumber numberWithFloat:44100.0f] forKey:AVSampleRateKey];
    [setting setValue:[NSNumber numberWithInteger:2] forKey:AVNumberOfChannelsKey];
    [setting setValue:[NSNumber numberWithInteger:16] forKey:AVEncoderBitRateKey];
    [setting setValue:[NSNumber numberWithInteger:AVAudioQualityLow] forKey:AVEncoderAudioQualityKey];
    
    result = [NSDictionary dictionaryWithDictionary:setting];
    
    return result;
}


- (void)stopRecordingOnAudioRecorder:(AVAudioRecorder *)aRecorder
{
    [aRecorder stop];
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:NO error:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - ation
- (IBAction)doDismiss:(id)sender {
    [self.delegate recordViewControllerDidReturn:self];
}

- (IBAction)recordOption:(id)sender {
    
    BOOL result;
    NSError *error = nil;
    NSString *pathAsString = [self audioRecordingPath];
    
    NSLog(@"pathAsString is %@", pathAsString);
    
    NSURL *audioRecordingURL = [NSURL fileURLWithPath:pathAsString];
    
    // Setup audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:audioRecordingURL settings:[self audioRecordingSetting] error:&error];
    NSLog(@"1start to record audio %s and error is %@", (result?"yes":"no"), error);
    if(self.audioRecorder != nil){
    
        self.audioRecorder.delegate = self;
        self.audioRecorder.meteringEnabled = YES;
        
        result = [self.audioRecorder prepareToRecord];
        if( result == YES){
            NSLog(@"2start to record audio %s and error is %@", (result?"yes":"no"), error);
            
            AVAudioSession *session = [AVAudioSession sharedInstance];
            [session setActive:YES error:nil];
            result = [self.audioRecorder record];
        
            NSLog(@"3start to record audio %s and error is %@", (result?"yes":"no"), error);
            [self performSelector: @selector(stopRecordingOnAudioRecorder:) withObject:self.audioRecorder afterDelay:5.0f];
        }else{
            NSLog(@"record audio error");
        }
    }else{
        NSLog(@"audio record create error");
    }
}

- (IBAction)playOption:(id)sender {
    
    NSArray *folders = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsFolder = [folders objectAtIndex: 0];
    
    NSLog(@"self.diary.audioFileName is %@", [documentsFolder stringByAppendingPathComponent:self.diary.audioFileName]);
    
    NSData *fileData = [NSData dataWithContentsOfFile:[documentsFolder stringByAppendingPathComponent:self.diary.audioFileName]];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:nil];
    
    if(self.audioPlayer != nil){
    
        self.audioPlayer.delegate = self;
        
        if([self.audioPlayer prepareToPlay] && [self.audioPlayer play]){
            self.recordInfo.text = @"playing audio";
        }else{
            self.recordInfo.text = @"play audio error";
        }
    }else{
        NSLog(@"create audio player error");
    }
}


#pragma mark - audio record delegate

-(void)audioPlayerDidFinishPlaying:
(AVAudioPlayer *)player successfully:(BOOL)flag
{
    
    NSLog(@"audioPlayerDidFinishPlaying");
   // _recordButton.enabled = YES;
   // _stopButton.enabled = NO;
}

-(void)audioPlayerDecodeErrorDidOccur:
(AVAudioPlayer *)player
                                error:(NSError *)error
{
    NSLog(@"Decode Error occurred");
}

-(void)audioRecorderDidFinishRecording:
(AVAudioRecorder *)recorder
                          successfully:(BOOL)flag
{
    NSLog(@"audioRecorderDidFinishRecording");
}

-(void)audioRecorderEncodeErrorDidOccur:
(AVAudioRecorder *)recorder
                                  error:(NSError *)error
{
    NSLog(@"Encode Error occurred");
}

@end
