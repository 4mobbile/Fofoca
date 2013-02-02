//
//  NovelaModel.h
//  Fofoca
//
//  Created by Alexandre Marones on 1/30/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NovelaModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *firstChapterImage;
@property (nonatomic, copy) NSString *firstChapter;
@property (nonatomic, copy) NSArray *chapters;

@end
