//
//  LoginViewController.h
//  BiomeBattle_v_0.1
//  Team: CMPT2752013SummerGroup13
//
//  Created by Rui Zheng on 2013-06-21.
//  Copyright (c) 2013 Rui Zheng. All rights reserved.
//  Known Bug: Password Textfield will display the psw directly rather than ***

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import <FacebookSDK/FacebookSDK.h>

@interface LoginViewController : UIViewController<FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (weak, nonatomic) IBOutlet UITextField *passWord;

@property DBManager *db;
@property FBLoginView *loginview;
- (IBAction)logIn:(id)sender;
- (IBAction)tapBackGround;
- (IBAction)cleanUpUsername;
- (IBAction)cleanUpPassword;
@end
