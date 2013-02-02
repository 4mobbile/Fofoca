//
//  NSString+PGString.m
//  transitorio
//
//  Created by Uauker on 11/16/12.
//  Copyright (c) 2012 Uauker Inc. All rights reserved.
//

#import "NSString+PGString.h"

@implementation NSString (PGString)

+ (BOOL)isThereLink:(NSString *)string {
    NSDataDetector* detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    return ([[detector matchesInString:string options:0 range:NSMakeRange(0, [string length])] count] > 0);
}

- (BOOL)containsString:(NSString*)substring {
    NSRange range = [self rangeOfString : substring];
    BOOL found = ( range.location != NSNotFound );
    return found;
}

-(NSString*) removePonctuationFromString {
    //remove any accents and punctuation;
    NSString *a = self;
    a=[[NSString alloc] initWithData:[a dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES] encoding:NSASCIIStringEncoding];
    
    a=[a stringByReplacingOccurrencesOfString:@" " withString:@""];
    a=[a stringByReplacingOccurrencesOfString:@"'" withString:@""];
    a=[a stringByReplacingOccurrencesOfString:@"`" withString:@""];
    a=[a stringByReplacingOccurrencesOfString:@"-" withString:@""];
    a=[a stringByReplacingOccurrencesOfString:@"_" withString:@""];
    a=[a stringByReplacingOccurrencesOfString:@"?" withString:@""];    
    a=[a stringByReplacingOccurrencesOfString:@"ç" withString:@"c"];
    a=[a lowercaseString];
    return a;
}

+ (NSString *)removeSpecialCharacteres:(NSString *)string {
    NSData *temp = [string dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    return [[NSString alloc] initWithData:temp encoding:NSASCIIStringEncoding];
}

+ (NSString *)trim:(NSString *)string {
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)formatingDateMonth {
    NSArray *dateSplited = [self componentsSeparatedByString:@"/"];
    NSString *mes = [[NSString alloc] init];
    if ([[dateSplited objectAtIndex:1] isEqualToString:@"01"]) {
        mes = @"Janeiro";
    } else if ([[dateSplited objectAtIndex:1] isEqualToString:@"02"]) {
        mes = @"Fevereiro";
    } else if ([[dateSplited objectAtIndex:1] isEqualToString:@"03"]) {
        mes = @"Março";
    } else if ([[dateSplited objectAtIndex:1] isEqualToString:@"04"]) {
        mes = @"Abril";
    } else if ([[dateSplited objectAtIndex:1] isEqualToString:@"05"]) {
        mes = @"Maio";
    } else if ([[dateSplited objectAtIndex:1] isEqualToString:@"06"]) {
        mes = @"Junho";
    } else if ([[dateSplited objectAtIndex:1] isEqualToString:@"07"]) {
        mes = @"Julho";
    } else if ([[dateSplited objectAtIndex:1] isEqualToString:@"08"]) {
        mes = @"Agosto";
    } else if ([[dateSplited objectAtIndex:1] isEqualToString:@"09"]) {
        mes = @"Setembro";
    } else if ([[dateSplited objectAtIndex:1] isEqualToString:@"10"]) {
        mes = @"Outubro";
    } else if ([[dateSplited objectAtIndex:1] isEqualToString:@"11"]) {
        mes = @"Novembro";
    } else if ([[dateSplited objectAtIndex:1] isEqualToString:@"12"]) {
        mes = @"Dezembro";
    }
    
    NSString *correctDateString = [NSString stringWithFormat:@"%@ de %@ de 2013", [dateSplited objectAtIndex:0], mes];
    
    return correctDateString;
}


@end
