//
//  EGOCache+PGCache.m
//  transitorio
//
//  Created by Uauker on 12/9/12.
//  Copyright (c) 2012 Uauker Inc. All rights reserved.
//

#import "EGOCache+PGCache.h"

@implementation EGOCache (PGCache)

+ (BOOL)hasCacheMD5ForKey:(NSString *)url {
    return [[EGOCache globalCache] hasCacheForKey:[url MD5Hash]];
}

+ (void)setUrl:(NSString *)url withTimeoutInterval:(NSTimeInterval)interval onSuccessPerform:(PGCacheCallback)callback {
    NSString *key = [url MD5Hash];
    [EGOCache setUrl:url forKey:key withTimeoutInterval:interval onSuccessPerform:callback];
}

+ (void)setUrl:(NSString *)url forKey:(NSString *)key withTimeoutInterval:(NSTimeInterval)interval onSuccessPerform:(PGCacheCallback)callback {
    NSString *source = @"";
    NSError *error = nil;
    BOOL isNew = NO;
    
    if (![[EGOCache globalCache] hasCacheForKey:key]) {
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
        [request setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
        
        NSHTTPURLResponse *response = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        source = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        if (error == nil && [response statusCode] == 200) {
            isNew = YES;
            [[EGOCache globalCache] setString:source forKey:key withTimeoutInterval:interval];
        }
    }
    else {
        NSData *data = [[EGOCache globalCache] dataForKey:key];
        source = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    callback(source, isNew, error);
}

+ (void)setYQL:(NSString *)url withTimeoutInterval:(NSTimeInterval)interval onSuccessPerform:(PGCacheYQLCallback)callback {
    NSString *key = [url MD5Hash];
    [EGOCache setYQL:url forKey:key withTimeoutInterval:interval onSuccessPerform:callback];
}

+ (void)setYQL:(NSString *)url forKey:(NSString *)key withTimeoutInterval:(NSTimeInterval)interval onSuccessPerform:(PGCacheYQLCallback)callback {
    url = [NSString stringWithFormat:@"%@&_=%f", url, CFAbsoluteTimeGetCurrent()];
    NSLog(@"Carregando: %@", url);
    
    [EGOCache setUrl:url forKey:key withTimeoutInterval:interval onSuccessPerform:^(NSString *content, BOOL isNew, NSError *error) {
        NSDictionary *dic = [content objectFromJSONString];
        
        NSString *dateString = [[dic objectForKey:@"query"] objectForKey:@"created"];
        NSDate *date = [self userVisibleDateTimeStringForRFC3339DateTimeString:dateString];
        
        if ([[dic objectForKey:@"query"] objectForKey:@"results"] == nil) {
            isNew = NO;
            [[EGOCache globalCache] removeCacheForKey:key];
        }
        
        callback(content, isNew, date, error);
    }];
}

#pragma mark - Auxiliary

+ (NSDate *)userVisibleDateTimeStringForRFC3339DateTimeString:(NSString *)rfc3339DateTimeString {
    NSDateFormatter *rfc3339DateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    
    [rfc3339DateFormatter setLocale:enUSPOSIXLocale];
    [rfc3339DateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    [rfc3339DateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    // Convert the RFC 3339 date time string to an NSDate.
    return [rfc3339DateFormatter dateFromString:rfc3339DateTimeString];
}

@end
