//
//  NovelaModel+Parse.m
//  Fofoca
//
//  Created by Alexandre Marones on 1/30/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "NovelaModel+Parse.h"
#import "JSONKit.h"
#import "EGOCache+PGCache.h"

@implementation NovelaModel (Parse)

+ (NSArray *)parseChaptersWithNovela:(NSString *)nameNovela {
    NSMutableArray *chapters = [[NSMutableArray alloc] init];
    NSString *url = K_YQL_NOVELA_FUXICO;
    
    NovelaModel *novela = [[NovelaModel alloc ] init];
    novela.name = nameNovela;
    
    url = [url stringByReplacingOccurrencesOfString:@"%@" withString:[self ajustNameNovelaWithString:nameNovela]];
    
    @try {
        [EGOCache setYQL:url withTimeoutInterval:K_CACHE_TIME onSuccessPerform:^(NSString *content, NSError *error) {
            NSDictionary *dic = [content objectFromJSONString];
            NSDictionary *result = [[dic objectForKey:@"query"] objectForKey:@"results"];
            
            if (result != nil && ![result isKindOfClass:NSClassFromString(@"NSNull")]) {
                for (NSDictionary *item in [YQL forceArrayWithId:[[result objectForKey:@"div"] objectForKey:@"ul"]]) {
                    NSLog(@"description >>> %@", [item description]);
                    
                }
                for (NSDictionary *item in [result objectForKey:@"canal"]) {
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
    [name lowercaseString];
    name = [name stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    [name removePonctuationFromString];
    return name;
}

@end
