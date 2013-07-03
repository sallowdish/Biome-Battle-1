//
//  BBJsonConnecttion.m
//  Biome Battle
//
//  Created by Hai fu Yu on 13-6-21.
//  Copyright (c) 2013年 Hai fu Yu. All rights reserved.
//

#import "BBJsonConnecttion.h"
#import "BBcard.h"

@implementation BBJsonConnecttion




-(NSArray *)JSonconnect:(NSString *)url
{
    NSURL *jsonUrl = [NSURL URLWithString:url];
    NSError *error = nil;
    NSData *jsonData = [NSData dataWithContentsOfURL:jsonUrl options:0 error:&error];
    NSArray *ConvertedObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    return ConvertedObject;
}




@end
