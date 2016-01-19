//
//  CrochetStitchDataController.m
//  Crochet Central
//
//  Created by Anna Harrison on 12/7/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import "CrochetStitchDataController.h"
#import "CrochetStitch.h"

#import "StitchesMasterViewController.h"

@interface CrochetStitchDataController ()
- (void)initializeDefaultDataList;
@end

@implementation CrochetStitchDataController

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

- (void)initializeDefaultDataList {
    NSMutableArray *stitchList = [[NSMutableArray alloc] init];
    self.masterCrochetStitchList = stitchList;
    CrochetStitch *stitch;
    stitch = [[CrochetStitch alloc] initWithName:@"Single Crochet"
                                            type:@"stitch"
                                            icon:@"SingleCrochetSMALL.png"
                                    instructions:(@"Step 1) Insert your hook into the chain stitch. \n\nStep 2) Yarn over (yo) and pull your crochet hook back through the chain stitch. You should have two loops on your crochet hook now. \n\nStep 3) Yo once more and then pull your crochet hook back through both loops.")
                                           video:(@"http://www.youtube.com/embed/wgVOkQcf5qw")
                                          images:[@[@"SingleCrochet", @"step2placeholder", @"step3placeholder"] mutableCopy]
                                    abbreviations:[@[@"sc"] mutableCopy]];
    [self addCrochetStitchWithStitch:stitch];
    
    stitch = [[CrochetStitch alloc] initWithName:@"Double Crochet"
                                            type:@"stitch"
                                            icon:@"DoubleCrochetSMALL.png"
                                    instructions:(@"Step 1) Yarn over (yo). \n\nStep 2) Insert your hook into the chain stitch. \n\nStep 3) Yarn over (yo) again and pull your crochet hook back through the chain stitch. You should have three loops on your crochet hook now. \n\nStep 4) Yo once more and then pull your crochet hook back through two of the three loops. \n\nStep 5) Yo once more and then pull your crochet hook back through the remaining two loops.")
                                           video:(@"http://www.youtube.com/embed/5xKssKskNzo")
                                          images:[@[@"DoubleCrochet", @"step2placeholder", @"step3placeholder", @"step4placeholder", @"step5placeholder"] mutableCopy]
                                    abbreviations:[@[@"dc"] mutableCopy]];
    [self addCrochetStitchWithStitch:stitch];
    
    stitch = [[CrochetStitch alloc] initWithName:@"Half Double Crochet"
                                            type:@"stitch"
                                            icon:@"HalfDoubleCrochetSMALL.png"
                                    instructions:(@"Step 1) Yarn over (yo). \n\nStep 2) Insert your hook into the chain stitch. \n\nStep 3) Yarn over (yo) again and pull your crochet hook back through the chain stitch. You should have three loops on your crochet hook now. \n\nStep 4) Yo once more and then pull your crochet hook back through all three loops.")
                                           video:(@"http://www.youtube.com/embed/QnOYlwGN5cI")
                                          images:[@[@"HalfDoubleCrochet", @"step2placeholder", @"step3placeholder", @"step4placeholder"] mutableCopy]
                                    abbreviations:[@[@"hdc"] mutableCopy]];
    [self addCrochetStitchWithStitch:stitch];
    stitch = [[CrochetStitch alloc] initWithName:@"Triple Crochet"
                                            type:@"stitch"
                                            icon:@"TripleCrochetSMALL.png"
                                    instructions:(@"Step 1) Yarn over (yo) twice. \n\nStep 2) Insert your hook into the chain stitch. \n\nStep 3) Yarn over (yo) again and pull your crochet hook back through the chain stitch. You should have four loops on your crochet hook now. \n\nStep 4) Yo once more and then pull your crochet hook back through two of loops. \n\nStep 5) Repeat step 4 two more times until you only have one loop left. This completes the triple crochet stitch.")
                                           video:(@"http://www.youtube.com/embed/i4xplEBGowg")
                                          images:[@[@"TripleCrochet", @"step2placeholder", @"step3placeholder", @"step4placeholder"] mutableCopy]
                                   abbreviations:[@[@"tr"] mutableCopy]];
    [self addCrochetStitchWithStitch:stitch];
}

- (void)setMasterCrochetStitchList:(NSMutableArray *)newList {
    if (_masterCrochetStitchList != newList) {
        _masterCrochetStitchList = [newList mutableCopy];
    }
}

- (NSUInteger)countOfMasterList {
    return [self.masterCrochetStitchList count];
}

- (NSUInteger)countOfImagesList {
    return [currentStitch.images count];
}

- (CrochetStitch *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterCrochetStitchList objectAtIndex:theIndex];
}

- (void)addCrochetStitchWithStitch:(CrochetStitch *)stitch {
    [self.masterCrochetStitchList addObject:stitch];
}

@end




