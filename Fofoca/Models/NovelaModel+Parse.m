//
//  NovelaModel+Parse.m
//  Fofoca
//
//  Created by Alexandre Marones on 1/30/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "NovelaModel+Parse.h"


@implementation NovelaModel (Parse)

+ (NSArray *)parseChaptersWithNovela:(NSString *)nameNovela {
    NSMutableArray *chapters = [[NSMutableArray alloc] init];
    NSString *url = K_YQL_NOVELA_FUXICO;
    
    url = [url stringByReplacingOccurrencesOfString:@"%@" withString:[self ajustNameNovelaWithString:nameNovela]];
    
    @try {
        [EGOCache setYQL:url withTimeoutInterval:K_CACHE_TIME onSuccessPerform:^(NSString *content, BOOL isNew, NSDate *createdAt, NSError *error) {
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

+ (NSString *)ajustNameNovelaWithString:(NSString *)name {
    name = [name lowercaseString];
    name = [name stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    name = [name removePonctuationFromString];
    return name;
}

@end
