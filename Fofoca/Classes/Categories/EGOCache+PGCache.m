//
//  EGOCache+PGCache.m
//  transitorio
//
//  Created by Uauker on 12/9/12.
//  Copyright (c) 2012 Uauker Inc. All rights reserved.
//

#import "EGOCache+PGCache.h"

@implementation EGOCache (PGCache)

+ (void)setUrl:(NSString *)url withTimeoutInterval:(NSTimeInterval)interval onSuccessPerform:(PGCacheCallback)callback {
    NSString *key = [url MD5Hash];
    [EGOCache setUrl:url forKey:key withTimeoutInterval:interval onSuccessPerform:callback];
}

+ (void)setUrl:(NSString *)url forKey:(NSString *)key withTimeoutInterval:(NSTimeInterval)interval onSuccessPerform:(PGCacheCallback)callback {
    NSString *source = @"";
    NSError *error = nil;
    
    if (![[EGOCache globalCache] hasCacheForKey:key]) {        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
        [request setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
        
        NSHTTPURLResponse *response = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        source = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        if (error == nil && [response statusCode] == 200) {
            [[EGOCache globalCache] setString:source forKey:key withTimeoutInterval:interval];
        }
    }
    else {
        NSData *data = [[EGOCache globalCache] dataForKey:key];
        source = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    callback(source, error);
}

+ (void)setYQL:(NSString *)url withTimeoutInterval:(NSTimeInterval)interval onSuccessPerform:(PGCacheCallback)callback {
    NSString *key = [url MD5Hash];
    [EGOCache setYQL:url forKey:key withTimeoutInterval:interval onSuccessPerform:callback];
}

+ (void)setYQL:(NSString *)url forKey:(NSString *)key withTimeoutInterval:(NSTimeInterval)interval onSuccessPerform:(PGCacheCallback)callback {
    url = [NSString stringWithFormat:@"%@&_=%f", url, CFAbsoluteTimeGetCurrent()];
    NSLog(@"Carregando: %@", url);
    
    [EGOCache setUrl:url forKey:key withTimeoutInterval:interval onSuccessPerform:^(NSString *content, NSError *error) {
        NSDictionary *dic = [content objectFromJSONString];
        
        if ([[dic objectForKey:@"query"] objectForKey:@"results"] == nil) {
            [[EGOCache globalCache] removeCacheForKey:key];
        }
        
        callback(content, error);
    }];
}

@end
