//
//  BasicsDetailViewController.h
//  Crochet Central
//
//  Created by Anna Harrison on 11/19/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CrochetBasics.h"

extern CrochetBasics const *currentBasicSelected;
extern NSInteger const *basicImageSelected;

@class CrochetBasics;

@interface BasicsDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) CrochetBasics *basics;
@property (strong, nonatomic) UIPopoverController *currentPopOver;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UITextView *detailInstructionText;
@property (strong, nonatomic) IBOutlet UIWebView *detailWebView;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *bookMarks;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *rowCounter;

@end


