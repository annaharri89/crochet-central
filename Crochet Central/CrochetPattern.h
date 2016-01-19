//
//  CrochetPattern.h
//  Crochet Central
//
//  Created by Anna Harrison on 12/13/12.
//  Copyright (c) 2012 Anna Harrison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrochetPattern : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *video; //should be a url
@property (nonatomic, strong) NSString *instructions; //for now this is a string.
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *abbreviations;

-(id)initWithName:(NSString *)name type:(NSString *)type icon:(NSString *)icon instructions:(NSString *)instructions
video:(NSString *)video images:(NSArray *)images abbreviations:(NSArray *)abbreviations;

@end
