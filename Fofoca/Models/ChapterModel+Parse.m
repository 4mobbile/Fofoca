//
//  ChapterModel+Parse.m
//  Fofoca
//
//  Created by Alexandre Marones on 2/4/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "ChapterModel+Parse.h"

@implementation ChapterModel (Parse)

+ (ChapterModel *)parseChapter:(NSDictionary *)dic {
    ChapterModel *chapter = [[ChapterModel alloc] init];
    chapter.title = [[[dic objectForKey:@"h2"] objectForKey:@"a"] objectForKey:@"content"];
    chapter.exhibitionAt = [[dic objectForKey:@"h6"] objectForKey:@"strong"];
    chapter.image = [NSString stringWithFormat:@"https://ofuxico.terra.com.br%@", [[[dic objectForKey:@"a"] objectForKey:@"img"] objectForKey:@"src"]];
    chapter.url = [NSString stringWithFormat:@"https://ofuxico.terra.com.br%@", [[[dic objectForKey:@"h2"] objectForKey:@"a"] objectForKey:@"href"]];
    
    return chapter;
}

+ (NSString *)ajustNameNovelaWithString:(NSString *)name {
    name = [name buildNovelaNameForUrl];
    return name;
}

@end
