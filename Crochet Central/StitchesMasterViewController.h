//
//  StitchesMasterViewController.h
//  CollectionsDemo
//
//  Created by Anna Harrison on 12/5/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StitchesMasterViewCell.h"

#import "CrochetStitch.h"

extern CrochetStitch const *currentStitch;

@class CrochetStitchDataController;

@interface StitchesMasterViewController : UICollectionViewController
<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) CrochetStitchDataController *dataController;
@property (strong, nonatomic) UIPopoverController *currentPopOver;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *bookMarks;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *rowCounter;

@end

