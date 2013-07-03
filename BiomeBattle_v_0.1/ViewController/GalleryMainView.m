//
//  GalleryView.m
//  BiomeBattle_v_0.1
//
//  Created by Rui Zheng on 6/21/13.
//  Copyright (c) 2013 Rui Zheng. All rights reserved.
//

#import "GalleryMainView.h"


@implementation GalleryMainView


@synthesize cardList,deck;
-(id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super initWithCoder:aDecoder]))
    {
        // To get the deck here
        deck = [[ NSMutableArray alloc]initWithObjects:@"Card1",@"Card2",@"Card3", nil];
        
        //load tableView here
        [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"CardListView" owner:self options:nil] objectAtIndex:0]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


#pragma congif tableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return deck.count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Where we configure the cell in each row
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell... setting the text of our cell's label
    cell.textLabel.text = [deck objectAtIndex:indexPath.row];
    
    
    //configure the image of the cell
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    imgView.image = [UIImage imageNamed:@"Tmode_icon.jpg"];
    cell.imageView.image = imgView.image;
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    // If you want to push another view upon tapping one of the cells on your table.
    
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"CardDetailView" owner:self options:nil] objectAtIndex:0]];
    
    
}

#pragma end of cfg tableView


@end
