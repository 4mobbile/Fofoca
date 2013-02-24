//
//  SignoModel+Parse.m
//  Fofoca
//
//  Created by Alexandre Marones on 2/19/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "SignoModel+Parse.h"

@implementation SignoModel (Parse)

+ (SignoModel *)parseSignoByYQLWithName:(NSString *)nameSigno {
    SignoModel *signo = [[SignoModel alloc] init];
    
    NSString *url = [K_YQL_SIGNO stringByReplacingOccurrencesOfString:@"%@" withString:nameSigno];
    
    @try {
        [EGOCache setYQL:url withTimeoutInterval:300 onSuccessPerform:^(NSString *content, BOOL isNew, NSDate *createdAt, NSError *error) {
            NSDictionary *dic = [content objectFromJSONString];
            NSDictionary *result = [[dic objectForKey:@"query"] objectForKey:@"results"];
            
            if (result != nil && ![result isKindOfClass:NSClassFromString(@"NSNull")]) {
                for (NSDictionary *item in [YQL forceArrayWithId:[result objectForKey:@"p"]]) {
                    if ([[item objectForKey:@"class"] isEqual:@"first"]) {
                        signo.resume = [item objectForKey:@"content"];
                    }
                    
                    if ([[item objectForKey:@"strong"] isEqual:@"Amor:"]) {
                        signo.loveResume = [item objectForKey:@"content"];
                    }

                }
            }
        }];
    }
    @catch (NSException *exception) {
        NSLog(@"Erro no parseNovela: %@", [exception description]);
    }
    @finally {
        return signo;
    }
}

@end
