//
//  CardDetailViewController.m
//  BiomeBattle_v_0.1
//  CMPT2752013SummerGroup13
//  Team: CMPT2752013SummerGroup13
//
//  Created by Rui Zheng on 6/21/13.
//  Copyright (c) 2013 Rui Zheng. All rights reserved.
//

#import "CardViewController.h"
#import "textViewForHTML.h"
#import "HDImageViewController.h"

@interface CardViewController ()

@end

@implementation CardViewController

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
    
    Card *aCard=aCardImg.card;

    // Do any additional setup after loading the view.
    
    self.name.text=aCardImg.name;
    [self.name setFont:[UIFont boldSystemFontOfSize:16]];
    self.latinName.text=aCard.latin_name;
    [self.latinName setFont:[UIFont italicSystemFontOfSize:13]];
    self.backGround.image=[aCard getImgWittNSSdata:aCard.backgroundGraphicImg];
    self.picture.image=[aCardImg getImg];
    self.size.image=[aCard getImgWittNSSdata:aCard.sizeGraphicImg];
    self.hierarchy.image=[aCard getImgWittNSSdata:aCard.foodHieraachyImg];
    //Set haibtats
    self.habitats.text=[NSString stringWithFormat:@"%@,%@,%@", aCard.habitat1,aCard.habitat2,aCard.habitat3];
    self.habitats.textColor=[UIColor blueColor];
    [self.habitats setFont:[UIFont systemFontOfSize:10]];
    
    //split the content
    NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                   "<head> \n"
                                   "<style type=\"text/css\"> \n"
                                   "body {font-family: \"%@\"; font-size: %@;}\n"
                                   "</style> \n"
                                   "</head> \n"
                                   "<body>%@</body> \n"
                                   "</html>", [UIFont systemFontOfSize:12].familyName, @"12", aCard.content];
    
    [self.introduction loadHTMLString:myDescriptionHTML baseURL:nil];
    [self.introduction setBackgroundColor:[UIColor clearColor]];
    [self.introduction setOpaque:NO];

    //TEXTVIEW_SET_HTML_TEXT(self.introduction, aCard.content);
    //Artist name
    self.artistName.text=aCard.graphic_artist;

    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showHDImageSegue"]){
        HDImageViewController *controller = (HDImageViewController *)segue.destinationViewController;
        controller.aCardImg=aCardImg;
    }
}


@end
