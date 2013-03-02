//
//  CelebrityModel+Parse.m
//  Fofoca
//
//  Created by Alexandre Marones on 2/28/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "CelebrityModel+Parse.h"

@implementation CelebrityModel (Parse)


+ (NSArray *)parseCelebrities {
    __block NSArray *celebrities = [[NSArray alloc] init];
    
    [EGOCache setYQL:K_YQL_LIST_CELEBRITY withTimeoutInterval:K_CACHE_TIME onSuccessPerform:^(NSString *content, BOOL isNew, NSDate *createdAt, NSError *error) {
        celebrities = [CelebrityModel parseCelebritiesWithDictionary:[content objectFromJSONString]];
    }];
    
    return celebrities;
}

+ (NSArray *)parseCelebritiesWithDictionary:(NSDictionary *)dictionary {
    NSMutableArray *celebrities = [[NSMutableArray alloc] init];
    
    @try {
        NSDictionary *result = [[dictionary objectForKey:@"query"] objectForKey:@"results"];
        
        for (NSDictionary *item in [YQL forceArrayWithId:[result objectForKey:@"li"]]) {
            CelebrityModel *celebrity = [[CelebrityModel alloc] init];
            
            celebrity.name = [[item objectForKey:@"a"] objectForKey:@"content"];
            
            NSString *url = [[item objectForKey:@"a"] objectForKey:@"href"];
            celebrity.link = [NSString stringWithFormat:@"%@%@", K_URL_EGO, url];
            
            [celebrities addObject:celebrity];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Erro em Celebrities: %@", [exception description]);
    }
    @finally {
        return celebrities;
    }
}

+ (NSArray *)parseTopCelebrities {
    __block NSArray *topCelebrities = [[NSArray alloc] init];
    
    [EGOCache setYQL:K_YQL_TOP_CELEBRITY withTimeoutInterval:K_CACHE_TIME onSuccessPerform:^(NSString *content, BOOL isNew, NSDate *createdAt, NSError *error) {
        topCelebrities = [CelebrityModel parseTopCelebritiesWithDictionary:[content objectFromJSONString]];
    }];
    
    return topCelebrities;
}

+ (NSArray *)parseTopCelebritiesWithDictionary:(NSDictionary *)dictionary {
    NSMutableArray *celebrities = [[NSMutableArray alloc] init];
    
    @try {
        NSDictionary *result = [[dictionary objectForKey:@"query"] objectForKey:@"results"];
        
        for (NSDictionary *item in [YQL forceArrayWithId:[result objectForKey:@"li"]]) {
                        
            CelebrityModel *celebrity = [[CelebrityModel alloc] init];
            
            for (NSDictionary *itemDiv in [YQL forceArrayWithId:[item objectForKey:@"div"]]) {
                
                if ([[itemDiv objectForKey:@"class"] isEqualToString:@"cantos-suaves"]) {
                    celebrity.urlPhoto = [[itemDiv objectForKey:@"img"] objectForKey:@"src"];
                    NSLog(@"photo >>> %@", [[item objectForKey:@"img"] description]);
                }
                
                if ([[itemDiv objectForKey:@"class"] isEqualToString:@"agrupador-textual"]) {
                    celebrity.name = [[[itemDiv objectForKey:@"h3"] objectForKey:@"a"] objectForKey:@"content"];
                    NSString *url = [[[itemDiv objectForKey:@"h3"] objectForKey:@"a"] objectForKey:@"href"];
                    celebrity.link = [NSString stringWithFormat:@"%@%@", K_URL_EGO, url];
                    
                    NSLog(@"name >>> %@", celebrity.name);
                }
                
            }
            
            [celebrities addObject:celebrity];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Erro em Celebrity: %@", [exception description]);
    }
    @finally {
        return celebrities;
    }
}

@end
