//
//  RulerViewController.h
//  Crochet Central
//
//  Created by Anna Harrison on 3/7/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RulerViewController : UIViewController
@property (strong, nonatomic) UIPopoverController *currentPopOver;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *bookMarks;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *rowCounter;
@end
