//
//  StitchesDetailChildViewController.h
//  Crochet Central
//
//  Created by Anna Harrison on 12/14/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StitchesDetailChildViewCell.h"

@class CrochetStitchDataController;

@interface StitchesDetailChildViewController: UICollectionViewController
<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) CrochetStitchDataController *dataController;

@end