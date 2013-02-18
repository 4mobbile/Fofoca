//
//  NSString+PGString.h
//  transitorio
//
//  Created by Uauker on 11/16/12.
//  Copyright (c) 2012 Uauker Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PGString)

+ (BOOL)isThereLink:(NSString *)string;

- (BOOL)containsString:(NSString*)substring;

- (NSString*) removePonctuationWithHifenFromString;
- (NSString*) removePonctuationFromString;
- (NSString *) formatingDateMonth;

+ (NSString *)removeSpecialCharacteres:(NSString *)string;
+ (NSString *)trim:(NSString *)string;

@end
