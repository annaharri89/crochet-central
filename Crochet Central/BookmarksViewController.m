//
//  BookmarksViewController.m
//  Crochet Central
//
//  Created by Anna Harrison on 4/7/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import "BookmarksViewController.h"
#import "CrochetBookmarksDataController.h"
#import "CrochetAppDelegate.h"

#import "BookmarksDetailViewController.h"
#import "StitchesDetailViewController.h"

NSMutableArray const *currentBookmark = nil;
NSMutableArray const *currentBookmarkImageArray = nil;

@interface BookmarksViewController ()

@end

@implementation BookmarksViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController = [[CrochetBookmarksDataController alloc] init];
    currentBookmark = [[NSMutableArray alloc] init];
    currentBookmarkImageArray = [[NSMutableArray alloc] init];
}

- (void)viewDidLoad
{
    self.title = @"Bookmarks";
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    //return [self.dataController countOfMasterList];
    return [userBookmarkArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookmarksCell" forIndexPath:indexPath];
    [[cell textLabel] setText:userBookmarkArray[indexPath.row][0]];
    
    
    //CrochetBookmarks *bookmarkAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    //[[cell textLabel] setText:[self.dataController objectInListAtIndex:indexPath.row].name];
    //NSLog(@"%@", bookmarkAtIndex.name);
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [userBookmarkArray removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self storeUserBookmarks];
        [self readUserBookmarks];
    }   
    //else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //}
}


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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    currentBookmark = userBookmarkArray[indexPath.row];
    [self parseArray:currentBookmark[5]];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard"
                                                         bundle: nil];
    
    BookmarksDetailViewController *detailViewController = [storyboard instantiateViewControllerWithIdentifier:@"bookmarksDetail"];
    [self presentViewController:detailViewController animated:YES completion:nil];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

-(void)storeUserBookmarks
{
    NSMutableString *stringToStore = [NSMutableString stringWithString:@""];
    for(int i = 0; i < [userBookmarkArray count]; i++)
    {
        for (NSString *object in [userBookmarkArray objectAtIndex:i])
        {
            [stringToStore appendString:[NSString stringWithFormat:@"%@1~sP ", object]];
        }
        [stringToStore appendString:@"<br>"];
    }
    
    NSError *error;
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"userBookmarks.txt"];
    
    // Write to the file
    [stringToStore writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
}

-(void)readUserBookmarks
{
    //Gets the file and parses it into an array.
    NSString *documentsDirectory = [NSHomeDirectory()
                                    stringByAppendingPathComponent:@"Documents"];
    
    NSString *filePath = [documentsDirectory
                          stringByAppendingPathComponent:@"userBookmarks.txt"];
    NSData *fileContents = [NSData dataWithContentsOfFile:filePath];
    NSString* fileContentsString = [[NSString alloc] initWithBytes:[fileContents bytes]
                                                            length:[fileContents length]
                                                          encoding: NSUTF8StringEncoding];
    
    NSArray *fileContentsArray = [[NSArray alloc] init];
    fileContentsArray = [fileContentsString componentsSeparatedByString:@"<br>"];
    
    NSArray *fileContentsArraySeparated = [[NSArray alloc] init];
    userBookmarkArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [fileContentsArray count]; i++)
    {//keeps empty arrays out of userBookmarkArray and therefore prevents the display of empty cells in bookmark view
        if ([fileContentsArray[i] length] > 0)
        {
            fileContentsArraySeparated = [fileContentsArray[i] componentsSeparatedByString:@"1~sP"];
            [userBookmarkArray addObject:fileContentsArraySeparated];
        }
    }
    storedBookmarksHaveLoaded = TRUE;
}

-(void)parseArray:(NSString *)array
{
    NSArray *holder = [[NSArray alloc] init];
    holder = [array componentsSeparatedByString:@"\n    "];
    
    for (int i = 0; i < [holder count]; i++)
    {
        //adds each of holder's strings to currentBookmarkImageArray minus one character (the last character is an unneeded ",")
        [currentBookmarkImageArray addObject:holder[i]];
        currentBookmarkImageArray[i] = [currentBookmarkImageArray[i] substringToIndex:[currentBookmarkImageArray[i] length] - 1];
    }
    
    //the following removes the \n from the end of the last string
    int i = [holder count] - 1;
    currentBookmarkImageArray[i] = [currentBookmarkImageArray[i] substringToIndex:[currentBookmarkImageArray[i] length] - 1];
    
    //the following removes the first string (for some reason it comes out as "(  "  )
    [currentBookmarkImageArray removeObjectAtIndex:0];
}

@end
