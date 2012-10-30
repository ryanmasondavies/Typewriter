//
//  UIApplication+TWRKeyboard.m
//  UDP Remote
//
//  Created by Ryan Davies on 28/10/2012.
//  Copyright (c) 2012 Alcorn McBride. All rights reserved.
//

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
