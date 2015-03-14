//
//  CDViewController.h
//  CoreDataDemo
//
//  Created by 卢泉鸿 on 15/2/4.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface CDViewController : UIViewController
{
    NSMutableArray* people;
}

@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (strong, nonatomic) NSUndoManager* undoManager;

@end
