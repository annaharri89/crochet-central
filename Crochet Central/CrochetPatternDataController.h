//
//  CrochetPatternDataController.h
//  Crochet Central
//
//  Created by Anna Harrison on 12/13/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CrochetPattern;

@interface CrochetPatternDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterCrochetPatternList;

- (NSUInteger)countOfMasterList;
- (NSUInteger)countOfImagesList;
- (CrochetPattern *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addCrochetPatternWithPattern:(CrochetPattern *)pattern;

@end
