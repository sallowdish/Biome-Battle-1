//
//  HDImageViewController.m
//  BiomeBattle_v_0.1
//  Team: CMPT2752013SummerGroup13
//
//  Created by Rui Zheng on 6/23/13.
//  Copyright (c) 2013 Rui Zheng. All rights reserved.
//

#import "HDImageViewController.h"
#import "CardViewController.h"

@interface HDImageViewController ()

@end

@implementation HDImageViewController

@synthesize aCardImg;

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
    
    UIImage* landscapeImage=[[UIImage alloc] initWithCGImage: [aCardImg getImg].CGImage
                               scale: 1.0
                         orientation: UIImageOrientationLeft];
    self.HDImageView.image=landscapeImage;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"backCardSegue"]){
        CardViewController *controller = (CardViewController *)segue.destinationViewController;
        controller.aCardImg=aCardImg;
    }
}

@end
