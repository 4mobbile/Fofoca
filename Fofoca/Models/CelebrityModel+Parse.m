//
//  CelebrityModel+Parse.m
//  Fofoca
//
//  Created by Alexandre Marones on 2/28/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "CelebrityModel+Parse.h"

@implementation CelebrityModel (Parse)


+ (NSArray *)parseCelebrity {
    __block NSArray *celebrities = [[NSArray alloc] init];
    
    [EGOCache setYQL:K_YQL_LIST_CELEBRITY withTimeoutInterval:K_CACHE_TIME onSuccessPerform:^(NSString *content, BOOL isNew, NSDate *createdAt, NSError *error) {
        celebrities = [CelebrityModel parseWithDictionary:[content objectFromJSONString]];
    }];
    
    return celebrities;
}

+ (NSArray *)parseWithDictionary:(NSDictionary *)dictionary {
    NSMutableArray *celebrities = [[NSMutableArray alloc] init];
    
    @try {
        NSDictionary *result = [[dictionary objectForKey:@"query"] objectForKey:@"results"];
        
        for (NSDictionary *item in [YQL forceArrayWithId:[result objectForKey:@"li"]]) {
            CelebrityModel *celebrity = [[CelebrityModel alloc] init];
            
            celebrity.name = [[item objectForKey:@"a"] objectForKey:@"content"];
            celebrity.link = [[item objectForKey:@"a"] objectForKey:@"href"];
            
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
