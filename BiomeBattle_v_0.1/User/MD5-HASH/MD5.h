//
//  MD5.h
//  Group 13 Biome Battle

//  version 0.2
//
//  Created by Lingcong Liang on 2013-06-22.
//  Copyright (c) 2013 Lingcong Liang. All rights reserved.
//
//  discovered bugs: 1. have to import <CommonCrypto/CommonDigest.h>, otherwise some fucntions won't work
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface MD5 : NSObject

+ (NSString *)uniqueIDFromString:(NSString *)source;

@end
