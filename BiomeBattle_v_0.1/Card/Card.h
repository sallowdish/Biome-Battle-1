/*
 Card.h
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

@class CardImg;

@interface Card : NSManagedObject

@property (nonatomic, retain) NSString * latin_name;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * card_color;
@property (nonatomic, retain) NSString * graphic_artist;
@property (nonatomic, retain) NSString * habitat1;
@property (nonatomic, retain) NSString * habitat3;
@property (nonatomic, retain) NSString * habitat2;
@property (nonatomic, retain) NSNumber * hierarchy;
@property (nonatomic, retain) NSNumber * size;
@property (nonatomic, retain) NSString * graphicUrl;
@property (nonatomic, retain) NSString * size_image_url;
@property (nonatomic, retain) NSString * backgroundGraphicUrl;
@property (nonatomic, retain) NSString * food_hierachy_img_url;
@property (nonatomic, retain) NSData * graphicImg;
@property (nonatomic, retain) NSData * foodHieraachyImg;
@property (nonatomic, retain) NSData * sizeGraphicImg;
@property (nonatomic, retain) NSData * backgroundGraphicImg;
@property (nonatomic, retain) CardImg *cardImg;

+(NSString *) getContent:(NSString *) html;
+(NSData *)getNSDataFormatImgWithUrl:(NSString *)strUrl withFormat:(NSString*) format;
-(UIImage*)getImgWittNSSdata:(NSData*)data;

@end
