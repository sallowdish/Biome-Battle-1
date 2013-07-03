//
//  MD5.m
//  test_hash
//
//  Created by Lingcong Liang on 2013-06-22.
//  Copyright (c) 2013 Lingcong Liang. All rights reserved.
//
#import "MD5.h"
#import <CommonCrypto/CommonDigest.h>
@implementation MD5
//	generates a unique id from a string
+ (NSString *)uniqueIDFromString:(NSString *)source
{
	const char *src = [[source lowercaseString] UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5(src, strlen(src), result);
    
    NSString *ret = [[NSString alloc] initWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                      result[0], result[1], result[2], result[3],
                      result[4], result[5], result[6], result[7],
                      result[8], result[9], result[10], result[11],
                      result[12], result[13], result[14], result[15]
                      ] ;
    
    return ret;
}
@end
