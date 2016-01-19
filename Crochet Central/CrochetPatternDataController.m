//
//  CrochetPatternDataController.m
//  Crochet Central
//
//  Created by Anna Harrison on 12/13/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import "CrochetPatternDataController.h"
#import "CrochetPattern.h"

#import "PatternsMasterViewController.h"

@interface CrochetPatternDataController ()
- (void)initializeDefaultDataList;
@end

@implementation CrochetPatternDataController

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

- (void)initializeDefaultDataList {
    NSMutableArray *patternList = [[NSMutableArray alloc] init];
    self.masterCrochetPatternList = patternList;
    CrochetPattern *pattern;
    pattern = [[CrochetPattern alloc] initWithName:@"Small Octopus"
                                              type:@"pattern"
                                              icon:@"octopusSMALL.png"
                                      instructions:@"Chain 3. \n\nRnd 1: In the 3rd chain, sc six times (6 sts). \n\nRnd 2: 2 sc in each st around (12 sts). \n\nRnd 3: 2 sc in each st around (24 sts). \n\nRnd 4: Sc in each st around (24 sts). \n\nRnd 5: *2 sc in 1 st, 1 sc in 1 st. Repeat from * around (36 sts). \n\nRnd 6: Sc in each st around (36 sts). \n\nRnd 7: *2 sc in 1 st, 1 sc in each of the next 2sc (48 sts). \n\nRnd 8-15: Sc in each st around (48 sts). \n\nRnd 16: *sc2tog, sc in each of the next 10 sts. Repeat from * 3 more times (44 sts.) \n\nRnd 17-19: sc in each st around (44 sts). \n\nRnd 20: *sc2tog, sc in each of the next 9 sts. Repeat from * 3 more times (40 sts.) \n\nRnd 21-22: sc in each st around (40 sts). \n\nRnd 23: *sc2tog, sc in each of the next 8 sts. Repeat from * 3 more times (36 sts.) \n\nRnd 24: sc in each st around (36 sts). \n\nRnd 25: *sc2tog, sc in each of the next 7 sts. Repeat from * 3 more times (32 sts.) \n\nRnd 26: sc in each stitch around (32 sts). \n\nRnd 27: *sc2tog, sc in each of the next 6 sts. Repeat from * 3 more times (28 sts.) \n\nRnd 28-31: sc in each st around (28 sts)."
                                             video:(@"NULL")
                                            images:[@[@"UnfinishedOctopus", @"LegCurl", @"Spots"] mutableCopy]
                                     abbreviations:[@[@"sc", @"yo"] mutableCopy]];
    [self addCrochetPatternWithPattern:pattern];
}

- (void)setMasterCrochetPatternList:(NSMutableArray *)newList {
    if (_masterCrochetPatternList != newList) {
        _masterCrochetPatternList = [newList mutableCopy];
    }
}

- (NSUInteger)countOfMasterList {
    return [self.masterCrochetPatternList count];
}

- (NSUInteger)countOfImagesList {
    return [currentPattern.images count];
}

- (CrochetPattern *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterCrochetPatternList objectAtIndex:theIndex];
}

- (void)addCrochetPatternWithPattern:(CrochetPattern *)pattern {
    [self.masterCrochetPatternList addObject:pattern];
}

@end