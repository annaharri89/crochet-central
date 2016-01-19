//
//  BookmarksViewController.h
//  Crochet Central
//
//  Created by Anna Harrison on 4/7/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CrochetBookmarks.h"
#import "CrochetBookmarksDataController.h"

extern NSMutableArray const *currentBookmark;
extern NSMutableArray const *currentBookmarkImageArray;

@class CrochetBookmarksDataController;

@interface BookmarksViewController : UITableViewController

@property (strong, nonatomic) CrochetBookmarksDataController *dataController;

-(void)storeUserBookmarks;//used in - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath in order to update external file when user deletes bookmark.
-(void)readUserBookmarks;//reads bookmarks from external file
-(void)parseArray:(NSString *)array;//takes a string and divides it into an array of strings. The string won't have any unwanted characters so that they can be used to present images.

@end
