//
//  PatternsMasterViewController.h
//  Crochet Central
//
//  Created by Anna Harrison on 12/13/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatternsMasterViewCell.h"

#import "CrochetPattern.h"

extern CrochetPattern const *currentPattern;

@class CrochetPatternDataController;

@interface PatternsMasterViewController : UICollectionViewController
<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) CrochetPatternDataController *dataController;
@property (strong, nonatomic) UIPopoverController *currentPopOver;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *bookMarks;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *rowCounter;

@end