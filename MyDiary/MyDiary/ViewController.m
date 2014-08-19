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

//    1
//    [self.view setBackgroundColor:[UIColor yellowColor]];
//    
//    CGRect frame = CGRectMake(10, 170, 300,50);
//    UILabel* label = [[UILabel alloc ] initWithFrame:frame];
//    
//    label.text = @"Welcome to ios world";
//    label.textColor = [UIColor redColor];
//    
//    [self.view addSubview:label];

    
//    2
//    self.qqNumber.text = @"QQ;56151289";
//    self.weiBo.text = @"luquanhong@gmail.com";
//    
//    self.authorImage.image = [UIImage imageNamed:@"liuming.png"];
    
    
    switch(self.authors.selectedSegmentIndex ){
            
        case 0:
            self.qqNumber.text = @"qq:56151289";
            self.weiBo.text = @"luquanhong@gmail.com";
            self.authorImage.image = [UIImage imageNamed:@"liuming.png"];
            break;
        case 1:
            self.qqNumber.text = @"qq:8888888";
            self.weiBo.text = @"ubiconn@163.com";
            self.authorImage.image = [UIImage imageNamed:@"zhuge.png"];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)authorChanged:(id)sender {
    
    NSLog(@"invoke authorChanged sender method");
    
    int value;
    
    value = [ (UISegmentedControl*)sender selectedSegmentIndex];
    
    switch(value){
        case 0:
            self.qqNumber.text = @"qq:56151289";
            self.weiBo.text = @"luquanhong@gmail.com";
            self.authorImage.image = [UIImage imageNamed:@"liuming.png"];
            break;
        case 1:
            self.qqNumber.text = @"qq:8888888";
            self.weiBo.text = @"ubiconn@163.com";
            self.authorImage.image = [UIImage imageNamed:@"zhuge.png"];
            break;
        default:
            break;
    }
}
@end
