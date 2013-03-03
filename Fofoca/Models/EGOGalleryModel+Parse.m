//
//  EGOGalleryModel+Parse.m
//  Fofoca
//
//  Created by Uauker on 2/27/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "EGOGalleryModel+Parse.h"

@implementation EGOGalleryModel (Parse)

+ (NSArray *)parse {
    __block NSArray *galleries = [[NSArray alloc] init];
    
    [EGOCache setYQL:K_YQL_FOTOGALERIAS withTimeoutInterval:K_CACHE_TIME onSuccessPerform:^(NSString *content, BOOL isNew, NSDate *createdAt, NSError *error) {
        galleries = [EGOGalleryModel parseWithDictionary:[content objectFromJSONString]];
    }];
    
    return galleries;
}

+ (NSArray *)parseWithDictionary:(NSDictionary *)dictionary {
    NSMutableArray *galleries = [[NSMutableArray alloc] init];
    
    @try {
        NSDictionary *root = [[[dictionary objectForKey:@"query"] objectForKey:@"results"] objectForKey:@"div"];
        
        for (NSDictionary *galleryNode in root) {
            EGOGalleryModel *gallery = [[EGOGalleryModel alloc] init];
            gallery.photos = [[NSMutableArray alloc] init];
            
            gallery.title = [[[galleryNode objectForKey:@"p"] objectForKey:@"a"] objectForKey:@"content"];
            gallery.link = [[[galleryNode objectForKey:@"p"] objectForKey:@"a"] objectForKey:@"href"];
            gallery.link = [NSString stringWithFormat:@"%@%@", K_URL_EGO, gallery.link];
            
            for (NSDictionary *photoNode in [[galleryNode objectForKey:@"ul"] objectForKey:@"li"]) {
                EGOPhotoModel *photo = [[EGOPhotoModel alloc] init];
                photo.thumb = [[[photoNode objectForKey:@"a"] objectForKey:@"img"] objectForKey:@"src"];
                
                [gallery.photos addObject:photo];
            }
            
            [galleries addObject:gallery];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Erro no EGOGallery: %@", [exception description]);
    }
    @finally {
        return galleries;
    }
}

@end
