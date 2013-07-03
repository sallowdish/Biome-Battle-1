//
//  main.m
//  BBPlayersInfo
//
//  Created by Lingcong Liang on 6/21/13.
//  Copyright (c) 2013 Lingcong Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import "MD5.h"

int main(int argc, char *argv[])
{/*
    NSDictionary* mydic = [DBManager getUserInfo:@"abc123"];
    NSString *tmp =[ [mydic valueForKey:@"Password"] valueForKey:@"s"];
    NSLog(@"tmp is :%@" , tmp);
    NSString *compare = [MD5 uniqueIDFromString:@"zheshimima"];
    NSLog(@"compare is :%@" , compare);
    NSLog(@"bool value : %d" ,[DBManager VerifyUser:@"abc123" verifyPassword:@"zheshimima"]);
    if ([compare isEqualToString: tmp ] ){
        NSLog(@"correct");
    }
  *
  */
    
    
    
   [DBManager insertUsers: @"123" insertPassword:@"a" insertName:@"Someone" insertEmail:@"yeahyeah@yoyo.comcom" insertDeck:@[@" "]];
   // NSDictionary* mydic = [DBManager getUserInfo:(@"333")];
   // NSArray* myarray = [DBManager getUserList];
    
   // NSString* DBpassword = [[mydic valueForKey:@"Password"]valueForKey:@"s"];
   // NSString* Verifypassword = @"haha";
    
    //NSLog(@"%@" , myarray)
    
    //verify the password return a bool
    //if ([DBpassword isEqual: Verifypassword]) {
  //      NSLog(@"bool value: %d ", true);
    //}else{
   //     NSLog(@"bool value: %d ", false);
   // }
    //test insertUsers
   //[DBManager insertUsers: 333 insertPassword:@"haha" insertName:@"who" insertEmail:@"yeah@email.com" insertDeck: @[@" "]];
    
    //test update user
   // DynamoDBAttributeValue *thevalue = [[[DynamoDBAttributeValue alloc] initWithN:[NSString stringWithFormat:@"%d", 1]] autorelease];

    //[DBManager updateAttributeStringValue:@"me" forKey:@"Name" withPrimaryKey:thevalue];
    
    
    //@autoreleasepool {
        //return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    //}
}
