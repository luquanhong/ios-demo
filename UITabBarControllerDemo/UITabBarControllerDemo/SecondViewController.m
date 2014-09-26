//
//  SecondViewController.m
//  UITabBarControllerDemo
//
//  Created by luquanhong on 14-9-24.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(leftBarButtonAction:) ];
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
    NSLog(@"left bar button action 2");
    
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
    //2
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)rightBarButtonAction:(id)sender
{
    NSLog(@"right bar button action 2");
    SecondViewController *second = [[SecondViewController alloc] init];
    
    
    //[self.navigationController presentViewController:second animated:NO completion:nil];
    
}

- (IBAction)gotoThird:(id)sender {
    
    NSLog(@"go to third");
}

@end
