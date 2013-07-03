//
//  CardDetailViewController.h
//  BiomeBattle_v_0.1
//  Team: CMPT2752013SummerGroup13
//
//  Created by Rui Zheng on 6/21/13.
//  Copyright (c) 2013 Rui Zheng. All rights reserved.
//
//  Known Bug: the size and hierarchy pic's background is not transparent when re-formed from NSData

#import <UIKit/UIKit.h>
#import "Card.h"
#import "CardImg.h"

@interface CardViewController : UIViewController


@property (nonatomic)  CardImg *aCardImg;

@property (weak, nonatomic) IBOutlet UIImageView *backGround;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UIImageView *size;
@property (weak, nonatomic) IBOutlet UIImageView *hierarchy;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *latinName;
@property (weak, nonatomic) IBOutlet UILabel *habitats;
@property (weak, nonatomic) IBOutlet UIWebView *introduction;

@property (weak, nonatomic) IBOutlet UILabel *artistName;


@end
