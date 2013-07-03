//
//  GetCredential.m
//  BBPlayersInfo
//
//  Created by Lingcong Liang on 6/21/13.
//  Copyright (c) 2013 Lingcong Liang. All rights reserved.
//

#import "GetCredential.h"

@implementation GetCredential
-(AmazonCredentials *)getCredentials {
    Response *tvmResponse = nil;
    AmazonCredentials *credentials = nil;
    
    AmazonTVMClient *tvm = [[AmazonTVMClient alloc] initWithEndpoint: @"http://cmpt275playersdynamodb.elasticbeanstalk.com" useSSL: NO];
    tvmResponse = [tvm anonymousRegister];
    if ([tvmResponse wasSuccessful]) {
        tvmResponse = [tvm getToken];
    }
    
    if ([tvmResponse wasSuccessful]) {
        credentials = [AmazonKeyChainWrapper getCredentialsFromKeyChain];
    }
    
    return credentials;
}
@end
