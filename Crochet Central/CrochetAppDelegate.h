//
//  CrochetAppDelegate.h
//  Crochet Central
//
//  Created by Anna Harrison on 10/8/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSMutableArray const *userBookmarkArray; //holds user added bookmarks
extern BOOL const *storedBookmarksHaveLoaded; //will prevent stored bookmarks from being loaded more than once

@interface CrochetAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(void)readUserBookmarks;//occurs when the app first starts so that users will immediately see their bookmarks. It reads user's bookmarks from an external file.

@end
