//
//  PatternsChildViewDetail.m
//  Crochet Central
//
//  Created by Anna Harrison on 12/15/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import "PatternsChildViewDetail.h"

@interface PatternsChildViewDetail ()

@property (strong, nonatomic) IBOutlet UIImageView *patternBigImageView;

@end

@implementation PatternsChildViewDetail

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
    self.patternBigImageView.image = self.image;
}

- (void)viewDidUnload {
    [self setPatternBigImageView:nil];
    [super viewDidUnload];
}

@end
