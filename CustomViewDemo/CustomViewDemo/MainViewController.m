//
//  MainViewController.m
//  CustomViewDemo
//
//  Created by luquanhong on 14-9-28.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "MainViewController.h"
#import "AudioAccessoryView.h"
#import "RoomExpandMenu.h"

@interface MainViewController ()
{
    AudioAccessoryView *audioAccessoryView;
    RoomExpandMenu *roomExpandMenu;
    

}
@end

@implementation MainViewController

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
    // Do any additional setup after loading the view from its nib.
    
    [self initAudioAccessoryView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initAudioAccessoryView
{
    audioAccessoryView = [[[NSBundle mainBundle] loadNibNamed:@"AudioAccessoryView" owner:self options:nil] objectAtIndex:0];
    audioAccessoryView.frame = CGRectMake(0, 0, audioAccessoryView.frame.size.width, audioAccessoryView.frame.size.height);
    audioAccessoryView.delegate = self;
    
    [_boomView addSubview:audioAccessoryView];

    
    
    
    
    roomExpandMenu = [[[NSBundle mainBundle] loadNibNamed:@"RoomExpandMenu" owner:self options:nil] objectAtIndex:0];
    
    //roomExpandMenu.frame = CGRectMake(0, 0, roomExpandMenu.frame.size.width, roomExpandMenu.frame.size.height);
    
    roomExpandMenu.frame = CGRectMake(10, 100, roomExpandMenu.frame.size.width/5*4, roomExpandMenu.frame.size.height/5*4);
    roomExpandMenu.hidden = YES;
    //roomExpandMenu.delegate = self;
    
    //[self.view addSubview:roomExpandMenu];
    
    roomExpandMenu showInView
}


#pragma mark - delegate

- (void)menuButtonPress
{
    
    NSLog(@"========RoomExpandMenu");
    if([roomExpandMenu isHidden]){
        roomExpandMenu.hidden = NO;
    }else{
        roomExpandMenu.hidden = YES;
    }
}

@end
