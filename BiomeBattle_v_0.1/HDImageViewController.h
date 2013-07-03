//
//  HDImageViewController.h
//  BiomeBattle_v_0.1
//  Team: CMPT2752013SummerGroup13
//
//  Created by Rui Zheng on 6/23/13.
//  Copyright (c) 2013 Rui Zheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardImg.h"

@interface HDImageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *HDImageView;
@property (nonatomic) CardImg *aCardImg;



@end
