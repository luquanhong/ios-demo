//
//  LocationViewController.h
//  MyDiary
//
//  Created by luquanhong on 14-8-19.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController : UIViewController<ABPeoplePickerNavigationControllerDelegate, ABNewPersonViewControllerDelegate>
- (IBAction)addContact:(id)sender;
- (IBAction)addContact2:(id)sender;

@property (nonatomic, strong) CLLocationManager* locationManager;
@property (nonatomic, strong) ABPeoplePickerNavigationController *picker;
@property  BOOL way2;
@end
