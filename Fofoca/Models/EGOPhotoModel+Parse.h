//
//  EGOPhotoModel+Parse.h
//  Fofoca
//
//  Created by Uauker on 3/3/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "EGOPhotoModel.h"

@interface EGOPhotoModel (Parse)

+ (EGOPhotoModel *)parseThumbsWithDictionary:(NSDictionary *)dicionary;
+ (EGOPhotoModel *)parseWithDictionary:(NSDictionary *)dicionary;

@end
