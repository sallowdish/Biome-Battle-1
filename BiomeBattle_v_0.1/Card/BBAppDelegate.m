//
//  BBAppDelegate.m
//  Biome Battle
//
//  Created by Hai fu Yu on 13-6-21.
//  Copyright (c) 2013年 Hai fu Yu. All rights reserved.
//

#import "BBAppDelegate.h"
#import "Card.h"
#import "CardImg.h"
#import "BBDBManager.h"
#import "BBJsonConnecttion.h"




@implementation BBAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //    // Override point for customization after application launch.
    //    self.window.backgroundColor = [UIColor whiteColor];
    //    [self.window makeKeyAndVisible];
    if(![BBDBManager coreDataHasEntriesForEntityName:@"CardImg"]){
        [self create];
    }
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Biome_Battle" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Biome_Battle.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (void) create
{   //check if a database is setup already or not
    
    NSInteger usedId=1;
    int count = 0;
    // Grab the context
    NSManagedObjectContext *context = [self managedObjectContext];
    
    
    //Create Json Connection
    BBJsonConnecttion *jsonConnect = [[BBJsonConnecttion alloc]init];
    
    //Get the array containing JSON object
    NSArray *cards =[jsonConnect JSonconnect:@"http://phylogame.org/?api=json&num=3" ];
    //CardsNum *cardsNum = [NSEntityDescription insertNewObjectForEntityForName:@"cardsNum" inManagedObjectContext:context];
    
    //cardsNum.num = 0;
    
    //NSLog(@"Get from json %i", [cards count]);
    for(count=0; count<[cards count]; count++)
    {
        NSDictionary *simgleCard = cards[count];
        CardImg *cardImg = [NSEntityDescription insertNewObjectForEntityForName:@"CardImg" inManagedObjectContext:context];
        
        //load cardImg object9 (name,cardId,img)
        cardImg.name = [simgleCard valueForKey:@"name"];
        cardImg.cardId =[NSNumber numberWithInt:usedId];
        
        NSString *strUrl = [simgleCard valueForKey:@"graphic"];
        cardImg.img = [Card getNSDataFormatImgWithUrl:(strUrl)withFormat:@"jpg"];
        
        
        //load card object
        Card *card = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
        
        card.latin_name = [simgleCard valueForKey:@"latin_name"];
        card.content = [simgleCard valueForKey:@"card_content"];
        card.card_color = [simgleCard valueForKey:@"card_color"];
        card.graphic_artist = [simgleCard valueForKey:@"graphic_artist"];
        card.habitat1 = [simgleCard valueForKey:@"habitat1"];
        card.habitat3 = [simgleCard valueForKey:@"habitat3"];
        card.habitat2 = [simgleCard valueForKey:@"habitat2"];
        card.hierarchy = [NSNumber numberWithInt:[[simgleCard valueForKey:@"hierarchy"] intValue]];
        card.size = [NSNumber numberWithInt:[[simgleCard valueForKey:@"hierarchy"] intValue]];
        
        //getUrl
        card.food_hierachy_img_url = [simgleCard valueForKey:@"food_hierarchy_image_url"];
        card.size_image_url = [simgleCard valueForKey:@"size_image_url"];
        card.backgroundGraphicUrl = [simgleCard valueForKey:@"background_image_url"];
        
        //getImg
        card.foodHieraachyImg = [Card getNSDataFormatImgWithUrl:card.food_hierachy_img_url withFormat:@"png"];
        card.sizeGraphicImg = [Card getNSDataFormatImgWithUrl:card.size_image_url withFormat:@"png"];
        card.backgroundGraphicImg =[Card getNSDataFormatImgWithUrl:card.backgroundGraphicUrl withFormat:@"png"];
        
        //connecting together
        cardImg.card = card;
        card.cardImg = cardImg;
        // NSLog(@"end of the loop");
        usedId++;
        
        // Save everything
        NSError *error = nil;
        if ([context save:&error]) {
            NSLog(@"The save was successful!");
        } else {
            NSLog(@"The save wasn't successful: %@", [error userInfo]);
        }
        
    }
    
    
}
//cardsNum.num = [NSNumber numberWithInt:usedId];

//-(void)read{
//    CardImg* tmp = [BBDBManager GetRecordById:2];
//    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,480,300)];
//    bgImage.image = [tmp getImg];
//    [self.window addSubview:bgImage];
//    //NSLog(@"this is from database. card id %@",tmp.cardId);
//}



#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end

