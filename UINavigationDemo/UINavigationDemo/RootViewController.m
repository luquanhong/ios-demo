//
//  RootViewController.m
//  UINavigationDemo
//
//  Created by luquanhong on 14-9-16.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    
    //为Navigation Controller 添加BarButton
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(selectLeftAction:)];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(selectRightAction:)];
    
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.rightBarButtonItem = rightButton;
    
//    //在Nav Bar中添加SegmentedControl
//    NSArray *array = [NSArray arrayWithObjects:@"鸡翅", @"排骨", nil];
//    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:array];
//    segmentedControl.segmentedControlStyle = UISegmentedControlSegmentCenter;
//    [segmentedControl addTarget:self action:@selector(segmentedAction:) forControlEvents:UIControlEventValueChanged];
//    
//    //自定义Navigation title
//    self.navigationItem.titleView = segmentedControl;
    
    //自定义Bar Title
//    UILabel *label = [[UILabel alloc] init];
//    [label setText:@"god"];
//    label.userInteractionEnabled = YES;
//    label.enabled = YES;
//
//    self.navigationItem.titleView = label;

//    UIButton *button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
//    [button setTitle: @"自定义title" forState: UIControlStateNormal];
//    [button sizeToFit];
//    self.navigationItem.titleView = button;
    
    
//    //3 way
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.navigationController.navigationBar.frame.size.width, 21.0)];
    self.navigationItem.titleView = textField;
//    [textField becomeFirstResponder];


    //不能覆盖viewTitle
//    UITextField *textfieldTxt = [[UITextField alloc]initWithFrame:CGRectMake(78, 11, 170, 25)];
//    textfieldTxt.backgroundColor = [UIColor clearColor];
//    [textfieldTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
//    textfieldTxt.delegate = self;
//    [self.navigationController.navigationBar addSubview:textfieldTxt];
    
    
    //加入Toolbar
    [self.navigationController setToolbarHidden:NO animated:YES];
    UIBarButtonItem *one = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    UIBarButtonItem *two = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:nil];
    UIBarButtonItem *three = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:nil];
    UIBarButtonItem *four = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [self setToolbarItems:[ NSArray arrayWithObjects: flexItem, one, flexItem, two, flexItem, three, flexItem, four, flexItem, nil]];
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)gotoSecondView:(id)sender {
    
//    //如何跳转到下一个View中
//    SecondViewController *secondView = [[SecondViewController alloc] init];
//    [self.navigationController pushViewController:secondView animated:YES];
//    secondView.title = @"Second View";
    NSString *str1 = @"beiing welcome you";
    NSString *str2 = @"beijing";
    
    NSString *netStr = @"http://www.yy.com";
    
    if([netStr hasPrefix:@"http:"]){
        NSLog(@"netStr has prefix http:");
    }else{
        NSLog(@"netStr has not prefix http:");
    }
    
    if ([netStr hasSuffix:@"com"]) {
         NSLog(@"netStr has suffiix");
    }else{
         NSLog(@"netStr has not suffix http:");
    }
    
    
    
}

#pragma mark - selector action

- (void)selectLeftAction:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"左按钮" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)selectRightAction:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"右按钮" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)segmentedAction:(id)sender
{
    switch ([sender selectedSegmentIndex]) {
        case 0:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"鸡翅" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alert show];
        }
        break;
            
        case 1:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"排骨" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alert show];
        }
        break;
            
        default:
            break;
    }
}

@end
