//
//  EGOGalleryModel.h
//  Fofoca
//
//  Created by Uauker on 2/26/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EGOGalleryModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, strong) NSMutableArray *photos;

@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *updatedAt;

+ (NSString *)urlForParseFromSpecifcPhotoGallery:(NSString *)specifcPhotoGallery;

@end
