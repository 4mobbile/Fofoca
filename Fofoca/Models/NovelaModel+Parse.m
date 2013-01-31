//
//  NovelaModel+Parse.m
//  Fofoca
//
//  Created by Alexandre Marones on 1/30/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "NovelaModel+Parse.h"

@implementation NovelaModel (Parse)

+ (NSArray *)parseNovela {
    NSMutableArray *novelas = [[NSMutableArray alloc] init];
    
    @try {
        NSDictionary *dic = [K_YQL_NOVELAS_FUXICO objectFromJSONString];
        NSDictionary *result = [[dic objectForKey:@"query"] objectForKey:@"results"];
        
        if (result != nil && ![result isKindOfClass:NSClassFromString(@"NSNull")]) {
            for (NSDictionary *item in [result objectForKey:@"canal"]) {
                NSLog(@"description >>> %@", [item description]);
//                if ([item isKindOfClass:NSClassFromString(@"JKDictionary")] && [[item objectForKey:@"font"] objectForKey:@"strong"]) {
//                    CPMovie *movie = [[CPMovie alloc] init];
//                    movie.title = [NSString trim:[[[item objectForKey:@"font"] objectForKey:@"a"] objectForKey:@"content"]];
//                    movie.url = [NSString trim:[[[item objectForKey:@"font"] objectForKey:@"a"] objectForKey:@"href"]];
//                    movie.miniPoster = [NSString trim:[[[[item objectForKey:@"font"] objectForKey:@"a"] objectForKey:@"img"] objectForKey:@"src"]];
//                    movie.dateString = [NSString trim:[[item objectForKey:@"font"] objectForKey:@"strong"]];
//                    
//                    [movies addObject:movie];
//                }
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Erro no parseNovela: %@", [exception description]);
    }
    @finally {
        return novelas;
    }
}


@end
