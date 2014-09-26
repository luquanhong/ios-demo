//
//  FirstViewController.m
//  UITabBarControllerDemo
//
//  Created by luquanhong on 14-9-24.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(leftBarButtonAction:) ];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarButtonAction:)];
    
    self.navigationItem.rightBarButtonItem = rightBarButton;
    self.navigationItem.leftBarButtonItem = leftBarButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIBarButtonItem selector

- (void)leftBarButtonAction:(id)sender
{
    NSLog(@"left bar button action");
    //[self.navigationController popViewControllerAnimated:YES];
}


- (void)rightBarButtonAction:(id)sender
{
    NSLog(@"right bar button action");
    SecondViewController *second = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    
    
    //[self.navigationController presentViewController:nav animated:NO completion:nil];
    
    //1 pushViewController 将为弹出的Controller自动添加返回BarButtonItem，
    [self.navigationController pushViewController:second animated:YES];
    
    //2 以Modal方式推出一个视图，弹出的视图没有返回按钮，需要自己添加
    //UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:second];
    //[self.navigationController presentViewController:nav animated:YES completion:nil];
    
    //[self presentViewController:nav animated:YES completion:nil];
}

@end
