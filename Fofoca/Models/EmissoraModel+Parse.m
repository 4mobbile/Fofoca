//
//  EmissoraModel+Parse.m
//  Fofoca
//
//  Created by Alexandre Marones on 1/30/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "EmissoraModel+Parse.h"

@implementation EmissoraModel (Parse)

+ (NSArray *)parseEmissora {
    NSMutableArray *emissoras = [[NSMutableArray alloc] init];
    NSMutableArray *novelas = [[NSMutableArray alloc] init];
    
    @try {
        [EGOCache setYQL:K_YQL_EMISSORAS_FUXICO withTimeoutInterval:300 onSuccessPerform:^(NSString *content, NSError *error) {
            NSDictionary *dic = [content objectFromJSONString];
            NSDictionary *result = [[dic objectForKey:@"query"] objectForKey:@"results"];
            
            if (result != nil && ![result isKindOfClass:NSClassFromString(@"NSNull")]) {
                for (NSDictionary *item in [YQL forceArrayWithId:[result objectForKey:@"div"]]) {
                    EmissoraModel *emissora = [[EmissoraModel alloc] init];
                    
                    emissora.name = [[[[item objectForKey:@"div"] objectForKey:@"h4"] objectForKey:@"span"] objectForKey:@"content"];
                    
                    [novelas removeAllObjects];
                    
                    for (NSDictionary *newItem in [YQL forceArrayWithId:[[item objectForKey:@"ul"] objectForKey:@"li"]]) {
                        
                        [novelas addObject:[[[[newItem objectForKey:@"div"] objectForKey:@"h2"] objectForKey:@"a"] objectForKey:@"content"]];
                        
                    }
                    
                    emissora.novelas = novelas;
                    
                    [emissoras addObject:emissora];
                    
                }
            }
        }];
    }
    @catch (NSException *exception) {
        NSLog(@"Erro no parseNovela: %@", [exception description]);
    }
    @finally {
        return emissoras;
    }
}

@end
