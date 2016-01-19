//
//  TutorialViewController.h
//  Crochet Central
//
//  Created by Anna Harrison on 4/6/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//
//I used the code from this website for the tutorial code: http://code.davidjanes.com/blog/2009/09/26/uipagecontrol-uiscrollview/

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController <UIScrollViewDelegate>
{
    BOOL pageControlIsChangingPage;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)changePage:(id)sender;

- (void)setupPage;

@end
