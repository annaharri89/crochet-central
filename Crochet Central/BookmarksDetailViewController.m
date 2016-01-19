//
//  BookmarksDetailViewController.m
//  Crochet Central
//
//  Created by Anna Harrison on 4/12/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import "BookmarksDetailViewController.h"

@interface BookmarksDetailViewController ()

@end

@implementation BookmarksDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    
    [self.bookmarkWebView loadHTMLString:videoHTML baseURL:nil];
}

-(void)backPressed:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
    [currentBookmarkImageArray removeAllObjects];
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    //removes extra whitespace
    NSString *trimmedContentString = [currentBookmark[3] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    self.bookmarkContentText.text = trimmedContentString;
    self.bookmarkNameLabel.text = currentBookmark[0];
    
    if ([currentBookmark[4] rangeOfString:@"NULL"].location == NSNotFound)//leaves webview empty if video string contains NULL
    {
        self.bookmarkWebView.opaque = NO;
        [self embedYouTube:(currentBookmark[4])];
    }
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backPressed:)];
    
    self.navigationItem.backBarButtonItem = backBarButtonItem;
    
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setBookmarkNameLabel:nil];
    [self setBookmarkContentText:nil];
    [self setBookmarkWebView:nil];
    [super viewDidUnload];
}
@end
