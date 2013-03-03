//
//  EGOPhotoModel+Parse.m
//  Fofoca
//
//  Created by Uauker on 3/3/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "EGOPhotoModel+Parse.h"

@implementation EGOPhotoModel (Parse)

+ (EGOPhotoModel *)parseWithDictionary:(NSDictionary *)dicionary {
    EGOPhotoModel *photo = [[EGOPhotoModel alloc] init];
    
    photo.title = [[dicionary objectForKey:@"img"] objectForKey:@"alt"];
    photo.imageUrl = [[dicionary objectForKey:@"img"] objectForKey:@"src"];
    
    photo.credit = [[[[[dicionary objectForKey:@"div"] objectForKey:@"div"] objectForKey:@"span"] lastObject] objectForKey:@"content"];
    
    return photo;
}

@end
