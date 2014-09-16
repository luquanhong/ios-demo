//
//  RootViewController.h
//  UINavigationDemo
//
//  Created by luquanhong on 14-9-16.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

- (IBAction)gotoSecondView:(id)sender;

- (void)selectLeftAction:(id)sender;
- (void)selectRightAction:(id)sender;

- (void)segmentedAction:(id)sender;
@end
