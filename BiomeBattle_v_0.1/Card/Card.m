//
//  Card.m
//  Biome Battle
//
//  Created by Hai fu Yu on 13-6-21.
//  Copyright (c) 2013年 Hai fu Yu. All rights reserved.
//

#import "Card.h"
#import "CardImg.h"


@implementation Card

@dynamic latin_name;
@dynamic content;
@dynamic card_color;
@dynamic graphic_artist;
@dynamic habitat1;
@dynamic habitat3;
@dynamic habitat2;
@dynamic hierarchy;
@dynamic size;
@dynamic graphicUrl;
@dynamic size_image_url;
@dynamic backgroundGraphicUrl;
@dynamic food_hierachy_img_url;
@dynamic graphicImg;
@dynamic foodHieraachyImg;
@dynamic sizeGraphicImg;
@dynamic backgroundGraphicImg;
@dynamic cardImg;


//save img with different format. jpg and png implemented
+(NSData *)getNSDataFormatImgWithUrl:(NSString *)strUrl withFormat:(NSString*) format
{
	NSURL * imageURL = [NSURL URLWithString:strUrl];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    if( [format isEqual:@"jpg"])
    {
        NSData *savedImageData = UIImageJPEGRepresentation(image,1);
        return savedImageData;
        
    }
    if( [format isEqual:@"png"])
    {
        NSData *savedImageData = UIImagePNGRepresentation(image);
        return savedImageData;
    }
    //else return nil;

}


+(NSString *) getContent:(NSString *) html {
    
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString:html];
    
    while ([theScanner isAtEnd] == NO)
    {
        
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [ NSString stringWithFormat:@"%@>", text]
                                               withString:@" "];
        
    } // while //
    return html;
    
}

-(UIImage*)getImgWittNSSdata:(NSData*)data
{
    return [UIImage imageWithData:data];
}





@end
