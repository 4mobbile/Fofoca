//
//  SignoModel+Parse.h
//  Fofoca
//
//  Created by Alexandre Marones on 2/19/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import "SignoModel.h"
#import "Global.h"
#import "JSONKit.h"
#import "EGOCache+PGCache.h"
#import "YQL.h"

@interface SignoModel (Parse)

+ (SignoModel *)parseSignoByYQLWithName:(NSString *)nameSigno;


@end
