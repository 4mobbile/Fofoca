//
//  NovelaModel+Parse.h
//  Fofoca
//
//  Created by Alexandre Marones on 1/30/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "NovelaModel.h"
#import "Global.h"
#import "JSONKit.h"
#import "EGOCache+PGCache.h"
#import "YQL.h"

@interface NovelaModel (Parse)

+ (NSArray *)parseNovela;

@end
