//
//  ThreedViewController.h
//  CoreDemo
//
//  Created by 卢泉鸿 on 15/4/29.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Continent.h"
#import "Country.h"

@interface ThreedViewController : UIViewController{
    NSMutableArray *contries;
    
}

@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (nonatomic, strong) Continent *continent;

- (void)setContinent:(Continent*)continent;

@end
