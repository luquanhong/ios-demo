//
//  CreateDiaryViewController.m
//  MyDiary
//
//  Created by luquanhong on 14-9-4.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "CreateDiaryViewController.h"

@interface CreateDiaryViewController ()

@end

@implementation CreateDiaryViewController

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
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy 'year' m 'mouth' d 'day' 'at' h:m a"];
    NSString *date = [df stringFromDate:[NSDate date]];
    _diaryDate.text = date;
    
    self.diary = [[Diary alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //if( [segue.identifier isEqualToString:@"TakePicture"])
    if( [(UIViewController *)segue.destinationViewController isKindOfClass:[CameraViewController class]] )
    {
        CameraViewController *cameraViewController = (CameraViewController*)[segue destinationViewController];
        cameraViewController.delegate = self;
        cameraViewController.diary = self.diary;
    }
}


#pragma mark - action
- (IBAction)cancel:(id)sender
{
    [self.delegate createDiaryViewControllerDidCancel:self];
}

- (IBAction)saveDiary:(id)sender
{
    
    self.diary.title = self.diaryTitle.text;
    self.diary.content = self.diaryContent.text;
    
    [self.delegate createDiaryViewController:self didSaveWithDiary:self.diary];
}

#pragma mark - TextField delegate

- (BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - CameraViewController delegate

- (void)cameraViewControllerDidReturn:(CameraViewController*)cameraViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
