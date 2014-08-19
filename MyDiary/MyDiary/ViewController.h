//
//  ViewController.h
//  MyDiary
//
//  Created by luquanhong on 14-8-19.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *qqNumber;
@property (weak, nonatomic) IBOutlet UILabel *weiBo;
@property (weak, nonatomic) IBOutlet UIImageView *authorImage;
@property (weak, nonatomic) IBOutlet UISegmentedControl *authors;

- (IBAction)authorChanged:(id)sender;

@end
