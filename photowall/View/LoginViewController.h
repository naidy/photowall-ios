//
//  LoginViewController.h
//  photowall
//
//  Created by cg on 2017/5/26.
//  Copyright © 2017年 naidy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AccountManager.h"

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *nicknameField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordField;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@property (weak) AccountManager* accountManager;

@end
