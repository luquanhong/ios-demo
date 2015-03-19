//
//  ViewController.m
//  ThreadDemo
//
//  Created by 卢泉鸿 on 15/3/13.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "ViewController.h"
#import "Singleton.h"

#define URL @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"----");
    
    [Singleton shareInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - common methods

- (void)downloadImage:(id)url{
    
    @synchronized(self){
    
        NSLog(@"download image start ");
        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:(NSString*)url]];
        UIImage *image = [UIImage imageWithData:data];
        [NSThread sleepForTimeInterval:0.5];
        
        if (image) {
            [self performSelectorOnMainThread:@selector(updateImage:) withObject:image waitUntilDone:YES];
        }
        
        NSLog(@"download image end ");
    }
}

- (void)updateImage:(id)image{

    self.imageView.image = (UIImage*)image;
}

#pragma mark - action

- (IBAction)threadAction:(id)sender {
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadImage:) object:URL];
    [thread start];
}

- (IBAction)operationAction:(id)sender {
    
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImage:) object:URL];
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperation:operation];
}

- (IBAction)gcdAction:(id)sender {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(){
        NSURL *url = [NSURL URLWithString:URL];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        
        dispatch_async(dispatch_get_main_queue(), ^(){
            self.imageView.image = image;
        });
    });
}

- (IBAction)gcd2Action:(id)sender {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"thread 1 end");
    });
    
    dispatch_group_async(group, queue, ^(){
        [NSThread sleepForTimeInterval:2];
        NSLog(@"thread 2 end");
    });
    
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"thread 3 end");
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"end!!!!!!!!");
    });
    
    NSLog(@"======");
}

- (IBAction)gcd3Action:(id)sender {
    
    dispatch_queue_t queue = dispatch_queue_create("com.yy.lqh", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"dispatch_async 1");
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"dispatch_async 2");
    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"dispatch_barrier_async");
        [NSThread sleepForTimeInterval:2];
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"dispatch_async 3");
    });
    
}


- (IBAction)changeAction:(id)sender {
    
    [UIView beginAnimations:@"animaions" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
    [UIView commitAnimations];
}

@end
