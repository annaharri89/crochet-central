//
//  StitchesMasterViewController.m
//  CollectionsDemo
//
//  Created by Anna Harrison on 12/5/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import "StitchesMasterViewController.h"
#import "StitchesDetailViewController.h"

#import "CrochetStitchDataController.h"
#import "CrochetStitch.h"

CrochetStitch const *currentStitch = nil;
/*
 @interface MyCollectionViewController ()
 
 @end
 */

@implementation StitchesMasterViewController


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
    //adds buttons to top navigation bar
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:self.rowCounter, self.bookMarks, nil];
    self.navigationController.toolbarHidden = YES;
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

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return [self.dataController countOfMasterList];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    StitchesMasterViewCell *cell = [collectionView
                                    dequeueReusableCellWithReuseIdentifier:@"StitchesCell"
                                    forIndexPath:indexPath];
    
    CrochetStitch *stitchAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    
    [[cell stitchIconLabel] setText:stitchAtIndex.name];
    [[cell stitchIcon] setImage:[UIImage imageNamed:stitchAtIndex.icon]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowStitchDetails"])
    {
        NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        StitchesDetailViewController *detailViewController = [segue destinationViewController];

        detailViewController.stitch = [self.dataController objectInListAtIndex:selectedIndexPath.row];
        currentStitch = detailViewController.stitch;
    }
    
    if([segue isKindOfClass:[UIStoryboardPopoverSegue class]])
    {
        [self.currentPopOver dismissPopoverAnimated:YES];
        self.currentPopOver = [(UIStoryboardPopoverSegue *)segue popoverController];
    }
}

- (void)viewDidUnload {
    [self setBookMarks:nil];
    [self setRowCounter:nil];
    [super viewDidUnload];
}
@end
