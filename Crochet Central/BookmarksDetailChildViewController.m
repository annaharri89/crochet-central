//
//  BookmarksDetailChildViewController.m
//  Crochet Central
//
//  Created by Anna Harrison on 4/12/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import "BookmarksDetailChildViewController.h"
#import "BookmarksDetailChildViewDetail.h"

@interface BookmarksDetailChildViewController ()

@end

@implementation BookmarksDetailChildViewController

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


#pragma mark -
#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView
{
    return 1;
}

//This is for the image array property in a CrochetStitch object
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    //NSLog(@"sections%lu", (unsigned long)[currentBookmark[5] count]);
    return [currentBookmarkImageArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BookmarksDetailChildViewCell *cell = [collectionView
                                         dequeueReusableCellWithReuseIdentifier:@"BookmarksDetailCell"
                                         forIndexPath:indexPath];
    
    int row = [indexPath row];
    
    //this loads the images for the cells
    NSString *imageToLoad = [NSString stringWithFormat:@"%@SMALL.png", currentBookmarkImageArray[row]];
    
    [[cell bookmarkImageView] setImage:[UIImage imageNamed:imageToLoad]];
    [[cell bookmarkImageLabel] setText:currentBookmarkImageArray[row]];
    
    return cell;
}

// the user tapped a collection item, load and set the image on the detail view controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showBookmarkChildDetails"])
    {
        NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        BookmarksDetailChildViewDetail *detailViewController = [segue destinationViewController];
        NSString *imageToLoad = [NSString stringWithFormat:@"%@BIG.png", currentBookmarkImageArray[selectedIndexPath.row]];
        
        detailViewController.image = [UIImage imageNamed:imageToLoad];
    }
}

/*
// the user tapped a collection item, load and set the image on the detail view controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showStitchChildDetails"])
    {
        NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        BookmarksChildViewDetail *detailViewController = [segue destinationViewController];
        NSString *imageToLoad = [NSString stringWithFormat:@"%@BIG.png", currentStitch.images[selectedIndexPath.row]];
        
        detailViewController.image = [UIImage imageNamed:imageToLoad];
    }
}
- (void)viewDidUnload {
    [self setBookmarkImageLabel:nil];
    [self setBookmarkImageView:nil];
    [super viewDidUnload];
}
 */
@end
