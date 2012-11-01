//
//  TWRTypist.m
//  Typewriter
//
//  Created by Ryan Davies on 29/10/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "TWRTypist.h"
#import "UIApplication+TWRKeyboard.h"
#import <Handsy/UIView+HDYGestures.h>

@interface TWRTypist ()

+ (BOOL)pressKeyForRepresentedString:(NSString *)representedString;
+ (BOOL)pressKeyForCharacter:(unichar)character;
+ (BOOL)typeCharacter:(unichar)character;

@end

@implementation TWRTypist

+ (BOOL)pressKeyForRepresentedString:(NSString *)representedString
{
    UIKBKeyplaneView *keyplaneView = [[UIApplication sharedApplication] keyplaneView];
    NSArray *keys = [[keyplaneView keyplane] keys];
    
    __block UIKBTree *key;
    [keys enumerateObjectsUsingBlock:^(UIKBTree *node, NSUInteger idx, BOOL *stop) {
        if ([[node representedString] isEqualToString:representedString]) {
            key = node;
            *stop = YES;
        }
    }];
    
    if (key == nil) return NO;
    
    CGPoint keyCenter;
    keyCenter.x = key.frame.origin.x + (key.frame.size.width / 2);
    keyCenter.y = key.frame.origin.y + (key.frame.size.height / 2);
    [[[UIApplication sharedApplication] keyplaneView] tapAtPosition:keyCenter];
    
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.15f, NO);
    
    return YES;
}

+ (BOOL)pressKeyForCharacter:(unichar)character
{
    return [self pressKeyForRepresentedString:[NSString stringWithFormat:@"%C", character]];
}

+ (BOOL)typeCharacter:(unichar)character
{
    if ([self pressKeyForCharacter:character]) return YES;
    if ([self pressKeyForRepresentedString:@"Shift"] == NO) return NO;
    if ([self pressKeyForCharacter:character]) return YES;
    if ([self pressKeyForRepresentedString:@"More"] == NO) return NO;
    if ([self pressKeyForCharacter:character]) return YES;
    if ([self pressKeyForRepresentedString:@"Shift"] == NO) return NO;
    if ([self pressKeyForCharacter:character]) return YES;
    return NO;
}

+ (BOOL)typeString:(NSString *)string
{
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.15f, NO);
    
    for (NSUInteger index = 0; index < [string length]; index ++) {
        if ([self typeCharacter:[string characterAtIndex:index]] == NO) return NO;
    }
    
    return YES;
}

+ (BOOL)pressReturnKey
{
    return [self pressKeyForRepresentedString:@"\n"];
}

+ (BOOL)pressGoKey
{
    return [self pressReturnKey];
}

+ (BOOL)pressGoogleKey
{
    return [self pressReturnKey];
}

+ (BOOL)pressJoinKey
{
    return [self pressReturnKey];
}

+ (BOOL)pressNextKey
{
    return [self pressReturnKey];
}

+ (BOOL)pressRouteKey
{
    return [self pressReturnKey];
}

+ (BOOL)pressSearchKey
{
    return [self pressReturnKey];
}

+ (BOOL)pressSendKey
{
    return [self pressReturnKey];
}

+ (BOOL)pressYahooKey
{
    return [self pressReturnKey];
}

+ (BOOL)pressDoneKey
{
    return [self pressReturnKey];
}

+ (BOOL)pressEmergencyCallKey
{
    return [self pressReturnKey];
}

@end
