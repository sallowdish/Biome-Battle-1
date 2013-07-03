//
//  BBDBManager.h
//  Biome Battle
//
//  Created by Hai fu Yu on 13-6-21.
//  Copyright (c) 2013年 Hai fu Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "CardImg.h"
#import "BBAppDelegate.h"

@interface BBDBManager : NSObject
{

}

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+(CardImg *)GetRecordById:(int) idNum ;
+ (BOOL)coreDataHasEntriesForEntityName:(NSString *)entityName;





@end
