//
//  RowCounterViewController.h
//  Crochet Central
//
//  Created by Anna Harrison on 3/15/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>

extern double currentCounterValue;

@interface RowCounterViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *counterLabel;
@property (strong, nonatomic) IBOutlet UIStepper *counter;
@property (strong, nonatomic) IBOutlet UIButton *reset;
- (IBAction)counterValueChanged:(id)sender;
- (IBAction)resetCounter:(id)sender;

@end
