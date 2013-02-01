//
//  NewsModel+Parse.m
//  Fofoca
//
//  Created by Alexandre Marones on 1/31/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "NewsModel+Parse.h"

@implementation NewsModel (Parse)

+ (NewsModel *)parseWithDictionary:(NSDictionary *)dictionary {
    NewsModel *item = [[NewsModel alloc] init];
    
    item.identifier = [dictionary objectForKey:@"id"];
    item.title = [[dictionary objectForKey:@"title"] kv_decodeHTMLCharacterEntities];
    item.publishedAt = [NSDate dateWithTimeIntervalSince1970:[[dictionary objectForKey:@"published"] floatValue]];
    item.updatedAt = [NSDate dateWithTimeIntervalSince1970:[[dictionary objectForKey:@"updated"] floatValue]];
    item.content = [[dictionary objectForKey:@"summary"] objectForKey:@"content"];
    item.author = [dictionary objectForKey:@"author"];
    
    item.link = [[[dictionary objectForKey:@"alternate"] objectAtIndex:0] objectForKey:@"href"];
    item.origin = [[[dictionary objectForKey:@"origin"] objectForKey:@"title"] kv_decodeHTMLCharacterEntities];
    
    return item;
}

+ (NSArray *)parseWithArray:(NSArray *)array {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in array) {
        NewsModel *news = [NewsModel parseWithDictionary:item];
        
        if (news.title != nil && [news.title length] > 0) {
            [items addObject:news];
        }
    }
    
    return items;
}

@end
