//
//  BasicsDetailViewController.m
//  Crochet Central
//
//  Created by Anna Harrison on 11/19/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import "BasicsMasterViewController.h"
#import "BasicsDetailViewController.h"
#import "CrochetBasics.h"
#import "CrochetBasicsDataController.h"//might not need

CrochetBasics const *currentBasicSelected = nil;
NSInteger const *basicImageSelected = nil;

@interface BasicsDetailViewController ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation BasicsDetailViewController

#pragma mark - Managing the detail item
 
- (void)setBasics:(CrochetBasics *) newBasics
{
    if (_basics != newBasics) {
        _basics = newBasics;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

- (void) cleanUpSubViews
{
    //Removes the old image gallery.
    for(UIView *subview in [self.view subviews])
    {
        if([subview isKindOfClass:[UIScrollView class]] && [subview isKindOfClass:[UITextView class]] == NO)
        {
            [subview removeFromSuperview];
        }
    }
}

- (void)addBasicsImageGallery:(CrochetBasics *)currentBasic
{
    int increaseYCoord = 0; //will be used to increase the Y coordinates in the for loop
    CGRect scrollViewFrame;
    
    if (currentBasic.video == NULL){//Makes scroll view longer if there is no video
        scrollViewFrame = CGRectMake(348, 49, 335, 606);
    }
    else {
        scrollViewFrame = CGRectMake(348, 49, 335, 344);
    }
    
    //SCROLL VIEW - creates and adds to Basics view
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
    //scrollViewContentSize will fit all images in the image array no matter how many images there are
    CGSize scrollViewContentSize = CGSizeMake(300, [currentBasic.images count] * 285);
    
    UIColor *mercuryColor = [[UIColor alloc] initWithRed:230.00/255.00 green:230.00/255.00 blue:230.00/255.00 alpha:1.0f];
    scrollView.backgroundColor = mercuryColor;
    [scrollView setContentSize:scrollViewContentSize];
    [self cleanUpSubViews];
    [self.view addSubview:scrollView];
    
    for (int i = 0; i<[currentBasic.images count]; i++) {
        //Create image buttons
        UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        NSString *imageToLoad = [NSString stringWithFormat:@"%@BASICS_SMALL.png", currentBasic.images[i]]; 
        UIImage *buttonImageNormal = [UIImage imageNamed:imageToLoad];
        
        imageButton.frame = CGRectMake(23.0, 10.0 + increaseYCoord, 290.0, 246.0);
        [imageButton setBackgroundImage:buttonImageNormal forState:UIControlStateNormal];
        [imageButton setTag:i];
        [imageButton addTarget: self
                        action: @selector(showBasicsChildDetailViewController:)
              forControlEvents: UIControlEventTouchDown];
        
        //Create image label
        UILabel *imageLabel = [[UILabel alloc] initWithFrame:CGRectMake(23.0, 256.0 + increaseYCoord, 290, 20)];
        [imageLabel setText:currentBasic.images[i]];
        [imageLabel setTextAlignment:UITextAlignmentCenter]; //centers text
        imageLabel.backgroundColor = mercuryColor;
        
        [scrollView addSubview:imageLabel];
        [scrollView addSubview:imageButton];
        increaseYCoord += 285;
    }
}

- (IBAction)showBasicsChildDetailViewController:(UIButton*)button
{
    currentBasicSelected = self.basics;
    basicImageSelected = [button tag];
    NSString *storyboardName = @"MainStoryboard";
    NSString *controllerID = @"bigImage";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *controller = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:controllerID];
    [self presentViewController:controller animated:YES completion:nil];
}

//got this from http://www.mightymeta.co.uk/embedding-youtube-within-iphone-apps/
- (void)embedYouTube:(NSString *)currentBasicVideo
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
                 </html>", currentBasicVideo]; 
    
    [self.detailWebView loadHTMLString:videoHTML baseURL:nil];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    CrochetBasics *aBasic = self.basics;
    
    if (aBasic)
    {
        self.detailWebView.opaque = NO;
        [self embedYouTube:(aBasic.video)];
        
        [self addBasicsImageGallery:(aBasic)];
        self.detailDescriptionLabel.text = aBasic.name;
        self.detailInstructionText.text = aBasic.instructions;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Makes it so that multiple popovers won't appear
    if([segue isKindOfClass:[UIStoryboardPopoverSegue class]])
    {
        [self.currentPopOver dismissPopoverAnimated:YES];
        self.currentPopOver = [(UIStoryboardPopoverSegue *)segue popoverController];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    //adds buttons to top navigation bar
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:self.rowCounter, self.bookMarks, nil];
    self.navigationController.toolbarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}
 */

- (void)viewDidUnload {
    [self setDetailInstructionText:nil];
    [self setDetailWebView:nil];
    [self setBookMarks:nil];
    [self setRowCounter:nil];
    [super viewDidUnload];
}
@end
