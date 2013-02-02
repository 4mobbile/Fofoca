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
#import "NSString+PGString.h"

@interface NovelaModel (Parse)

+ (NSArray *)parseChaptersWithNovela:(NSString *)novela;
+ (NSString *)ajustNameNovelaWithString:(NSString *)name;

@end
