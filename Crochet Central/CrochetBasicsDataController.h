//
//  CrochetBasicsDataController.h
//  Crochet Central
//
//  Created by Anna Harrison on 2/26/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CrochetBasics;

@interface CrochetBasicsDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterCrochetBasicsList;

- (NSUInteger)countOfMasterList;
- (CrochetBasics *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addCrochetBasicsWithBasics:(CrochetBasics *)basics;

@end
