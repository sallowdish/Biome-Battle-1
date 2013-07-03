//
//  CardImg.m
//  Biome Battle
//
//  Created by Hai fu Yu on 13-6-21.
//  Copyright (c) 2013年 Hai fu Yu. All rights reserved.
//

#import "CardImg.h"


@implementation CardImg

@dynamic img;
@dynamic cardId;
@dynamic card;

//retunr UIImage
-(UIImage*)getImg
{
    return [UIImage imageWithData:self.img];
}

@end
