//
//  ChapterModel+Parse.h
//  Fofoca
//
//  Created by Alexandre Marones on 2/4/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "ChapterModel.h"
#import "Global.h"
#import "JSONKit.h"
#import "EGOCache+PGCache.h"
#import "YQL.h"
#import "NSString+PGString.h"


@interface ChapterModel (Parse)

+ (ChapterModel *)parseChapter:(NSDictionary *)dic;

@end
