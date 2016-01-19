//
//  PatternsDetailViewController.h
//  Crochet Central
//
//  Created by Anna Harrison on 12/13/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PatternsDetailViewCell.h"

@class CrochetPattern;
@class CrochetPatternDataController;

@interface PatternsDetailViewController : UIViewController

@property (strong, nonatomic) CrochetPatternDataController *dataController;
@property (strong, nonatomic) CrochetPattern *pattern;
@property (strong, nonatomic) UIPopoverController *currentPopOver;

@property (strong, nonatomic) IBOutlet UITextView *patternContentText;
@property (strong, nonatomic) IBOutlet UILabel *patternNameLabel;
@property (strong, nonatomic) IBOutlet UIWebView *patternWebView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *bookMarks;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *rowCounter;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *addBookmarkButton;
- (IBAction)addBookmark:(id)sender;

-(void)changeAddBookmarkImage; //shows user that their bookmark was saved by changing stroked star to filled star
-(void)storeUserBookmarks; //takes userBookmarkArray, changes it to a string, and then stores it in external file
-(void)readUserBookmarks;//reads bookmarks from external file

@end
