//
//  RulerView.h
//  Crochet Central
//
//  Created by Anna Harrison on 3/7/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>

extern BOOL const *unitsSegmentSelected;

@interface RulerView : UIView

@property (strong, nonatomic) IBOutlet UISegmentedControl *unitsSegment;
- (IBAction)unitSegmentChanged:(id)sender;

@end
