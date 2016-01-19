//
//  BasicsMasterViewController.h
//  Crochet Central
//
//  Created by Anna Harrison on 11/19/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CrochetBasics.h"

@class CrochetBasicsDataController;
@class BasicsDetailViewController;

@interface BasicsMasterViewController : UITableViewController

@property (strong, nonatomic) CrochetBasicsDataController *dataController;
@property (strong, nonatomic) BasicsDetailViewController *detailViewController;

@end

