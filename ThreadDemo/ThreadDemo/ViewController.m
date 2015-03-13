//
//  ViewController.m
//  ThreadDemo
//
//  Created by 卢泉鸿 on 15/3/13.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "ViewController.h"

#define URL @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadImage:) object:URL];
    [thread start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - common methods

- (void)downloadImage:(id)url{
    
    NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:(NSString*)url]];
    UIImage *image = [UIImage imageWithData:data];
    
    if (image) {
        [self performSelectorOnMainThread:@selector(updateImage:) withObject:image waitUntilDone:YES];
    }
}

- (void)updateImage:(id)image{

    self.imageView.image = (UIImage*)image;
}

@end
