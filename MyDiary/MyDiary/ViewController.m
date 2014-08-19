//
//  ViewController.m
//  MyDiary
//
//  Created by luquanhong on 14-8-19.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    CGRect frame = CGRectMake(10, 170, 300,50);
    UILabel* label = [[UILabel alloc ] initWithFrame:frame];
    
    label.text = @"Welcome to ios world";
    label.textColor = [UIColor redColor];
    
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
