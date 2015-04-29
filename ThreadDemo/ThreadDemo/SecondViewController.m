//
//  SecondViewController.m
//  ThreadDemo
//
//  Created by 卢泉鸿 on 15/3/14.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "SecondViewController.h"
#import "ASIHTTPRequest.h"

#define kURL @"https://172.19.89.162/cgi/put?uri=1050397&seqId=6&token=to1e6kuamwpk"

@interface MarshallItem : NSObject

@property (nonatomic, assign) int32_t appId;
@property (nonatomic, assign) int32_t seqId;

@end

@implementation MarshallItem

- (int)size
{
    return 4 + 4;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeInt32:self.appId forKey:@"appid"];
    [aCoder encodeInt32:self.seqId forKey:@"seqid"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{

    if (self == [super init]) {
        self.appId = [aDecoder decodeInt32ForKey:@"appid"];
        self.seqId = [aDecoder decodeInt32ForKey:@"seqid"];
    }
    
    return self;
}

@end

@interface SecondViewController (){

    UIView *moveView;
    UIImageView *imageView;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *redView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [redView setBackgroundColor:[UIColor redColor]];
    //[self.view addSubview:redView];
    [self.view insertSubview:redView atIndex:0];
    
    UIView *greenView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [greenView setBackgroundColor:[UIColor greenColor]];
    //[self.view addSubview:greenView];
    [self.view insertSubview:greenView atIndex:1];
    
    moveView = [[UIView alloc] initWithFrame:CGRectMake(10, 400, 200, 40)];
    moveView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:moveView];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"change1" forState:UIControlStateNormal];
    button1.frame = CGRectMake(10, 80, 300, 40);
    button1.backgroundColor = [UIColor whiteColor];
    [button1 addTarget:self action:@selector(change1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setTitle:@"change2" forState:UIControlStateNormal];
    button2.frame = CGRectMake(10, 130, 300, 40);
    button2.backgroundColor = [UIColor blueColor];
    [button2 addTarget:self action:@selector(change2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setTitle:@"change3" forState:UIControlStateNormal];
    button3.frame = CGRectMake(10, 180, 300, 40);
    button3.backgroundColor = [UIColor blueColor];
    [button3 addTarget:self action:@selector(change3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button4 setTitle:@"change4" forState:UIControlStateNormal];
    button4.frame = CGRectMake(10, 230, 300, 40);
    button4.backgroundColor = [UIColor blueColor];
    [button4 addTarget:self action:@selector(change4:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 300, 128, 193)];
    imageView.image = [UIImage imageNamed:@"snaguosha.png"];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)change1:(id)sender{

    [UIView beginAnimations:@"animation1" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [UIView commitAnimations];
}

- (void)change2: (id)sender{
    
    NSString *uploadUrl = [[NSString stringWithFormat:@"%@", kURL] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:uploadUrl];
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    MarshallItem *item = [[MarshallItem alloc] init];
    item.appId = 10;
    item.seqId = 100;
    [request appendPostData:[NSKeyedArchiver archivedDataWithRootObject:item]];
    
    //[request appendPostData:[@"This is my data" dataUsingEncoding:NSUTF8StringEncoding]];
    [request setRequestMethod:@"POST"];
    
    [request setCompletionBlock:^{
    
        NSString *responseString = [request responseString];
        NSData *reponseData = [request responseData];
        MarshallItem *retItem = [NSKeyedUnarchiver unarchiveObjectWithData:reponseData ];
        
    }];
    
    [request setFailedBlock:^{
        NSError *error = [request error];
    }];
    
    [request setValidatesSecureCertificate:NO];
    [request startAsynchronous];

}

- (void)change3: (id)sender{
    
    NSURL *url = [NSURL URLWithString:@"http://allseeing-i.com"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    request.delegate = self;
    
    [request startAsynchronous];
    
    NSError *error = [request error];
    
}

- (void)requestFinished:(ASIHTTPRequest*)request{

    NSString *responseString = [request responseString];
    NSData *responseData = [request responseData];
}

- (void)requestFailed:(ASIHTTPRequest*)request{

    NSError *error = [request error];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)change4: (id)sender{
    
#if 0
    
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
//    transition.type = kCATransitionPush;
//    transition.type = @"cube";
    transition.type = @"suckEffect";
//    transition.type = @"oglFlip";//不管subType is "fromLeft" or "fromRight",official只有一种效果
//    transition.type = @"rippleEffect";
//    transition.type = @"pageCurl";
//    transition.type = @"pageUnCurl";
//    transition.type = @"cameraIrisHollowOpen ";
//    transition.type = @"cameraIrisHollowClose ";
    transition.subtype = kCATransitionFromLeft;
    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    [self.view.layer addAnimation:transition forKey:@"animation"];
    
#else if
    
//    [UIView animateWithDuration:3.0f
//                     animations:^{
//                         moveView.frame = CGRectMake(10, 470, 200, 40);
//                     }
//                     completion:^(BOOL finished){
//                         UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 500, 40, 40)];
//                         label.backgroundColor = [UIColor blackColor];
//                         [self.view addSubview:label];
//                     }];
    
    
    [UIView animateWithDuration:2.0f delay:0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         moveView.alpha = 0.0f;
                     } completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:2 delay:1.0f options:nil
                                          animations:^{
                                              [UIView setAnimationRepeatCount:2.5];
                                              moveView.alpha = 1.0f;
                                          }
                                          completion:^(BOOL finished) {
                                              //
                                          }];
                     }];
    
#endif
    
}

@end
