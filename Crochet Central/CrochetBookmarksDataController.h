//
//  CrochetBookmarksDataController.h
//  Crochet Central
//
//  Created by Anna Harrison on 4/8/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CrochetBookmarks;

@interface CrochetBookmarksDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterCrochetBookmarksList;

- (NSUInteger)countOfMasterList;
- (CrochetBookmarks *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addCrochetPatternWithPattern:(CrochetBookmarks *)bookmark;

@property (nonatomic, copy) NSMutableArray *masterCrochetPatternList;

@end
