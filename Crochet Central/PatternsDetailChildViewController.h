//
//  PatternsDetailChildViewController.h
//  Crochet Central
//
//  Created by Anna Harrison on 12/15/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatternsDetailChildViewCell.h"

@class CrochetPatternDataController;

@interface PatternsDetailChildViewController: UICollectionViewController
<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) CrochetPatternDataController *dataController;

@end
