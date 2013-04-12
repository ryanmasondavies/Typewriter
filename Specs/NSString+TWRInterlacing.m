// The MIT License
// 
// Copyright (c) 2013 Ryan Davies
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
