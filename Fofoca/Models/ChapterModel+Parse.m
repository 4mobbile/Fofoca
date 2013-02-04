//
//  ChapterModel+Parse.m
//  Fofoca
//
//  Created by Alexandre Marones on 2/4/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "ChapterModel+Parse.h"

@implementation ChapterModel (Parse)

+ (NSArray *)parseChaptersWithDictionary:(NSDictionary *)dic {
    NSMutableArray *chapters = [[NSMutableArray alloc] init];
    for (NSDictionary *item in [YQL forceArrayWithId:[[[dic objectForKey:@"div"] objectForKey:@"ul"] objectForKey:@"li"]]) {
        ChapterModel *chapter = [[ChapterModel alloc] init];
        chapter = [ChapterModel parseChapter:item];
        [chapters addObject:chapter];
    }
    return chapters;
}

+ (ChapterModel *)parseChapter:(NSDictionary *)dic {
    ChapterModel *chapter = [[ChapterModel alloc] init];
    chapter.title = [[[[dic objectForKey:@"h2"] objectForKey:@"a"] objectForKey:@"content"] objectForKey:@"content"];
    chapter.exhibitionAt = [[dic objectForKey:@"h6"] objectForKey:@"strong"];
    chapter.image = [NSString stringWithFormat:@"https://ofuxico.terra.com.br%@", [[[dic objectForKey:@"a"] objectForKey:@"img"] objectForKey:@"src"]];;
    chapter.url = [NSString stringWithFormat:@"https://ofuxico.terra.com.br%@", [[[dic objectForKey:@"h2"] objectForKey:@"a"] objectForKey:@"href"]];;
    return chapter;
}

@end
