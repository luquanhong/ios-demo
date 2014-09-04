//
//  DetailDiaryViewController.m
//  MyDiary
//
//  Created by luquanhong on 14-8-21.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "DetailDiaryViewController.h"

@interface DetailDiaryViewController ()

@end

@implementation DetailDiaryViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    self.diaryTitle.text = self.title;
//    self.diaryContent.text = self.content;
    self.diaryTitle.text = self.diary.title;
    self.diaryContent.text = self.diary.content;
    
    [[self navigationItem] setTitle:@"diary content"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
