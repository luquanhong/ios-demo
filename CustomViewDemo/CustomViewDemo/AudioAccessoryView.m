//
//  AudioAccessoryView.m
//  CustomViewDemo
//
//  Created by luquanhong on 14-9-28.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "AudioAccessoryView.h"

@implementation AudioAccessoryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)audioAction:(id)sender {
    NSLog(@"audioAction");
}


- (IBAction)inviteAction:(id)sender {
    
     NSLog(@"inviteAction");
}


- (IBAction)menuAction:(id)sender {
    
    NSLog(@"menuAction");
    
    [self.delegate menuButtonPress];
    
}
@end
