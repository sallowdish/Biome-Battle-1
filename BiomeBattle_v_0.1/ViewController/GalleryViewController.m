//
//  GalleryViewController.m
//  BiomeBattle_v_0.1
//  Team: CMPT2752013SummerGroup13
//
//  Created by Rui Zheng on 6/21/13.
//  Copyright (c) 2013 Rui Zheng. All rights reserved.
//

#import "GalleryViewController.h"



	
@interface GalleryViewController ()

@end

@implementation GalleryViewController


@synthesize  deck;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization

        // To get the deck here
            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    if (deck==nil) {
        deck=[[NSMutableArray alloc]init];
    }
    for (int i= 1; i<=3; i++){
        [deck addObject:[BBDBManager GetRecordById:i]];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return deck.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BasicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell... setting the text of our cell's label
    CardImg* aCardImg=[deck objectAtIndex:indexPath.row];
//    Card* aCard=aCardImg.card;
    cell.textLabel.text = aCardImg.name;
    
    //configure the image of the cell
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    imgView.image = [aCardImg getImg];
//    imgView.image=[UIImage imageNamed:@"Tmode_icon.jpg"];
    cell.imageView.image = imgView.image;


    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    
//     CardViewController *detailViewController = [[CardViewController alloc] initWithNibName:@"CardViewController" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//    detailViewController.aCardImg=[deck objectAtIndex:indexPath.row];
//    [self.navigationController pushViewController:detailViewController animated:YES];
//     
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showDetailSegue"]){
        CardViewController *controller = (CardViewController *)segue.destinationViewController;
        controller.aCardImg=[deck objectAtIndex:[[self.tableView indexPathForCell:sender] row]];
    }
}

@end
