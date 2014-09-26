//
//  SecondViewController.m
//  UINavigationDemo
//
//  Created by luquanhong on 14-9-16.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

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

- (void)buttonClick:(id)sender
{
    NSLog(@"handleButton");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //自定义backBarButtonItem
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"根视图" style: UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    //动态添加Toolbar
    [self.navigationController setToolbarHidden:YES animated:YES];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(gotoThirdView:)];
    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, self.view.frame.size.height - toolBar.frame.size.height - 44.0, self.view.frame.size.width , 44.0)];
    [toolBar setBarStyle:UIBarStyleDefault];
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [toolBar setItems:[NSArray arrayWithObject: addButton]];
    [self.view addSubview:toolBar];
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 280, 80)];
//    [label setText:@"god"];
//    label.userInteractionEnabled = YES;
//    label.enabled = YES;
//    
//    [self.view addSubview:label];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 280, 80)];
    //UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)gotoThirdView:(id)sender
{
    ThirdViewController *thirdView = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdView animated:YES];
    thirdView.title = @"Third View";
}

@end
