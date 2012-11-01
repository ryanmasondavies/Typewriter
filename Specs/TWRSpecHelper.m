//
//  TWRSpecHelper.m
//  Typewriter
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRSpecHelper.h"

NSString * TWRStringByMergingStrings(NSArray *strings)
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
};
