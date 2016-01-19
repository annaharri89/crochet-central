//
//  StitchesChildViewDetail.m
//  Crochet Central
//
//  Created by Anna Harrison on 12/15/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import "StitchesChildViewDetail.h"

@interface StitchesChildViewDetail ()

@property (strong, nonatomic) IBOutlet UIImageView *stitchBigImageView;

@end

@implementation StitchesChildViewDetail

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.stitchBigImageView.image = self.image;
}

- (void)viewDidUnload {
    [self setStitchBigImageView:nil];
    [super viewDidUnload];
}

@end
