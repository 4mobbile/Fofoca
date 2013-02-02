//
//  EmissoraModel+Parse.h
//  Fofoca
//
//  Created by Alexandre Marones on 1/30/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "EmissoraModel.h"
#import "Global.h"
#import "JSONKit.h"
#import "EGOCache+PGCache.h"
#import "YQL.h"
#import "NovelaModel+Parse.h"

@interface EmissoraModel (Parse)

+ (NSArray *)parseEmissora;

@end
