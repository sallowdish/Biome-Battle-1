/*
 CardImg.h
 GROUP 13 Biome Battle team
 
 Revision History
 1.0 Creatation by Hai Fu Yu
 
 Discovered Bugs
 1. UIImage type image cannot store into Core Data
 Solution: Convert the type to NSData first.
 Convert back to UIImage to display.
 
 */
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CardImg : NSManagedObject

@property (nonatomic, retain) NSData * img;
@property (nonatomic, retain) NSNumber * cardId;
@property (nonatomic, retain) NSManagedObject *card;
@property (nonatomic, retain) NSString * name;

-(UIImage*)getImg;
@end
