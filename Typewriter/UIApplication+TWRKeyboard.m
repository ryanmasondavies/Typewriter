//
//  UIApplication+TWRKeyboard.m
//  UDP Remote
//
//  Created by Ryan Davies on 28/10/2012.
//  Copyright (c) 2012 Alcorn McBride. All rights reserved.
//

#import "UIApplication+TWRKeyboard.h"
#import "UIView+TWRSearching.h"
#import "TWRKeyboard.h"

@implementation UIApplication (TWRKeyboard)

- (TWRKeyboard *)keyboard
{
    __block UIWindow *keyboardWindow = nil;
    [[self windows] enumerateObjectsUsingBlock:^(UIWindow *window, NSUInteger idx, BOOL *stop) {
        if ([window isKindOfClass:NSClassFromString(@"UITextEffectsWindow")]) {
            keyboardWindow = window;
            *stop = YES;
        }
    }];
    
    BOOL(^classCheck)(UIView *subview, NSUInteger index, BOOL *stop) = ^BOOL(UIView *subview, NSUInteger index, BOOL *stop) {
        return [subview isKindOfClass:NSClassFromString(@"UIKeyboardAutomatic")];
    };
    
    NSArray *possibleKeyboards = [keyboardWindow subviewsPassingTest:classCheck recursive:YES];
    UIView *keyboardView = [possibleKeyboards lastObject];
    
    return [[TWRKeyboard alloc] initWithView:keyboardView];
}

@end
