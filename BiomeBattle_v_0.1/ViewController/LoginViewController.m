//
//  LoginViewController.m
//  BiomeBattle_v_0.1
//  Team: CMPT2752013SummerGroup13
//
//  Created by Rui Zheng on 2013-06-21.
//  Copyright (c) 2013 Rui Zheng. All rights reserved.
//

#import "LoginViewController.h"
#import "DBManager.h"
#import "TreasureViewController.h"


@interface LoginViewController ()

@end



@implementation LoginViewController;

@synthesize db,userName,passWord;

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
    [[self view] setBackgroundColor: [UIColor colorWithPatternImage: [UIImage imageNamed:@"bg-F3F3D0-forest-grasslands-urban-1.png"]]];
    db=[[DBManager alloc]init];
    
    FBLoginView* loginView = [[FBLoginView alloc]init];
    loginView.delegate = self;
    loginView.frame = CGRectOffset(loginView.frame, 50, 50);
    [self.view addSubview:loginView]; 


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logIn:(id)sender{
    [self tapBackGround];
    if (![userName.text isEqualToString:@""] && passWord.text!=nil) {
        
        NSDictionary* mydic = [DBManager getUserInfo:(userName.text)];
        NSString* DBpassword = [[mydic valueForKey:@"Password"] valueForKey:@"s"];
        
        bool verified=[DBManager VerifyUser:userName.text verifyPassword:passWord.text];
        if (verified) {
            [self performSegueWithIdentifier:@"enterGame" sender:nil];
            //jump to main view
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                message:@"Invaild username or password"
                delegate:nil
                cancelButtonTitle:@"OK"
                otherButtonTitles:nil];
            [alert show];
            [self cleanUpPassword];
            [self cleanUpUsername];
        }

    }
    //log in failed ,give alert
    
    else{
        UIAlertView *alert =[[UIAlertView alloc]
                             initWithTitle:@"Failed"
                             message:@"Please fill up username and password"
                             delegate:nil
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil];
        [alert show];
        [self cleanUpUsername];
        [self cleanUpPassword];
    }
    
}


- (IBAction)cleanUpUsername{
    self.userName.text=@"";
}

- (IBAction)cleanUpPassword{
    self.passWord.text=@"";
}


- (IBAction)tapBackGround{
    [self.view endEditing:YES];
}
@end
