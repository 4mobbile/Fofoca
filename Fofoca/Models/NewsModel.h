//
//  NewsModel.h
//  Fofoca
//
//  Created by Alexandre Marones on 1/31/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "ActiveRecord.h"

@interface NewsModel : ActiveRecord

@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * publishedAt;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * origin;

@end
