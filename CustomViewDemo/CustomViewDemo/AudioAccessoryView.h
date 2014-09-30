//
//  AudioAccessoryView.h
//  CustomViewDemo
//
//  Created by luquanhong on 14-9-28.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AudioAccessoryDelegate <NSObject>

@required
- (void)menuButtonPress;

@end


@interface AudioAccessoryView : UIView
@property (weak, nonatomic) IBOutlet UIButton *audioButton;
@property (weak, nonatomic) IBOutlet UIButton *inviteButton;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;


@property (weak,nonatomic) id<AudioAccessoryDelegate> delegate;

@end
