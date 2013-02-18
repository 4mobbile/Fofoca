//
//  ChapterModel+Parse.m
//  Fofoca
//
//  Created by Alexandre Marones on 2/4/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "ChapterModel+Parse.h"

@implementation ChapterModel (Parse)

+ (NSArray *)parseChaptersWithNovela:(NSString *)nameNovela {
    NSMutableArray *chapters = [[NSMutableArray alloc] init];
    NSString *url = K_YQL_NOVELA_FUXICO;
    
    url = [url stringByReplacingOccurrencesOfString:@"%@" withString:[self ajustNameNovelaWithString:nameNovela]];
        
    @try {
        [EGOCache setYQL:url withTimeoutInterval:K_CACHE_TIME onSuccessPerform:^(NSString *content, NSError *error) {
            NSDictionary *dic = [content objectFromJSONString];
            NSDictionary *result = [[dic objectForKey:@"query"] objectForKey:@"results"];
                        
            for (NSDictionary *item in [YQL forceArrayWithId:[[result objectForKey:@"div"] objectForKey:@"ul"]]) {
                for (NSDictionary *itemLi in [YQL forceArrayWithId:[item objectForKey:@"li"]]) {
                    ChapterModel *chapter = [[ChapterModel alloc] init];
                    chapter = [ChapterModel parseChapter:itemLi];
                    [chapters addObject:chapter];
                }
            }
        }];
    }
    @catch (NSException *exception) {
        NSLog(@"Erro no parseNovela: %@", [exception description]);
    }
    @finally {
        return chapters;
    }
}

+ (ChapterModel *)parseChapter:(NSDictionary *)dic {
    ChapterModel *chapter = [[ChapterModel alloc] init];
    chapter.title = [[[dic objectForKey:@"h2"] objectForKey:@"a"] objectForKey:@"content"];
    chapter.exhibitionAt = [[dic objectForKey:@"h6"] objectForKey:@"strong"];
    chapter.image = [NSString stringWithFormat:@"https://ofuxico.terra.com.br%@", [[[dic objectForKey:@"a"] objectForKey:@"img"] objectForKey:@"src"]];
    chapter.url = [NSString stringWithFormat:@"https://ofuxico.terra.com.br%@", [[[dic objectForKey:@"h2"] objectForKey:@"a"] objectForKey:@"href"]];
    
    return chapter;
}

+ (NSString *)ajustNameNovelaWithString:(NSString *)name {
    name = [name lowercaseString];
    name = [name stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    name = [name removePonctuationWithHifenFromString];
    return name;
}

@end
