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
        [EGOCache setYQL:url withTimeoutInterval:K_CACHE_TIME onSuccessPerform:^(NSString *content, NSError *error) {
            NSDictionary *dic = [content objectFromJSONString];
            NSDictionary *result = [[dic objectForKey:@"query"] objectForKey:@"results"];
            
            if (result != nil && ![result isKindOfClass:NSClassFromString(@"NSNull")]) {
                NovelaModel *novela = [[NovelaModel alloc ] init];
                novela.name = nameNovela;
                novela.chapters = [ChapterModel parseChaptersWithDictionary:result];
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
