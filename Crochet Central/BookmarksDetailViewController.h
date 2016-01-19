//
//  BookmarksDetailViewController.h
//  Crochet Central
//
//  Created by Anna Harrison on 4/12/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookmarksViewController.h"

@interface BookmarksDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *bookmarkNameLabel;
@property (strong, nonatomic) IBOutlet UITextView *bookmarkContentText;
@property (strong, nonatomic) IBOutlet UIWebView *bookmarkWebView;

@end
