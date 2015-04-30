//
//  UBLoginViewController.h
//  MyPersonalLibrary
//
//  Created by 卢泉鸿 on 15/4/30.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UBLoginViewControllerDelegate <NSObject>

@optional
- (void)loginWithSuccess;
- (void)loginWithError;
- (void)loginWithCancel;

@end

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) id<UBLoginViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end
