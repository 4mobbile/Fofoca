//
//  EGOGalleryModel.m
//  Fofoca
//
//  Created by Uauker on 2/26/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "EGOGalleryModel.h"

@implementation EGOGalleryModel

+ (NSString *)urlForParseFromSpecifcPhotoGallery:(NSString *)specifcPhotoGallery {
    return [K_YQL_FOTOGALERIA stringByReplacingOccurrencesOfString:@"%@" withString:specifcPhotoGallery];
}

@end
