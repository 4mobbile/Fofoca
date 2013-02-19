//
//  ChapterModel+Parse.m
//  Fofoca
//
//  Created by Alexandre Marones on 2/4/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "ChapterModel+Parse.h"

@implementation ChapterModel (Parse)

+ (ChapterModel *)parseChapter:(NSDictionary *)dic {
    ChapterModel *chapter = [[ChapterModel alloc] init];
    chapter.title = [[[dic objectForKey:@"h2"] objectForKey:@"a"] objectForKey:@"content"];
    chapter.exhibitionAt = [[dic objectForKey:@"h6"] objectForKey:@"strong"];
    chapter.image = [NSString stringWithFormat:@"https://ofuxico.terra.com.br%@", [[[dic objectForKey:@"a"] objectForKey:@"img"] objectForKey:@"src"]];
    chapter.url = [NSString stringWithFormat:@"https://ofuxico.terra.com.br%@", [[[dic objectForKey:@"h2"] objectForKey:@"a"] objectForKey:@"href"]];
    
    return chapter;
}

+ (ChapterModel *)parseResumeAndImageChapterWithChapter:(ChapterModel *)chapter {
    
    NSString *url = K_YQL_CHAPTER;
    NSString *chapterUrl = [self ajustUrlWithString:[chapter url]];
    url = [url stringByReplacingOccurrencesOfString:@"%@" withString:chapterUrl];
        
    @try {
        [EGOCache setYQL:url withTimeoutInterval:K_CACHE_TIME onSuccessPerform:^(NSString *content, NSError *error) {
            NSDictionary *dic = [content objectFromJSONString];
            NSDictionary *result = [[dic objectForKey:@"query"] objectForKey:@"results"];

            NSLog(@"result >>> %@", [result description]);
            
            for (NSDictionary *item in [YQL forceArrayWithId:[result objectForKey:@"div"]]) {
                NSLog(@"item >>> %@", [item description]);
                
                if ([[item objectForKey:@"class"] isEqual:@"img"]) {
                    chapter.image = [NSString stringWithFormat:@"%@%@", K_URL_FUXICO, [[item objectForKey:@"img"]  objectForKey:@"src"]];
                }
                
//                if ([[item objectForKey:@"class"] isEqual:@"HOTWordsTxt"]) {
//                    chapter.resume = [item objectForKey:@"p"];
//                }

            }
        }];
    }
    @catch (NSException *exception) {
        NSLog(@"Erro no parseNovela: %@", [exception description]);
    }
    @finally {
        return chapter;
    }
}

+ (NSString *)ajustNameNovelaWithString:(NSString *)name {
    name = [name buildNovelaNameForUrl];
    return name;
}

+ (NSString *)ajustUrlWithString:(NSString *)url {
//    url = [NSString stringWithFormat:@"%@%@", K_URL_FUXICO, url];
    url = [url stringByReplacingOccurrencesOfString:@"/" withString:@"%2F"];
    url = [url stringByReplacingOccurrencesOfString:@":" withString:@"%3A"];
//    url = [NSString stringWithFormat:@"%@%@", K_YQL_CHAPTER, url];
    return url;
}

@end
