//
//  CrochetStitchDataController.h
//  Crochet Central
//
//  Created by Anna Harrison on 12/7/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CrochetStitch;

@interface CrochetStitchDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterCrochetStitchList;

- (NSUInteger)countOfMasterList;
- (NSUInteger)countOfImagesList;
- (CrochetStitch *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addCrochetStitchWithStitch:(CrochetStitch *)stitch;

@end
