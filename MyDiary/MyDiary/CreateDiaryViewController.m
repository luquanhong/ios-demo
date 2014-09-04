//
//  CreateDiaryViewController.m
//  MyDiary
//
//  Created by luquanhong on 14-9-4.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "CreateDiaryViewController.h"

@interface CreateDiaryViewController ()

@end

@implementation CreateDiaryViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(id)sender
{
    [self.delegate createDiaryViewControllerDidCancel:self];
}

- (IBAction)saveDiary:(id)sender
{
    [self.delegate createDiaryViewController:self didSaveWithDiary:nil];
}

@end
