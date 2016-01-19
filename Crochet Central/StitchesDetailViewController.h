//
//  StitchesDetailViewController.h
//  Crochet Central
//
//  Created by Anna Harrison on 12/13/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrochetStitch;
@class CrochetStitchDataController;

@interface StitchesDetailViewController : UIViewController

@property (strong, nonatomic) CrochetStitchDataController *dataController;
@property (strong, nonatomic) CrochetStitch *stitch;
@property (strong, nonatomic) UIPopoverController *currentPopOver;
@property (strong, nonatomic) IBOutlet UITextView *stitchContentText;
@property (strong, nonatomic) IBOutlet UILabel *stitchNameLabel;
@property (strong, nonatomic) IBOutlet UIWebView *stitchWebView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *bookMarks;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *rowCounter;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *addBookmarkButton;
- (IBAction)addBookmark:(id)sender;

-(void)changeAddBookmarkImage; //changes the bookmark image to filled if page has been bookmarked and to stroked if page is not bookmarked.
-(void)storeUserBookmarks; //takes userBookmarkArray, changes it to a string, and then stores it in external file
-(void)readUserBookmarks;//reads bookmarks from external file
@end
