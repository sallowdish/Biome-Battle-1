//
//  SignUpViewController.m
//  BiomeBattle_v_0.1
//  Team: CMPT2752013SummerGroup13
//
//  Created by Rui Zheng on 6/23/13.
//  Copyright (c) 2013 Rui Zheng. All rights reserved.
//

#import "SignUpViewController.h"
#import "DBManager.h"
#import "LoginViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

@synthesize userName,passWord,confirmPassword,email,realName,referrer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finish:(id)sender {
    //send data to database
    if ([self isVaild]&&![self isInNameList:self.userName.text]) {
        if ([self.passWord.text isEqualToString:self.confirmPassword.text]) {
            [DBManager insertUsers:self.userName.text insertPassword:self.passWord.text insertName:self.realName.text insertEmail:self.email.text insertDeck:@[@" "]];
        }
    //sign up successful,give alert and jump back to loginview
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successed"
                                                    message:[[NSString alloc]initWithFormat:@"You have created an account named %@", userName.text]delegate:nil
                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [self performSegueWithIdentifier:@"SignUpSuccessed" sender:nil];
    }
    
}

- (IBAction)clear:(id)sender {
    self.userName.text=@"";
    self.passWord.text=@"";
    self.confirmPassword.text=@"";
    self.email.text=@"";
    self.realName.text=@"";
    self.referrer.text=@"";
}

- (IBAction)tapBackGround:(id)sender{
    //[sender resignFirstResponder];
    [self.view endEditing:YES];
}

-(bool)isInNameList:(NSString*)username{
    return false;
}

-(bool)isVaild{
    bool flag=false;
    if([userName.text isEqualToString: @""]){
        userName.text=@"Must be filled!";
    }
    else if([passWord.text isEqualToString: @""]){
        passWord.text=@"Must be filled!";
    }
    else if([confirmPassword.text isEqualToString: @""]){
        confirmPassword.text=@"Must be filled!";
    }
    else if([email.text isEqualToString: @""]){
        email.text=@"Must be filled!";
    }
    else if([realName.text isEqualToString: @""]){
        realName.text=@"Must be filled!";
    }
    else{
        flag=true;
    }
    return flag;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"SignUpSuccessed"]){
        LoginViewController *controller = (LoginViewController *)segue.destinationViewController;
        controller.userName.text=userName.text;
    }
}


@end
