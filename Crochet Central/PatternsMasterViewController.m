//
//  PatternsMasterViewController.m
//  Crochet Central
//
//  Created by Anna Harrison on 12/13/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import "PatternsMasterViewController.h"
#import "PatternsDetailViewController.h"

#import "CrochetPatternDataController.h"
#import "CrochetPattern.h"

CrochetPattern const *currentPattern = nil;
/*
 @interface MyCollectionViewController ()
 
 @end
 */

@implementation PatternsMasterViewController


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
    PatternsMasterViewCell *cell = [collectionView
                                        dequeueReusableCellWithReuseIdentifier:@"PatternsCell"
                                        forIndexPath:indexPath];
    
    CrochetPattern *patternAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    
    [[cell patternIconLabel] setText:patternAtIndex.name];
    [[cell patternIcon] setImage:[UIImage imageNamed:patternAtIndex.icon]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowPatternDetails"])
    {
        NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        PatternsDetailViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.pattern = [self.dataController objectInListAtIndex:selectedIndexPath.row];
        currentPattern = detailViewController.pattern;
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