//
//  SecondViewController.h
//  CoreDemo
//
//  Created by 卢泉鸿 on 15/4/29.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController{

    NSMutableArray *continents;
}

@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@end
