//
//  LocationViewController.h
//  MyDiary
//
//  Created by luquanhong on 14-8-19.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController : UIViewController

@property (nonatomic, strong) CLLocationManager* locationManager;
@end
