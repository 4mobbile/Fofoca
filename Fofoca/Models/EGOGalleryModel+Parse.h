//
//  EGOGalleryModel+Parse.h
//  Fofoca
//
//  Created by Uauker on 2/27/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "EGOGalleryModel.h"
#import "EGOCache+PGCache.h"
#import "EGOPhotoModel+Parse.h"

@interface EGOGalleryModel (Parse)

+ (NSArray *)parse;
+ (NSArray *)parseWithDictionary:(NSDictionary *)dictionary;

+ (EGOGalleryModel *)parseWithSpecicPhotoGallery:(NSString *)specicPhotoGallery;
+ (EGOGalleryModel *)parseSpecicPhotoGalleryWithDictionary:(NSDictionary *)dictionary;

@end
