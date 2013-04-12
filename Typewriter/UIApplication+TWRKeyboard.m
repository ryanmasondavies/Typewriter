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

#import "UIApplication+TWRKeyboard.h"

@implementation UIView (TWRSearching)

- (NSArray *)subviewsPassingTest:(BOOL (^)(id object, NSUInteger index, BOOL *stop))test recursive:(BOOL)recursive
{
    NSMutableArray *results = [NSMutableArray array];
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger index, BOOL *stop) {
        if (test(subview, index, stop))
            [results addObject:subview];
        
        if (recursive)
            [results addObjectsFromArray:[subview subviewsPassingTest:test recursive:YES]];
    }];
    
    return ([results count] ? [NSArray arrayWithArray:results] : nil);
}

@end

@implementation UIApplication (TWRKeyboard)

- (UIKBKeyplaneView *)keyplaneView
{
    __block UIWindow *keyboardWindow = nil;
    [[self windows] enumerateObjectsUsingBlock:^(UIWindow *window, NSUInteger idx, BOOL *stop) {
        if ([window isKindOfClass:NSClassFromString(@"UITextEffectsWindow")]) {
            keyboardWindow = window;
            *stop = YES;
        }
    }];
    
    BOOL(^classCheck)(UIView *subview, NSUInteger index, BOOL *stop) = ^BOOL(UIView *subview, NSUInteger index, BOOL *stop) {
        return [subview isKindOfClass:NSClassFromString(@"UIKBKeyplaneView")];
    };
    
    return [[keyboardWindow subviewsPassingTest:classCheck recursive:YES] lastObject];;
}

@end
