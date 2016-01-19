//
//  CrochetBasics.m
//  Crochet Central
//
//  Created by Anna Harrison on 2/26/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import "CrochetBasics.h"

@implementation CrochetBasics

-(id)initWithName:(NSString *)name instructions:(NSString *)instructions
            video:(NSString *)video images:(NSArray *)images abbreviations:(NSArray *)abbrevations;
{
    self = [super init];
    if (self) {
        _name = name;
        _instructions = instructions;
        _video = video;
        _images = images;
        _abbreviations = abbrevations;
        return self;
    }
    return nil;
}

@end