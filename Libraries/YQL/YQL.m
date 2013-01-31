//
//  YQL.m
//  transitorio
//
//  Created by Uauker on 1/12/13.
//  Copyright (c) 2013 Uauker Inc. All rights reserved.
//

#import "YQL.h"
#import "JSONKit.h"

@implementation YQL

+ (NSArray *)forceArrayWithId:(id)object {
    return ([object isKindOfClass:NSClassFromString(@"JKArray")]) ? object : @[object];
}

@end
