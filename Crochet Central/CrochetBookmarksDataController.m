//
//  CrochetBookmarksDataController.m
//  Crochet Central
//
//  Created by Anna Harrison on 4/8/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import "CrochetBookmarksDataController.h"
#import "CrochetBookmarks.h"

@interface CrochetBookmarksDataController ()
- (void)initializeDefaultDataList;
@end

@implementation CrochetBookmarksDataController

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

- (void)initializeDefaultDataList {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"userBookmarks" ofType:@"txt"];
    NSData *bookmarkData = [NSData dataWithContentsOfFile:filePath];
    NSString* bookmarkString = [[NSString alloc] initWithBytes:[bookmarkData bytes]
                                                        length:[bookmarkData length]
                                                      encoding: NSUTF8StringEncoding];
    
    
    NSString* delimiter = @"<br>";
    NSArray *arrayHolder = [[NSArray alloc] init];
    arrayHolder = [bookmarkString componentsSeparatedByString:delimiter];
    
    NSMutableArray *bookmarkList = [[NSMutableArray alloc] init];
    self.masterCrochetBookmarksList = bookmarkList;
    CrochetBookmarks *bookmark;
    
    for (int i = 0; i< [arrayHolder count]; i++)
    {
        bookmark = [CrochetBookmarks alloc];
        bookmark = arrayHolder[i];
        [self addCrochetBookmarkWithBookmark:bookmark];
    }
}

- (void)setMasterCrochetBookmarksList:(NSMutableArray *)newList {
    if (_masterCrochetBookmarksList != newList) {
        _masterCrochetBookmarksList = [newList mutableCopy];
    }
}

- (NSUInteger)countOfMasterList {
    return [self.masterCrochetBookmarksList count];
}

- (CrochetBookmarks *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterCrochetBookmarksList objectAtIndex:theIndex];
}

- (void)addCrochetBookmarkWithBookmark:(CrochetBookmarks *)bookmark {
    [self.masterCrochetBookmarksList addObject:bookmark];
}

@end
