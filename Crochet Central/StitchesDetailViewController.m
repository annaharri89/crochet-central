//
//  StitchesDetailViewController.m
//  Crochet Central
//
//  Created by Anna Harrison on 12/13/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import "StitchesDetailViewController.h"

#import "CrochetStitch.h"
#import "CrochetStitchDataController.h"
#import "CrochetAppDelegate.h"

@interface StitchesDetailViewController ()

@end

@implementation StitchesDetailViewController

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
 */

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.dataController = [[CrochetStitchDataController alloc] init];
    
}

-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return [self.dataController countOfMasterList];
}

- (void)setStitch:(CrochetStitch *) newStitch
{
    if (_stitch != newStitch) {
        _stitch = newStitch;
        
        // Update the view.
        [self configureView];
    }
}

//got this from http://www.mightymeta.co.uk/embedding-youtube-within-iphone-apps/
- (void)embedYouTube:(NSString *)currentStitchVideo
{
    NSString *videoHTML = [NSString stringWithFormat:@"\
                           <html>\
                           <head>\
                           <style type=\"text/css\">\
                           iframe {position:absolute; top:50%%; margin-top:-120px;}\
                           body {background-color:#000; margin:0;}\
                           </style>\
                           </head>\
                           <body>\
                           <iframe width=\"100%%\" height=\"100%%\" src=\"%@\" frameborder=\"0\" allowfullscreen></iframe>\
                           </body>\
                           </html>", currentStitchVideo];

    [self.stitchWebView loadHTMLString:videoHTML baseURL:nil];
}
 
- (void)configureView
{
    // Update the user interface for the detail item.
    CrochetStitch *theStitch = self.stitch;
    if (theStitch) {
        if (![theStitch.video isEqualToString:@"NULL"]) {//leaves webview empty if video string == NULL
            //self.stitchWebView.backgroundColor = [UIColor blackColor];
            self.stitchWebView.opaque = NO;
            [self embedYouTube:(theStitch.video)];
        }
        self.stitchNameLabel.text = theStitch.name;
        self.stitchContentText.text = theStitch.instructions;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self configureView];
    //adds buttons to top navigation bar
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:self.addBookmarkButton, self.rowCounter, self.bookMarks, nil];
    self.navigationController.toolbarHidden = YES;
    [self changeAddBookmarkImage];
}

//Makes it so that multiple popovers won't appear
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue isKindOfClass:[UIStoryboardPopoverSegue class]])
    {
        [self.currentPopOver dismissPopoverAnimated:YES];
        self.currentPopOver = [(UIStoryboardPopoverSegue *)segue popoverController];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setStitchContentText:nil];
    [self setStitchNameLabel:nil];
    [self setStitchWebView:nil];
    [self setBookMarks:nil];
    [self setRowCounter:nil];
    [self setAddBookmarkButton:nil];
    [super viewDidUnload];
}
- (IBAction)addBookmark:(id)sender {
    if (self.addBookmarkButton.image == [UIImage imageNamed:@"addBookmarkEmpty.png"])
    {//This prevents duplicate bookmarks
        NSArray *bookmarkStitch = [[NSArray alloc] initWithObjects:self.stitch.name, self.stitch.type, self.stitch.icon, self.stitch.instructions, self.stitch.video, self.stitch.images, self.stitch.abbreviations, nil];
        [userBookmarkArray addObject:bookmarkStitch];
        [self changeAddBookmarkImage];
    }
    [self storeUserBookmarks];
    [self readUserBookmarks];
}

-(void)changeAddBookmarkImage
{//checks to see if the current stitch name exists in userBookmarkArray. If it does it changes the addbookmarkbutton image to addBookmarkFilled.png. (in order to show that the bookmark has been saved.)
    for (int i = 0; i < [userBookmarkArray count]; i++)
    {
        if ([self.stitch.name isEqualToString:userBookmarkArray[i][0]])
        {
            [self.addBookmarkButton setImage:[UIImage imageNamed:@"addBookmarkFilled.png"]];
        }
    }
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

@end
