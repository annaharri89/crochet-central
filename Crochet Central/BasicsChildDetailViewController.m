//
//  BasicsChildDetailViewController.m
//  Crochet Central
//
//  Created by Anna Harrison on 3/8/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import "BasicsChildDetailViewController.h"
#import "BasicsDetailViewController.h"

@interface BasicsChildDetailViewController ()

@end

@implementation BasicsChildDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)backPressed: (id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backPressed:)];
    self.navigationItem.leftBarButtonItem = back;
    
    int i = basicImageSelected;
    NSString *imageToLoad = [NSString stringWithFormat:@"%@BIG.png", currentBasicSelected.images[i]];
    [self.image setImage:[UIImage imageNamed:imageToLoad]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setImage:nil];
    [super viewDidUnload];
}
@end
