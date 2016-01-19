//
//  PatternsDetailChildViewController.m
//  Crochet Central
//
//  Created by Anna Harrison on 12/15/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import "PatternsMasterViewController.h"//might not need
#import "PatternsDetailViewController.h"
#import "PatternsDetailChildViewController.h"
#import "PatternsChildViewDetail.h"

#import "CrochetPatternDataController.h"
#import "CrochetPattern.h"
/*
 @interface MyCollectionViewController ()
 
 @end
 */

@implementation PatternsDetailChildViewController


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
    
    self.dataController = [[CrochetPatternDataController alloc] init];
    
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
    PatternsDetailChildViewCell *cell = [collectionView
                                         dequeueReusableCellWithReuseIdentifier:@"PatternsDetailCell"
                                         forIndexPath:indexPath];
    
    int row = [indexPath row];
    
    //this loads the images for the cells
    NSString *imageToLoad = [NSString stringWithFormat:@"%@SMALL.png", currentPattern.images[row]];
    [[cell patternImageView] setImage:[UIImage imageNamed:imageToLoad]];
    [[cell patternImageLabel] setText:currentPattern.images[row]];
    
    return cell;
}

// the user tapped a collection item, load and set the image on the detail view controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showPatternChildDetails"])
    {
        NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        PatternsChildViewDetail *detailViewController = [segue destinationViewController];
        NSString *imageToLoad = [NSString stringWithFormat:@"%@BIG.png", currentPattern.images[selectedIndexPath.row]];
        detailViewController.image = [UIImage imageNamed:imageToLoad];
    }
}

@end
