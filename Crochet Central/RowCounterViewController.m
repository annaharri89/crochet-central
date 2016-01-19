//
//  RowCounterViewController.m
//  Crochet Central
//
//  Created by Anna Harrison on 3/15/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import "RowCounterViewController.h"

double currentCounterValue = 0;

@interface RowCounterViewController ()

@end

@implementation RowCounterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.counter.value = currentCounterValue;
    self.counterLabel.text = [NSString stringWithFormat:@"%.f", currentCounterValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setCounterLabel:nil];
    [self setCounter:nil];
    [self setReset:nil];
    [super viewDidUnload];
}

- (IBAction)counterValueChanged:(id)sender {
    currentCounterValue = self.counter.value;
    //double counterValue = self.counter.value;
    self.counterLabel.text = [NSString stringWithFormat:@"%.f", currentCounterValue];
}

- (IBAction)resetCounter:(id)sender {
    self.counter.value = 0;
    currentCounterValue = self.counter.value;
    self.counterLabel.text = [NSString stringWithFormat:@"%.f", currentCounterValue];
}

@end
