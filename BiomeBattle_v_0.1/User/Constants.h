//
//  MD5.h
//  Group 13 Biome Battle

//  version 0.1
//
//  Created by Lingcong Liang on 2013-06-22.
//  Copyright (c) 2013 Lingcong Liang. All rights reserved.
//
//  discovered bugs: no




#define TOKEN_VENDING_MACHINE_URL    @"http://cmpt275playersdynamodb.elasticbeanstalk.com"
#define USE_SSL                      NO
#define CREDENTIALS_ALERT_MESSAGE    @"Please update the Constants.h file with the Token Vending Machine URL."
#define TEST_TABLE_NAME              @"PlayerInfo"
#define TEST_TABLE_HASH_KEY          @"userID"

@interface Constants:NSObject
{
}


@end
