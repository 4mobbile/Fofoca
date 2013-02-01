//
//  NSString+HTML.h
//  Fofoca
//
//  Created by Alexandre Marones on 1/31/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HTML)

- (NSString *)kv_decodeHTMLCharacterEntities;
- (NSString *)kv_encodeHTMLCharacterEntities;

@end
