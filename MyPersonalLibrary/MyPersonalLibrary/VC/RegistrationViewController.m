//
//  RegistrationViewController.m
//  MyPersonalLibrary
//
//  Created by 卢泉鸿 on 15/4/30.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "RegistrationViewController.h"
#import "KeychainItemWrapper.h"
#import "NSString+MD5.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)registerAction:(id)sender {
    
    if ([_userNameTextField.text length] == 0 || [_passwordTextField.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"please inout information" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"MyPersonalLibrary" accessGroup:nil
                                         ];
        [keychain setObject:_userNameTextField.text forKey:(__bridge id)kSecAttrAccount];
        [keychain setObject:[_passwordTextField.text MD5 ] forKey:(__bridge id)kSecValueData];
        
    }
    
    [UBConfigurationHelper setBoolValueForConfigurationKey:bUBRegistered withValue:YES];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(registeredWithSuccess)]) {
        [self.delegate registeredWithSuccess];
    }
}


- (IBAction)cancelAction:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(cancelRegistration)]) {
        [self.delegate cancelRegistration];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == self.userNameTextField || textField == self.passwordTextField) {
        [self.userNameTextField resignFirstResponder];
        [self.passwordTextField resignFirstResponder];
    }
    
    return YES;
}

@end
