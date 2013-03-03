//
//  EGOGalleryModel+Parse.m
//  Fofoca
//
//  Created by Uauker on 2/27/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "EGOGalleryModel+Parse.h"

@implementation EGOGalleryModel (Parse)

//TODO: Metodo nao deve existir no modelo....
//Esse codigo deve estar presente no viewcontroller
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
            
            gallery.title = [[[galleryNode objectForKey:@"p"] objectForKey:@"a"] objectForKey:@"content"];
            gallery.link = [[[galleryNode objectForKey:@"p"] objectForKey:@"a"] objectForKey:@"href"];
            gallery.link = [NSString stringWithFormat:@"%@%@", K_URL_EGO, gallery.link];
            
            for (NSDictionary *photoNode in [[galleryNode objectForKey:@"ul"] objectForKey:@"li"]) {                
                [gallery.photos addObject:[EGOPhotoModel parseThumbsWithDictionary:photoNode]];
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

//TODO: Metodo nao deve existir no modelo....
//Esse codigo deve estar presente no viewcontroller
+ (EGOGalleryModel *)parseWithSpecicPhotoGallery:(NSString *)specicPhotoGallery {
    __block EGOGalleryModel *gallery = [[EGOGalleryModel alloc] init];
    specicPhotoGallery = [EGOGalleryModel urlForParseFromSpecifcPhotoGallery:specicPhotoGallery];
    
    [EGOCache setYQL:specicPhotoGallery withTimeoutInterval:K_CACHE_TIME onSuccessPerform:^(NSString *content, BOOL isNew, NSDate *createdAt, NSError *error) {
        gallery = [EGOGalleryModel parseSpecicPhotoGalleryWithDictionary:[content objectFromJSONString]];
    }];
    
    return gallery;
}

+ (EGOGalleryModel *)parseSpecicPhotoGalleryWithDictionary:(NSDictionary *)dictionary {
    EGOGalleryModel *gallery = [[EGOGalleryModel alloc] init];
    
    @try {
        NSDictionary *root = [[dictionary objectForKey:@"query"] objectForKey:@"results"];
        
        if ([root objectForKey:@"span"] && [[[root objectForKey:@"span"] objectAtIndex:0] objectForKey:@"content"]) {
            gallery.createdAt = [[[root objectForKey:@"span"] objectAtIndex:0] objectForKey:@"content"];
        }

        if ([root objectForKey:@"span"] && [[[root objectForKey:@"span"] objectAtIndex:1] objectForKey:@"content"]) {
            gallery.updatedAt = [[[root objectForKey:@"span"] objectAtIndex:1] objectForKey:@"content"];
        }
        
        if ([root objectForKey:@"h1"]) {
            gallery.title = [[root objectForKey:@"h1"] objectForKey:@"content"];
        }
        
        for (NSDictionary *dictionaryPhoto in [root objectForKey:@"li"]) {
            [gallery.photos addObject:[EGOPhotoModel parseWithDictionary:dictionaryPhoto]];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Erro no SpecifcEGOGallery: %@", [exception description]);
    }
    @finally {
        return gallery;
    }
}

@end
