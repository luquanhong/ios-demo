//
//  CameraViewController.m
//  MyDiary
//
//  Created by luquanhong on 14-9-4.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "CameraViewController.h"
#import "ImageStore.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


#pragma mark - action
- (IBAction)takePicture:(id)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
    
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }else{
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)doDismiss:(id)sender {
    
    [self.delegate cameraViewControllerDidReturn:self];
}

#pragma mark - UIImagePickerController delegate

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    NSString *oldPhotoKey = [self.diary photoKey];
    
    if(oldPhotoKey){
        [[ImageStore defaultImageStore] deleteImageForKey:oldPhotoKey];
    }
    
    NSLog(@"didFinishPickingMediaWithInfo");
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
    
    CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
    
    [self.diary setPhotoKey:(__bridge NSString*)newUniqueIDString];
    
    CFRelease(newUniqueID);
    CFRelease(newUniqueIDString);
    
    [[ImageStore defaultImageStore] setImage: image forKey:[self.diary photoKey]];
    
    [self.picture setImage:image];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
