//
//  SignUpViewController.h
//  BiomeBattle_v_0.1
//  Team: CMPT2752013SummerGroup13
//
//  Created by Rui Zheng on 6/23/13.
//  Copyright (c) 2013 Rui Zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *realName;
@property (weak, nonatomic) IBOutlet UITextField *referrer;

- (IBAction)finish:(id)sender;
- (IBAction)clear:(id)sender;
- (IBAction)tapBackGround:(id)sender;


@end
