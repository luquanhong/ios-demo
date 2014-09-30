//
//  MainViewController.h
//  CustomViewDemo
//
//  Created by luquanhong on 14-9-28.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoomExpandMenu.h"
#import "AudioAccessoryView.h"

@interface MainViewController : UIViewController <RoomExpandMenuDelegate, AudioAccessoryDelegate>
@property (weak, nonatomic) IBOutlet UIView *boomView;
@property (weak, nonatomic) IBOutlet UIView *roomView;

@end
