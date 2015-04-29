//
//  FirstViewController.h
//  CoreDemo
//
//  Created by 卢泉鸿 on 15/4/29.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    
    NSMutableArray *people;
}

@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (strong, nonatomic) NSUndoManager *thisUndoManager;

@end
