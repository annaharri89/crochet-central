//
//  BookmarksDetailChildViewDetail.m
//  Crochet Central
//
//  Created by Anna Harrison on 4/14/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import "BookmarksDetailChildViewDetail.h"

@interface BookmarksDetailChildViewDetail ()

@end

@implementation BookmarksDetailChildViewDetail

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
    self.bookmarksBigImageView.image = self.image;
}

- (void)viewDidUnload {
    [self setBookmarksBigImageView:nil];
    [super viewDidUnload];
}
@end
