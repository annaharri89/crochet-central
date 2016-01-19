//
//  CrochetBasics.h
//  Crochet Central
//
//  Created by Anna Harrison on 2/26/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrochetBasics : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSString *instructions; //for now this is a string.
@property (nonatomic, strong) NSString *video; //should be a url
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *abbreviations;


-(id)initWithName:(NSString *)name instructions:(NSString *)instructions
video:(NSString *)video images:(NSArray *)images abbreviations:(NSArray *)abbrevations;

@end