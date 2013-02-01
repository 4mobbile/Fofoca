//
//  NewsModel+Parse.h
//  Fofoca
//
//  Created by Alexandre Marones on 1/31/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "NewsModel.h"
#import "NSString+HTML.h"

@interface NewsModel (Parse)

+ (NewsModel *)parseWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)parseWithArray:(NSArray *)array;

@end
