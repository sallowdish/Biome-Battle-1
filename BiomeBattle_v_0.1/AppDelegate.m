//
//  AppDelegate.m
//  BiomeBattle_v_0.1
//
//  Created by Rui Zheng on 6/20/13.
//  Copyright (c) 2013 Rui Zheng. All rights reserved.
//

#import "AppDelegate.h"
#import "Card.h"
#import "CardImg.h"
#import "CardsNum.h"
#import "BBJsonConnecttion.h"
#import "BBCard.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{   [self create];
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void) create {
    NSInteger usedId=0;
    int count = 0;
    // Grab the context
    NSManagedObjectContext *context = [self managedObjectContext];
    
    
    
    BBJsonConnecttion *jsonConnect = [[BBJsonConnecttion alloc]init];
    
    //Get the array containing JSON object
    NSArray *cards =[jsonConnect JSonconnect:@"http://phylogame.org/?api=json&num=2" ];
    //CardsNum *cardsNum = [NSEntityDescription insertNewObjectForEntityForName:@"cardsNum" inManagedObjectContext:context];
    
    //cardsNum.num = 0;
    
    NSLog(@"Get from json %i", [cards count]);
    for(count=0; count<[cards count]; count++)
    {
        NSDictionary *simgleCard = cards[count];
        CardImg *cardImg = [NSEntityDescription insertNewObjectForEntityForName:@"CardImg" inManagedObjectContext:context];
        Card *card = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
        usedId++;
        cardImg.cardId =[NSNumber numberWithInt:usedId];
        
        //get the Img for CardImg.img
        NSString *strUrl = [simgleCard valueForKey:@"graphic"];
        cardImg.img = [BBCard getNSDataFormatImgWithUrl:(strUrl)];
        
        
        card.name = [simgleCard valueForKey:@"name"];
        NSLog(@"card name%@", card.name);
        card.latin_name = [simgleCard valueForKey:@"latin_name"];
        card.card_color = [simgleCard valueForKey:@"card_color"];
        card.graphic_artist = [simgleCard valueForKey:@"graphic_artist"];
        card.habitat1 = [simgleCard valueForKey:@"habitat1"];
        card.habitat3 = [simgleCard valueForKey:@"habitat3"];
        card.habitat2 = [simgleCard valueForKey:@"habitat2"];
        card.hierarchy = [NSNumber numberWithInt:[[simgleCard valueForKey:@"hierarchy"] intValue]];
        card.size = [NSNumber numberWithInt:[[simgleCard valueForKey:@"hierarchy"] intValue]];
        card.size_image_url = [simgleCard valueForKey:@"size_image_url"];
        card.backgroundGraphicUrl = [simgleCard valueForKey:@"background_image_url"];
        //        card.food_hierachy_img_url = [simgleCard valueForKey:@"graphic"];
        //        card.foodHieraachyImg = [simgleCard valueForKey:@"graphic"];
        //        card.sizeGraphicImg =[simgleCard valueForKey:@"graphic"];
        //        card.backgroundGraphicImg =[BBCard getNSDataFormatImgWithUrl:[simgleCard valueForKey:@"graphic"]];
        card.cardId =cardImg.cardId;
        
        //connecting together
        cardImg.card = card;
        card.cardImg = cardImg;
        NSLog(@"end of the loop");
        
        
        // Save everything
        NSError *error = nil;
        if ([context save:&error]) {
            NSLog(@"The save was successful!");
        } else {
            NSLog(@"The save wasn't successful: %@", [error userInfo]);
        }
        NSLog(@"end of the function");
        
        
    }
    //cardsNum.num = [NSNumber numberWithInt:usedId];
    
    
    
}


@end
