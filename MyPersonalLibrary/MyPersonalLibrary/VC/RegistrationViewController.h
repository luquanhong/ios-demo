//
//  RegistrationViewController.h
//  MyPersonalLibrary
//
//  Created by 卢泉鸿 on 15/4/30.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RegistrationViewControllerDelegate <NSObject>

- (void)registeredWithSuccess;
- (void)registeredWithError;
- (void)cancelRegistration;

@end

@interface RegistrationViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong)id<RegistrationViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end
