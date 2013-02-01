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

+ (NSArray *)parseNovela {
    NSMutableArray *novelas = [[NSMutableArray alloc] init];
    
    @try {
        [EGOCache setYQL:K_YQL_NOVELAS_FUXICO withTimeoutInterval:300 onSuccessPerform:^(NSString *content, NSError *error) {
            NSDictionary *dic = [content objectFromJSONString];
            NSDictionary *result = [[dic objectForKey:@"query"] objectForKey:@"results"];
            
            if (result != nil && ![result isKindOfClass:NSClassFromString(@"NSNull")]) {
                for (NSDictionary *item in [result objectForKey:@"canal"]) {
                    NSLog(@"description >>> %@", [item description]);
                }
            }
        }];
    }
    @catch (NSException *exception) {
        NSLog(@"Erro no parseNovela: %@", [exception description]);
    }
    @finally {
        return novelas;
    }
}


@end
