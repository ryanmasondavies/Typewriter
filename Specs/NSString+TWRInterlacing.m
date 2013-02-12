//
//  NSString+TWRInterlacing.m
//  Typewriter
//
//  Created by Ryan Davies on 12/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "NSString+TWRInterlacing.h"

@implementation NSString (TWRInterlacing)

+ (NSString *)stringByInterlacingStrings:(NSArray *)strings
{
    __block NSUInteger maxLength = 0;
    [strings enumerateObjectsUsingBlock:^(NSString *string, NSUInteger idx, BOOL *stop) {
        if ([string length] > maxLength) maxLength = [string length];
    }];
    
    NSMutableString *result = [NSMutableString string];
    for (NSUInteger i = 0; i < maxLength; i ++) {
        [strings enumerateObjectsUsingBlock:^(NSString *string, NSUInteger idx, BOOL *stop) {
            if (i < [string length]) [result appendFormat:@"%C", [string characterAtIndex:i]];
        }];
    }
    
    return [NSString stringWithString:result];
}

@end
