//
//  CrochetStitch.m
//  Crochet Central
//
//  Created by Anna Harrison on 12/7/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import "CrochetStitch.h"

@implementation CrochetStitch

-(id) initWithName:(NSString *)name type:(NSString *)type icon:(NSString *)icon instructions:(NSString *)instructions video:(NSString *)video images:(NSArray *)images abbreviations:(NSArray *)abbreviations
{
    self = [super init];
    if (self) {
        _name = name;
        _type = type;
        _icon = icon;
        _instructions = instructions;
        _video = video;
        _images = images;
        _abbreviations = abbreviations;
        return self;
    }
    return nil;
}
@end
