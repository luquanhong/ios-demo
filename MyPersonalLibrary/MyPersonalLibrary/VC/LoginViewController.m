//
//  UBLoginViewController.m
//  MyPersonalLibrary
//
//  Created by 卢泉鸿 on 15/4/30.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "LoginViewController.h"
#import "KeychainItemWrapper.h"
#import "NSString+MD5.h"
#import "RegistrationViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.nameTextField.delegate = self;
//    self.passwordTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginAction:(id)sender {
    if ([self.nameTextField.text length] == 0 || [self.passwordTextField.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"message" message:@"please input the username and password" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"MyPersonalLibrary" accessGroup:nil];
        if ([self.nameTextField.text isEqualToString:[keychain objectForKey:(__bridge id)kSecAttrAccount]]) {
            if ([ [self.passwordTextField.text MD5] isEqualToString: [keychain objectForKey:(__bridge id)kSecValueData]] ) {
                if (self.delegate && [self.delegate respondsToSelector:@selector(loginWithSuccess)]) {
                    [self.delegate loginWithSuccess];
                }
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"message" message:@"please input the username and password" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alert show];
            }
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"message" message:@"please input the username and password" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}

- (IBAction)cancelAction:(id)sender {
    
}

- (IBAction)registerAction:(id)sender {
    RegistrationViewController *regVC = [[RegistrationViewController alloc] initWithNibName:@"RegistrationViewController" bundle:nil];
    [self.navigationController pushViewController:regVC animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == self.nameTextField || textField == self.passwordTextField) {
        [self.nameTextField resignFirstResponder];
        [self.passwordTextField resignFirstResponder];
    }
    
    return YES;
}
@end
