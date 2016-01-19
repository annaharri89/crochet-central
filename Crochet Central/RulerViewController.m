//
//  RulerViewController.m
//  Crochet Central
//
//  Created by Anna Harrison on 3/7/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import "RulerViewController.h"

@interface RulerViewController ()

@end

@implementation RulerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //adds buttons to top navigation bar
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects: self.rowCounter, self.bookMarks, nil];
    self.navigationController.toolbarHidden = YES;
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
    [self setBookMarks:nil];
    [self setRowCounter:nil];
    [super viewDidUnload];
}
@end
