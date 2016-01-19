//
//  StitchesDetailChildViewController.m
//  Crochet Central
//
//  Created by Anna Harrison on 12/14/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import "StitchesMasterViewController.h"
#import "StitchesDetailViewController.h"
#import "StitchesDetailChildViewController.h"
#import "StitchesChildViewDetail.h"

#import "CrochetStitchDataController.h"
#import "CrochetStitch.h"

@implementation StitchesDetailChildViewController

/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 self.dataController = [[CrochetStitchDataController alloc] init];
 }
 return self;
 }
 */

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.dataController = [[CrochetStitchDataController alloc] init];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    return [self.dataController countOfImagesList];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    StitchesDetailChildViewCell *cell = [collectionView
                                         dequeueReusableCellWithReuseIdentifier:@"StitchesDetailCell"
                                         forIndexPath:indexPath];
    
    int row = [indexPath row];
    
    //this loads the images for the cells
    NSString *imageToLoad = [NSString stringWithFormat:@"%@SMALL.png", currentStitch.images[row]];
    [[cell stitchImageView] setImage:[UIImage imageNamed:imageToLoad]];
    [[cell stitchImageLabel] setText:currentStitch.images[row]];
    
    return cell;
}

// the user tapped a collection item, load and set the image on the detail view controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showStitchChildDetails"])
    {
        NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        StitchesChildViewDetail *detailViewController = [segue destinationViewController];
        NSString *imageToLoad = [NSString stringWithFormat:@"%@BIG.png", currentStitch.images[selectedIndexPath.row]];

        detailViewController.image = [UIImage imageNamed:imageToLoad];
    }
}

@end
