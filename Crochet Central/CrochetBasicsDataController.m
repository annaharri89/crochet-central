//
//  CrochetBasicsDataController.m
//  Crochet Central
//
//  Created by Anna Harrison on 2/26/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import "CrochetBasicsDataController.h"
#import "CrochetBasics.h"

#import "BasicsMasterViewController.h"

@interface CrochetBasicsDataController ()
- (void)initializeDefaultDataList;
@end

@implementation CrochetBasicsDataController

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

- (void)initializeDefaultDataList {
    NSMutableArray *basicsList = [[NSMutableArray alloc] init];
    self.masterCrochetBasicsList = basicsList;
    CrochetBasics *basics;
    basics = [[CrochetBasics alloc] initWithName:@"Tools Needed"
                                    instructions:(@"In order to crochet, you will need a crochet hook, yarn, darning needles, and scissors. The darning needles will be used to weave your yarn tails in when you've finished a project. If you don't have darning needles, you can use a cochet hook, but using a darning needle is faster.")
                                           video:(NULL)
                                          images:[@[@"Hooks", @"Yarn"] mutableCopy]
                                    abbreviations:(NULL)];
    [self addCrochetBasicsWithBasics:basics];
    
    basics = [[CrochetBasics alloc] initWithName:@"Hook Sizes"
                                    instructions:(@"Hook sizes can be found on the side of your crochet hooks. Sizes in the United States are catagorized using the alphabet and milimeters. Sizes include (from smallest to largest) B - 2.25mm, C = 2.75mm, D - 3.25mm, E - 3.5mm, F - 3.75 mm, G - 4 mm, H - 5mm, I - 5.5mm, J - 6mm, and K - 6.5mm.")
                                           video:(NULL)
                                          images:[@[@"HookSizes"] mutableCopy]
                                    abbreviations:(NULL)];
    [self addCrochetBasicsWithBasics:basics];
    
    basics = [[CrochetBasics alloc] initWithName:@"Yarn Weight"
                                    instructions:(@"The weight of a yarn refers to the thickness of the yarn. Weights include (from smallest to largest) lace, fingering, sport, DK, worsted, and bulky. Worsted weight yarns are the most common type of yarn in stores that sell yarn. Sport or DK yarn are great for making socks.")
                                           video:(NULL)
                                          images:[@[@"step1placeholder", @"step2placeholder", @"step3placeholder", @"step4placeholder"] mutableCopy]
                                    abbreviations:(NULL)];
    [self addCrochetBasicsWithBasics:basics];
    
    basics = [[CrochetBasics alloc] initWithName:@"How to Hold Your Hook"
                                    instructions:(@"In your dominant hand, hold your hook between your thumb and index finger with the hook facing towards you. The part that becomes thin (were the size is located) is where you should place your fingers.")
                                           video:(@"http://www.youtube.com/embed/M83DAbKSAb0")
                                          images:[@[@"step1placeholder", @"step2placeholder", @"step3placeholder", @"step4placeholder"] mutableCopy]
                                    abbreviations:(NULL)];
    [self addCrochetBasicsWithBasics:basics];
    
    basics = [[CrochetBasics alloc] initWithName:@"How to Hold Your Yarn"
                                    instructions:(@"Step1) Lay your yarn over your pinky finger on your left hand so that the tail is closest to you. \n\nStep 2) Proceed to weave the yarn back and forth through the rest of your fingers so that it ends up going over the top of your index finger and down your palm. \n\nStep 3) Using your right hand, pick the yarn up that is laying on your palm so that you can hold the yarn between your left hand's index finger and thumb. Next you will need to work on tension.")
                                           video:(@"http://www.youtube.com/embed/GQAD3gzQGyM")
                                          images:[@[@"HoldYarnStep2", @"HoldYarnStep3"] mutableCopy]
                                    abbreviations:(NULL)];
    [self addCrochetBasicsWithBasics:basics];
    
    basics = [[CrochetBasics alloc] initWithName:@"Yarn Tension"
                                    instructions:(@"Yarn tension is important. The tighter you hold your yarn the tighter you tension is. Yarn tension is one of the factors that determines how tight/loose and how big/small a crocheted object is. (The other factors are yarn weight and hook size.) If you tend to hold your yarn too tight (which would give you something smaller than described in a pattern), you can try using a larger crochet hook in order to increase the size of whatever you're making. If you tend to hold your yarn too loose, (which would give you something larger than described in a pattern) you can try using a smaller hook in order to decrease the size of what you're making. The images to the right show what using different sized hooks will do.")
                                           video:(NULL)
                                          images:[@[@"EffectOfTension1", @"EffectOfTension2"] mutableCopy]
                                    abbreviations:(NULL)];
    [self addCrochetBasicsWithBasics:basics];
    
    basics = [[CrochetBasics alloc] initWithName:@"Slip Stitch"
                                    instructions:(@"Step1) Take your yarn in your left hand. \n\nStep 2) WIth your right hand take the end of the yarn and fold it back so that a loop is created (see image 2). \n\nStep 3) take the tail of the yarn. While holding onto the tip/end of the tail of the yarn and pull the tail of the yarn through the loop. Make sure you do not pull it all the way through. If you do you will create a knot. \n\nStep 4) Tighten the loop you have created. It should look like a small noose.")
                                           video:(@"http://www.youtube.com/embed/w9wEcSD-V3M")
                                          images:[@[@"SlipStitchStep2", @"SlipStitchStep3a", @"SlipStitchStep3b", @"SlipStitchStep4"] mutableCopy]
                                    abbreviations:[@[@"sl st"] mutableCopy]];
    [self addCrochetBasicsWithBasics:basics];
    
    basics = [[CrochetBasics alloc] initWithName:@"Chain"
                                    instructions:(@"Step 1) Create a slip knot. \n\nStep 2) Hold your yarn how you prefer and then grasp the knot of the slip knot between your thumb and inndex finger. \n\nStep 3) Insert your hook into the slip knot. \n\nStep 4) Angle your hook to the across the yarn and to the left. Bring your hook underneath the yarn and hook the yarn. This is called yarning over (yo). \n\nStep 5) Pull the crochet hook back through the loop. \n\nRepeat steps 3-5 to create as many slip knots as you desire.")
                                           video:(@"http://www.youtube.com/embed/GjoVWbYhWuc")
                                          images:[@[@"ChainStep5"] mutableCopy]
                                    abbreviations:[@[@"ch"] mutableCopy]];
    [self addCrochetBasicsWithBasics:basics];
    
    basics = [[CrochetBasics alloc] initWithName:@"Single Crochet"
                                    instructions:(@"Step 1) Insert your hook into the chain stitch. \n\nStep 2) Yarn over (yo) and pull your crochet hook back through the chain stitch. You should have two loops on your crochet hook now. \n\nStep 3) Yo once more and then pull your crochet hook back through both loops.")
                                           video:(@"http://www.youtube.com/embed/wgVOkQcf5qw")
                                          images:[@[@"SingleCrochet", @"step2placeholder", @"step3placeholder"] mutableCopy]
                                    abbreviations:[@[@"sc"] mutableCopy]];
    [self addCrochetBasicsWithBasics:basics];
    
    basics = [[CrochetBasics alloc] initWithName:@"Double Crochet"
                                    instructions:(@"Step 1) Yarn over (yo). \n\nStep 2) Insert your hook into the chain stitch. \n\nStep 3) Yarn over (yo) again and pull your crochet hook back through the chain stitch. You should have three loops on your crochet hook now. \n\nStep 4) Yo once more and then pull your crochet hook back through two of the three loops. \n\nStep 5) Yo once more and then pull your crochet hook back through the remaining two loops.")
                                           video:(@"http://www.youtube.com/embed/5xKssKskNzo")
                                          images:[@[@"DoubleCrochet", @"step2placeholder", @"step3placeholder", @"step4placeholder", @"step5placeholder"] mutableCopy]
                                    abbreviations:[@[@"dc"] mutableCopy]];
    [self addCrochetBasicsWithBasics:basics];
    
    basics = [[CrochetBasics alloc] initWithName:@"Half Double Crochet"
                                    instructions:(@"Step 1) Yarn over (yo). \n\nStep 2) Insert your hook into the chain stitch. \n\nStep 3) Yarn over (yo) again and pull your crochet hook back through the chain stitch. You should have three loops on your crochet hook now. \n\nStep 4) Yo once more and then pull your crochet hook back through all three loops.")
                                           video:(@"http://www.youtube.com/embed/QnOYlwGN5cI")
                                          images:[@[@"HalfDoubleCrochet", @"step2placeholder", @"step3placeholder", @"step4placeholder"] mutableCopy]
                                    abbreviations:[@[@"hdc"] mutableCopy]];
    [self addCrochetBasicsWithBasics:basics];
    
    basics = [[CrochetBasics alloc] initWithName:@"Your First Pattern"
                                    instructions:(@"Chain 3. \n\nRnd 1: In the 3rd chain, sc six times (6 sts). \n\nRnd 2: 2 sc in each st around (12 sts). \n\nRnd 3: 2 sc in each st around (24 sts). \n\nRnd 4: Sc in each st around (24 sts). \n\nRnd 5: *2 sc in 1 st, 1 sc in 1 st. Repeat from * around (36 sts). \n\nRnd 6: Sc in each st around (36 sts). \n\nRnd 7: *2 sc in 1 st, 1 sc in each of the next 2sc (48 sts). \n\nRnd 8-15: Sc in each st around (48 sts). \n\nRnd 16: *sc2tog, sc in each of the next 10 sts. Repeat from * 3 more times (44 sts.) \n\nRnd 17-19: sc in each st around (44 sts). \n\nRnd 20: *sc2tog, sc in each of the next 9 sts. Repeat from * 3 more times (40 sts.) \n\nRnd 21-22: sc in each st around (40 sts). \n\nRnd 23: *sc2tog, sc in each of the next 8 sts. Repeat from * 3 more times (36 sts.) \n\nRnd 24: sc in each st around (36 sts). \n\nRnd 25: *sc2tog, sc in each of the next 7 sts. Repeat from * 3 more times (32 sts.) \n\nRnd 26: sc in each stitch around (32 sts). \n\nRnd 27: *sc2tog, sc in each of the next 6 sts. Repeat from * 3 more times (28 sts.) \n\nRnd 28-31: sc in each st around (28 sts).")
                                           video:(NULL)
                                          images:[@[@"UnfinishedOctopus", @"LegCurl", @"Spots"] mutableCopy]
                                    abbreviations:(NULL)];
    [self addCrochetBasicsWithBasics:basics];
}

- (void)setMasterCrochetBasicsList:(NSMutableArray *)newList {
    if (_masterCrochetBasicsList != newList) {
        _masterCrochetBasicsList = [newList mutableCopy];
    }
}

- (NSUInteger)countOfMasterList {
    return [self.masterCrochetBasicsList count];
}

- (CrochetBasics *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterCrochetBasicsList objectAtIndex:theIndex];
}

- (void)addCrochetBasicsWithBasics:(CrochetBasics *)basics {
    [self.masterCrochetBasicsList addObject:basics];
}

@end