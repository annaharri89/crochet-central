//
//  PatternsDetailViewController.m
//  Crochet Central
//
//  Created by Anna Harrison on 12/13/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import "PatternsDetailViewController.h"

#import "CrochetPattern.h"
#import "CrochetPatternDataController.h"
#import "CrochetAppDelegate.h"

@interface PatternsDetailViewController ()

@end

@implementation PatternsDetailViewController

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
    
    self.dataController = [[CrochetPatternDataController alloc] init];
    
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

- (void)setPattern:(CrochetPattern *) newPattern
{
    if (_pattern != newPattern) {
        _pattern = newPattern;
        
        // Update the view.
        [self configureView];
    }
}

//got this from http://www.mightymeta.co.uk/embedding-youtube-within-iphone-apps/
- (void)embedYouTube:(NSString *)currentPatternVideo
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
                           </html>", currentPatternVideo];
    
    [self.patternWebView loadHTMLString:videoHTML baseURL:nil];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    CrochetPattern *thePattern = self.pattern;
    if (thePattern) {
        if (![thePattern.video isEqualToString:@"NULL"]) {//leaves webview empty if video string == NULL
            self.patternWebView.opaque = NO;
            [self embedYouTube:(thePattern.video)];
        }
        self.patternNameLabel.text = thePattern.name;
        self.patternContentText.text = thePattern.instructions;
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
    [self setPatternContentText:nil];
    [self setPatternNameLabel:nil];
    [self setPatternWebView:nil];
    [self setBookMarks:nil];
    [self setRowCounter:nil];
    [self setAddBookmarkButton:nil];
    [super viewDidUnload];
}
- (IBAction)addBookmark:(id)sender {
    if (self.addBookmarkButton.image == [UIImage imageNamed:@"addBookmarkEmpty.png"])
    {//This prevents duplicate bookmarks
        NSArray *bookmarkPattern = [[NSArray alloc] initWithObjects:self.pattern.name, self.pattern.type, self.pattern.icon, self.pattern.instructions, self.pattern.video, self.pattern.images, self.pattern.abbreviations, nil];
        [userBookmarkArray addObject:bookmarkPattern];
        [self changeAddBookmarkImage];
    }
    [self storeUserBookmarks];
    [self readUserBookmarks];
}

-(void)changeAddBookmarkImage
{//checks to see if the current pattern name exists in userBookmarkArray. If it does it changes the addbookmarkbutton image to addBookmarkFilled.png. (in order to show that the bookmark has been saved.)
    for (int i = 0; i < [userBookmarkArray count]; i++)
    {
        if ([self.pattern.name isEqualToString:userBookmarkArray[i][0]])
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
    NSLog(@"%@", stringToStore);
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
